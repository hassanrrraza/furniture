import 'dart:math';
import 'package:flutter/material.dart';
import 'package:furniture_app/src/features/home/data/datasources/mock_furniture_data.dart';
import 'package:furniture_app/src/features/home/domain/models/furniture_item.dart';
import 'package:furniture_app/src/features/main_navigation/presentation/screens/app_scaffold_with_bottom_nav.dart';
import 'package:furniture_app/src/features/style_quiz/domain/models/quiz_models.dart';
import 'package:furniture_app/src/features/style_quiz/domain/models/style_information.dart';
import 'package:furniture_app/src/features/style_quiz/domain/services/quiz_service.dart';

class EnhancedSuggestionScreen extends StatelessWidget {
  final QuizResult quizResult;

  const EnhancedSuggestionScreen({
    super.key,
    required this.quizResult,
  });

  List<FurnitureItem> _generateSuggestions() {
    final List<FurnitureItem> suggestions = [];
    final Random random = Random();

    final List<ProductCategory> categoriesToSuggest = [
      ProductCategory.beds,
      ProductCategory.chairs,
      ProductCategory.sofa,
      ProductCategory.lamps,
    ];

    for (ProductCategory category in categoriesToSuggest) {
      List<FurnitureItem> candidates = mockFurnitureItems
          .where((item) =>
              item.productCategory == category && 
              item.style == quizResult.dominantStyle)
          .toList();

      if (candidates.isNotEmpty) {
        candidates.shuffle(random);
        suggestions.add(candidates.first);
      } else if (quizResult.secondaryStyle != null) {
        // Try secondary style
        candidates = mockFurnitureItems
            .where((item) =>
                item.productCategory == category &&
                item.style == quizResult.secondaryStyle)
            .toList();
        if (candidates.isNotEmpty) {
          candidates.shuffle(random);
          suggestions.add(candidates.first);
        }
      }
    }
    return suggestions;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final List<FurnitureItem> suggestedItems = _generateSuggestions();
    final StyleInformation styleInfo = quizResult.styleInformation;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Style Profile'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const AppScaffoldWithBottomNav()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Style Result Header
            _buildStyleHeader(theme, styleInfo),
            const SizedBox(height: 24),

            // Style Breakdown Chart
            _buildStyleBreakdown(theme),
            const SizedBox(height: 24),

            // Color Palette Section
            _buildColorPalette(theme, styleInfo),
            const SizedBox(height: 24),

            // Design Elements Section
            _buildDesignElements(theme, styleInfo),
            const SizedBox(height: 24),

            // Materials Section
            _buildMaterials(theme, styleInfo),
            const SizedBox(height: 24),

            // Furniture Suggestions
            _buildFurnitureSuggestions(theme, suggestedItems),
            const SizedBox(height: 24),

            // Personalized Recommendations
            _buildRecommendations(theme),
            const SizedBox(height: 24),

            // Action Buttons
            _buildActionButtons(context, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildStyleHeader(ThemeData theme, StyleInformation styleInfo) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primaryContainer,
            theme.colorScheme.secondaryContainer,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            'Your Dominant Style',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            styleInfo.title,
            style: theme.textTheme.displaySmall?.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            styleInfo.description,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            QuizService.getStyleDescription(
              quizResult.stylePercentages,
              quizResult.dominantStyle,
            ),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStyleBreakdown(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Style Breakdown',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...quizResult.stylePercentages.entries.map((entry) {
              final percentage = entry.value;
              final styleName = _getStyleName(entry.key);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(styleName, style: theme.textTheme.bodyMedium),
                        Text('${percentage.toStringAsFixed(1)}%',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                    const SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: percentage / 100,
                      backgroundColor: theme.colorScheme.surfaceContainerHighest,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        entry.key == quizResult.dominantStyle
                            ? theme.colorScheme.primary
                            : theme.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildColorPalette(ThemeData theme, StyleInformation styleInfo) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Color Palette',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: styleInfo.colorPalette.map((color) {
                return Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(int.parse('0xFF${color.hexColor.substring(1)}')),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: theme.colorScheme.outline,
                          width: 2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      color.name,
                      style: theme.textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesignElements(ThemeData theme, StyleInformation styleInfo) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Key Design Elements',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: styleInfo.designElements.map((element) {
                return Chip(
                  label: Text(element),
                  backgroundColor: theme.colorScheme.secondaryContainer,
                  labelStyle: TextStyle(
                    color: theme.colorScheme.onSecondaryContainer,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterials(ThemeData theme, StyleInformation styleInfo) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommended Materials',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: styleInfo.materials.map((material) {
                return Chip(
                  label: Text(material),
                  backgroundColor: theme.colorScheme.tertiaryContainer,
                  labelStyle: TextStyle(
                    color: theme.colorScheme.onTertiaryContainer,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFurnitureSuggestions(ThemeData theme, List<FurnitureItem> suggestedItems) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Furniture Suggestions',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            if (suggestedItems.isNotEmpty)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemCount: suggestedItems.length,
                itemBuilder: (context, index) {
                  final item = suggestedItems[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.grey[100],
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              item.imagePath,
                              fit: BoxFit.contain,
                              errorBuilder: (ctx, err, st) => const Center(
                                child: Icon(Icons.chair, size: 40),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            item.name,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            else
              const Center(
                child: Text('No suggestions available at this time.'),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendations(ThemeData theme) {
    final recommendations = QuizService.getPersonalizedRecommendations(quizResult);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personalized Recommendations',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...recommendations.map((recommendation) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      color: theme.colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        recommendation,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, ThemeData theme) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              // TODO: Implement retake quiz functionality
              Navigator.pop(context);
            },
            child: const Text('Retake Quiz'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const AppScaffoldWithBottomNav()),
                (Route<dynamic> route) => false,
              );
            },
            child: const Text('Explore Furniture'),
          ),
        ),
      ],
    );
  }

  String _getStyleName(StyleType styleType) {
    switch (styleType) {
      case StyleType.modern:
        return 'Modern';
      case StyleType.classic:
        return 'Classic';
      case StyleType.minimalist:
        return 'Minimalist';
      case StyleType.bohemian:
        return 'Bohemian';
      default:
        return 'Unknown';
    }
  }
}