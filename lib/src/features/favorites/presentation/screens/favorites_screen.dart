import 'package:flutter/material.dart';
// Assuming FurnitureItem is in home_screen.dart or moved to a shared models directory
// For now, let's copy it here or ensure it's accessible.
// Ideally, models should be in lib/src/core/models/ or lib/src/features/furniture/domain/models/
// For simplicity, let's assume we can access a shared list of items for now.

// TODO: This should come from a shared model location
class FurnitureItem {
  final String id;
  final String name;
  final String imagePath;
  bool isFavorite;

  FurnitureItem({
    required this.id,
    required this.name,
    required this.imagePath,
    this.isFavorite = false,
  });
}

// Placeholder: This list should be managed by a state solution (e.g., Riverpod)
// and be the single source of truth for all furniture items.
// For now, we'll define a sample list here. In a real app, this would be fetched or shared.
final List<FurnitureItem> _allItems = [
  FurnitureItem(
      id: '1',
      name: 'Modern Wardrobe',
      imagePath: 'assets/images/furniture_wardrobe_1.png',
      isFavorite: true),
  FurnitureItem(
      id: '2',
      name: 'Classic Armchair',
      imagePath: 'assets/images/furniture_armchair_grey.png',
      isFavorite: false),
  FurnitureItem(
      id: '3',
      name: 'Comfy Single Chair',
      imagePath: 'assets/images/furniture_armchair_single_grey.png',
      isFavorite: true),
  FurnitureItem(
      id: '4',
      name: 'Elegant Wardrobe',
      imagePath: 'assets/images/furniture_wardrobe_2.png',
      isFavorite: false),
  FurnitureItem(
      id: '5',
      name: 'Another Wardrobe',
      imagePath: 'assets/images/furniture_wardrobe_1.png',
      isFavorite: true),
  FurnitureItem(
      id: '6',
      name: 'Another Armchair',
      imagePath: 'assets/images/furniture_armchair_grey.png',
      isFavorite: true),
];

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<FurnitureItem> _favoriteItems = [];

  @override
  void initState() {
    super.initState();
    _loadFavoriteItems();
  }

  void _loadFavoriteItems() {
    // In a real app, you'd observe a list from a state manager (Riverpod, Bloc, etc.)
    // For now, we filter the global placeholder list.
    setState(() {
      _favoriteItems = _allItems.where((item) => item.isFavorite).toList();
    });
  }

  void _onFavoriteToggle(String itemId) {
    // This is a local toggle for demonstration.
    // In a real app, this action would update the central state.
    setState(() {
      final item = _allItems.firstWhere((i) => i.id == itemId);
      item.isFavorite = !item.isFavorite;
      _loadFavoriteItems(); // Reload to reflect change
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
        // backgroundColor: theme.scaffoldBackgroundColor, // Match background if no elevation desired
        // foregroundColor: theme.colorScheme.onSurface,   // Ensure text is visible
        // elevation: 0, // Flat app bar like the design
        // centerTitle: false, // Align title to the left
      ),
      body: _favoriteItems.isEmpty
          ? const Center(
              child: Text(
                'No favorite items yet.\nAdd some from the home screen!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio:
                    0.75, // Adjust as needed for your item card proportions
              ),
              itemCount: _favoriteItems.length,
              itemBuilder: (context, index) {
                final item = _favoriteItems[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 2.0,
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
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                  child: Icon(Icons.broken_image, size: 40));
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(
                                item.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: item.isFavorite
                                    ? theme.colorScheme.error
                                    : theme.disabledColor,
                              ),
                              onPressed: () => _onFavoriteToggle(item.id),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
