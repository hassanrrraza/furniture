import 'package:flutter/material.dart';

// Placeholder data models (we'll refine these)
class FurnitureCategory {
  final String name;
  final IconData? icon; // For Material icons
  // final String? customIconPath; // For SVG/PNG icons

  const FurnitureCategory({required this.name, this.icon});
}

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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'All';

  // Placeholder data - replace with actual data source/state management
  final List<FurnitureCategory> _categories = [
    const FurnitureCategory(name: 'All'),
    const FurnitureCategory(name: 'Chairs', icon: Icons.chair_outlined),
    const FurnitureCategory(name: 'Beds', icon: Icons.bed_outlined),
    const FurnitureCategory(
        name: 'Sofa', icon: Icons.living_outlined), // Example icon
    const FurnitureCategory(name: 'Lamps', icon: Icons.lightbulb_outline),
  ];

  final List<FurnitureItem> _items = [
    FurnitureItem(
        id: '1',
        name: 'Modern Wardrobe',
        imagePath: 'assets/images/furniture_wardrobe_1.png'),
    FurnitureItem(
        id: '2',
        name: 'Classic Armchair',
        imagePath: 'assets/images/furniture_armchair_grey.png'),
    FurnitureItem(
        id: '3',
        name: 'Comfy Single Chair',
        imagePath: 'assets/images/furniture_armchair_single_grey.png'),
    FurnitureItem(
        id: '4',
        name: 'Elegant Wardrobe',
        imagePath: 'assets/images/furniture_wardrobe_2.png'),
    // Add more items
  ];

  List<FurnitureItem> get _filteredItems {
    if (_selectedCategory == 'All') return _items;
    // This is a naive filter, categories and items need better linking in a real app
    return _items
        .where((item) =>
            item.name.toLowerCase().contains(_selectedCategory.toLowerCase()))
        .toList();
  }

  void _onFavoriteToggle(String itemId) {
    setState(() {
      final item = _items.firstWhere((i) => i.id == itemId);
      item.isFavorite = !item.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(theme),
            _buildSearchBar(theme),
            _buildCategoryFilters(theme),
            _buildFurnitureGrid(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: Text(
        'Best Furniture For\nYour House',
        style: theme.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onSurface,
          height: 1.2,
        ),
      ),
    );
  }

  Widget _buildSearchBar(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Furniture',
          prefixIcon: Icon(Icons.search, color: theme.hintColor),
          filled: true,
          fillColor: theme.colorScheme
              .surfaceContainerHighest, // Lighter grey for search bar background
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none, // No border as per design
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: theme.primaryColor, width: 1.5),
          ),
        ),
        onChanged: (value) {
          // TODO: Implement search logic
          print('Searching for: $value');
        },
      ),
    );
  }

  Widget _buildCategoryFilters(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: _categories.length,
          itemBuilder: (context, index) {
            final category = _categories[index];
            final bool isSelected = category.name == _selectedCategory;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ChoiceChip(
                label: Text(category.name),
                avatar: category.icon != null && category.name != 'All'
                    ? Icon(category.icon,
                        color: isSelected
                            ? Colors.white
                            : theme.colorScheme.onSurfaceVariant)
                    : null,
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    _selectedCategory = category.name;
                  });
                },
                backgroundColor: theme
                    .colorScheme.surfaceContainerHighest, // Light grey for unselected
                selectedColor:
                    theme.colorScheme.primary, // Primary color for selected
                labelStyle: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : theme.colorScheme.onSurfaceVariant,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide.none, // No border for chips
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 10.0),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFurnitureGrid(ThemeData theme) {
    final items = _filteredItems;
    if (items.isEmpty) {
      return const Expanded(
        child: Center(child: Text('No items found for this category.')),
      );
    }
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.75, // Adjust for item card proportions
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            clipBehavior:
                Clip.antiAlias, // Ensures image respects card's rounded corners
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 2.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    color: Colors
                        .grey[200], // Placeholder background for image area
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      item.imagePath,
                      fit:
                          BoxFit.contain, // Or BoxFit.cover depending on images
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
                    mainAxisAlignment:
                        MainAxisAlignment.end, // Heart icon to the right
                    children: [
                      // Text(item.name, style: theme.textTheme.titleSmall), // Optional: Item name if design had it
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
