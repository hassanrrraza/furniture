class FurnitureItem {
  final String name;
  final String category;
  final String imagePath;
  bool isFavorite; // Changed to non-final to allow toggling

  FurnitureItem({
    required this.name,
    required this.category,
    required this.imagePath,
    this.isFavorite = false,
  });

  // Optional: Add a copyWith method for easier state updates if needed later
  FurnitureItem copyWith({
    String? name,
    String? category,
    String? imagePath,
    bool? isFavorite,
  }) {
    return FurnitureItem(
      name: name ?? this.name,
      category: category ?? this.category,
      imagePath: imagePath ?? this.imagePath,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
