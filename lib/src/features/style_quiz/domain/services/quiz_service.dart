import 'package:furniture_app/src/features/style_quiz/domain/models/quiz_models.dart';
import 'package:furniture_app/src/features/style_quiz/domain/models/style_information.dart';
import 'package:furniture_app/src/features/style_quiz/data/style_database.dart';

/// Service class for handling quiz logic, scoring, and result generation
class QuizService {
  /// Calculate quiz results from user answers and style votes
  static QuizResult calculateQuizResult({
    required Map<StyleType, int> styleVotes,
    required List<Map<String, String>> userAnswers,
  }) {
    // Calculate total votes
    final int totalVotes = styleVotes.values.fold(0, (sum, votes) => sum + votes);
    
    // Calculate percentages for each style
    final Map<StyleType, double> stylePercentages = {};
    for (final entry in styleVotes.entries) {
      stylePercentages[entry.key] = totalVotes > 0 ? (entry.value / totalVotes) * 100 : 0.0;
    }

    // Determine dominant style (highest score)
    StyleType dominantStyle = StyleType.modern; // Default
    int maxVotes = 0;
    for (final entry in styleVotes.entries) {
      if (entry.value > maxVotes) {
        maxVotes = entry.value;
        dominantStyle = entry.key;
      }
    }

    // Determine secondary style (second highest score)
    StyleType? secondaryStyle;
    int secondMaxVotes = 0;
    for (final entry in styleVotes.entries) {
      if (entry.key != dominantStyle && entry.value > secondMaxVotes) {
        secondMaxVotes = entry.value;
        secondaryStyle = entry.key;
      }
    }

    // Only set secondary style if it has meaningful votes (at least 1)
    if (secondMaxVotes == 0) {
      secondaryStyle = null;
    }

    // Get comprehensive style information
    final StyleInformation styleInformation = StyleDatabase.getStyleInformation(dominantStyle);

    return QuizResult(
      dominantStyle: dominantStyle,
      secondaryStyle: secondaryStyle,
      styleScores: Map.from(styleVotes),
      stylePercentages: stylePercentages,
      styleInformation: styleInformation,
      userAnswers: List.from(userAnswers),
    );
  }

  /// Get style compatibility score between two styles (0.0 to 1.0)
  static double getStyleCompatibility(StyleType style1, StyleType style2) {
    if (style1 == style2) return 1.0;

    // Define compatibility matrix
    const Map<StyleType, Map<StyleType, double>> compatibilityMatrix = {
      StyleType.modern: {
        StyleType.minimalist: 0.8,
        StyleType.classic: 0.3,
        StyleType.bohemian: 0.2,
      },
      StyleType.minimalist: {
        StyleType.modern: 0.8,
        StyleType.classic: 0.2,
        StyleType.bohemian: 0.1,
      },
      StyleType.classic: {
        StyleType.modern: 0.3,
        StyleType.minimalist: 0.2,
        StyleType.bohemian: 0.6,
      },
      StyleType.bohemian: {
        StyleType.modern: 0.2,
        StyleType.minimalist: 0.1,
        StyleType.classic: 0.6,
      },
    };

    return compatibilityMatrix[style1]?[style2] ?? 0.0;
  }

  /// Get style description based on percentage scores
  static String getStyleDescription(Map<StyleType, double> percentages, StyleType dominantStyle) {
    final double dominantPercentage = percentages[dominantStyle] ?? 0.0;
    
    if (dominantPercentage >= 70) {
      return 'You have a strong preference for ${_styleTypeToString(dominantStyle)} style!';
    } else if (dominantPercentage >= 50) {
      return 'You lean towards ${_styleTypeToString(dominantStyle)} style with some eclectic influences.';
    } else {
      return 'You have an eclectic taste with a slight preference for ${_styleTypeToString(dominantStyle)} style.';
    }
  }

  /// Convert StyleType enum to readable string
  static String _styleTypeToString(StyleType style) {
    switch (style) {
      case StyleType.modern:
        return 'Modern';
      case StyleType.classic:
        return 'Classic';
      case StyleType.minimalist:
        return 'Minimalist';
      case StyleType.bohemian:
        return 'Bohemian';
    }
  }

  /// Get personalized recommendations based on quiz results
  static List<String> getPersonalizedRecommendations(QuizResult result) {
    final List<String> recommendations = [];
    final StyleInformation info = result.styleInformation;
    
    // Add style-specific recommendations
    recommendations.addAll([
      'Focus on ${info.title.toLowerCase()} furniture pieces that emphasize ${info.designElements.take(2).join(' and ')}',
      'Incorporate colors from your style palette: ${info.colorPalette.take(3).map((c) => c.name).join(', ')}',
      'Choose materials like ${info.materials.take(3).join(', ')} to stay true to your style',
    ]);

    // Add secondary style recommendations if applicable
    if (result.secondaryStyle != null) {
      final secondaryInfo = StyleDatabase.getStyleInformation(result.secondaryStyle!);
      recommendations.add(
        'Consider mixing in some ${secondaryInfo.title.toLowerCase()} elements like ${secondaryInfo.designElements.first.toLowerCase()}'
      );
    }

    return recommendations;
  }
}