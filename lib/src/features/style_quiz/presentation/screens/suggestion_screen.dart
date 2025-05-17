import 'dart:math'; // For Random

import 'package:flutter/material.dart';
import 'package:furniture_app/src/features/home/data/datasources/mock_furniture_data.dart';
import 'package:furniture_app/src/features/home/domain/models/furniture_item.dart';
import 'package:furniture_app/src/features/main_navigation/presentation/screens/app_scaffold_with_bottom_nav.dart';
import 'package:furniture_app/src/features/style_quiz/domain/models/quiz_models.dart';

class SuggestionScreen extends StatelessWidget {
  final StyleType dominantStyle;
  final List<Map<String, String>>
      quizAnswers; // e.g., [{'question': 'text', 'answer': 'text'}]

  const SuggestionScreen({
    super.key,
    required this.dominantStyle,
    required this.quizAnswers,
  });

  List<FurnitureItem> _generateSuggestions() {
    final List<FurnitureItem> suggestions = [];
    final Random random = Random();

    // Define categories to find suggestions for
    final List<ProductCategory> categoriesToSuggest = [
      ProductCategory.beds,
      ProductCategory.chairs,
      ProductCategory.sofa,
      ProductCategory.lamps,
    ];

    for (ProductCategory category in categoriesToSuggest) {
      List<FurnitureItem> candidates = mockFurnitureItems
          .where((item) =>
              item.productCategory == category && item.style == dominantStyle)
          .toList();

      if (candidates.isNotEmpty) {
        candidates.shuffle(random);
        suggestions.add(candidates.first);
      } else {
        // Fallback 1: Visually similar style
        StyleType? fallbackStyle;
        if (dominantStyle == StyleType.modern) {
          fallbackStyle = StyleType.minimalist;
        }
        if (dominantStyle == StyleType.minimalist) {
          fallbackStyle = StyleType.modern;
        }
        if (dominantStyle == StyleType.classic) {
          fallbackStyle = StyleType.bohemian;
        }
        if (dominantStyle == StyleType.bohemian) {
          fallbackStyle = StyleType.classic;
        }

        if (fallbackStyle != null) {
          candidates = mockFurnitureItems
              .where((item) =>
                  item.productCategory == category &&
                  item.style == fallbackStyle)
              .toList();
          if (candidates.isNotEmpty) {
            candidates.shuffle(random);
            suggestions.add(candidates.first);
            continue; // Move to next category
          }
        }

        // Fallback 2: Any item from the category if primary and similar style failed
        candidates = mockFurnitureItems
            .where((item) => item.productCategory == category)
            .toList();
        if (candidates.isNotEmpty) {
          candidates.shuffle(random);
          suggestions.add(candidates.first);
        } else {
          // Fallback 3: If category is empty (should ideally not happen with good mock data)
          // Add a placeholder or skip. For now, we add a dummy item to show the slot.
          // In a real app, you might have a specific placeholder FurnitureItem model.
          // suggestions.add(FurnitureItem(name: 'No Suggestion', imagePath: 'assets/images/app_logo.png', productCategory: category, style: dominantStyle, isFavorite: false));
        }
      }
    }
    return suggestions;
  }

  String _styleTypeToString(StyleType style) {
    switch (style) {
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

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final List<FurnitureItem> suggestedItems = _generateSuggestions();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Style Suggestions'),
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
            Center(
              child: Column(
                children: [
                  Text(
                    'Your Dominant Style Is:',
                    style: theme.textTheme.titleLarge
                        ?.copyWith(color: theme.colorScheme.secondary),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _styleTypeToString(dominantStyle),
                    style: theme.textTheme.displaySmall?.copyWith(
                        color: theme.primaryColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Personalized Suggestions For You:',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            if (suggestedItems.isNotEmpty)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.75, // Adjust as needed
                ),
                itemCount: suggestedItems.length,
                itemBuilder: (context, index) {
                  final item = suggestedItems[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.grey[200],
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              item.imagePath,
                              fit: BoxFit.contain,
                              errorBuilder: (ctx, err, st) => const Center(
                                  child: Icon(Icons.broken_image,
                                      size: 30, color: Colors.redAccent)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            item.name,
                            style: theme.textTheme.titleSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
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
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'Could not generate suggestions at this time. Please try the quiz again.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            const SizedBox(height: 30),
            Text(
              'Your Quiz Answers:',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: quizAnswers.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final answerMap = quizAnswers[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Q: ${answerMap['question']}',
                        style: theme.textTheme.titleSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'A: ${answerMap['answer']}',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AppScaffoldWithBottomNav()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text('Back to Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
