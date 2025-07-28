import 'package:furniture_app/src/features/style_quiz/domain/models/quiz_models.dart';

/// Comprehensive information about a furniture style including colors, design elements, and characteristics
class StyleInformation {
  final StyleType styleType;
  final String title;
  final String description;
  final String detailedDescription;
  final List<StyleColor> colorPalette;
  final List<String> designElements;
  final List<String> materials;
  final List<String> characteristics;
  final List<String> furnitureRecommendations;
  final String imageAsset;

  const StyleInformation({
    required this.styleType,
    required this.title,
    required this.description,
    required this.detailedDescription,
    required this.colorPalette,
    required this.designElements,
    required this.materials,
    required this.characteristics,
    required this.furnitureRecommendations,
    required this.imageAsset,
  });
}

/// Represents a color in the style palette with name and hex value
class StyleColor {
  final String name;
  final String hexColor;
  final ColorType type;

  const StyleColor({
    required this.name,
    required this.hexColor,
    required this.type,
  });
}

/// Types of colors in a style palette
enum ColorType {
  primary,
  secondary,
  accent,
  neutral,
}

/// Quiz result with scoring and comprehensive style information
class QuizResult {
  final StyleType dominantStyle;
  final StyleType? secondaryStyle;
  final Map<StyleType, int> styleScores;
  final Map<StyleType, double> stylePercentages;
  final StyleInformation styleInformation;
  final List<Map<String, String>> userAnswers;

  const QuizResult({
    required this.dominantStyle,
    this.secondaryStyle,
    required this.styleScores,
    required this.stylePercentages,
    required this.styleInformation,
    required this.userAnswers,
  });
}