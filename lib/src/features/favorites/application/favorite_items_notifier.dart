import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_app/src/features/home/domain/models/furniture_item.dart';

class FavoriteItemsNotifier extends StateNotifier<List<FurnitureItem>> {
  FavoriteItemsNotifier() : super([]); // Initial state is an empty list

  void toggleFavorite(FurnitureItem item) {
    // Check if the item is already a favorite by its imagePath (acting as a unique ID)
    final bool isCurrentlyFavorite =
        state.any((favItem) => favItem.imagePath == item.imagePath);

    if (isCurrentlyFavorite) {
      // Remove from favorites
      state = state
          .where((favItem) => favItem.imagePath != item.imagePath)
          .toList();
    } else {
      // Add to favorites
      state = [...state, item];
    }
  }

  bool isFavorite(FurnitureItem item) {
    return state.any((favItem) => favItem.imagePath == item.imagePath);
  }
}

final favoriteItemsProvider =
    StateNotifierProvider<FavoriteItemsNotifier, List<FurnitureItem>>((ref) {
  return FavoriteItemsNotifier();
});
