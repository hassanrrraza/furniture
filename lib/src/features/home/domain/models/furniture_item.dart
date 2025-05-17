import 'package:furniture_app/src/features/style_quiz/domain/models/quiz_models.dart'; // Import StyleType

// Enum for the different product categories
enum ProductCategory {
  all, // Keep 'all' for filter purposes, though items won't be 'all'
  beds,
  chairs,
  sofa,
  lamps,
}

class FurnitureItem {
  final String name;
  final String imagePath;
  // final String category; // Old category, to be replaced by ProductCategory
  final ProductCategory productCategory; // New enum-based category
  final StyleType style; // New style property
  bool isFavorite; // Keep this if used, or manage externally if preferred

  FurnitureItem({
    required this.name,
    required this.imagePath,
    // required this.category, // Old
    required this.productCategory,
    required this.style,
    this.isFavorite = false,
  });

  // If you need a copyWith method, especially if managing state immutably
  FurnitureItem copyWith({
    String? name,
    String? imagePath,
    ProductCategory? productCategory,
    StyleType? style,
    bool? isFavorite,
  }) {
    return FurnitureItem(
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      productCategory: productCategory ?? this.productCategory,
      style: style ?? this.style,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
