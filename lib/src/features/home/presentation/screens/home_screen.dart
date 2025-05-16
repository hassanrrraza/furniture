import 'package:flutter/material.dart';
import 'package:furniture_app/src/features/home/data/datasources/mock_furniture_data.dart';
import 'package:furniture_app/src/features/home/domain/models/furniture_item.dart';

// Placeholder data models (we'll refine these)
class FurnitureCategory {
  final String name;
  final IconData? icon; // For Material icons
  // final String? customIconPath; // For SVG/PNG icons

  const FurnitureCategory({required this.name, this.icon});
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

  List<FurnitureItem> get _filteredItems {
    if (_selectedCategory == 'All') return mockFurnitureItems;
    // Updated filter logic to use item.category
    return mockFurnitureItems
        .where((item) =>
            item.category.toLowerCase() == _selectedCategory.toLowerCase())
        .toList();
  }

  void _onFavoriteToggle(String itemImagePath) {
    setState(() {
      final item =
          mockFurnitureItems.firstWhere((i) => i.imagePath == itemImagePath);
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
                backgroundColor: theme.colorScheme
                    .surfaceContainerHighest, // Light grey for unselected
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
                        print(
                            "Error loading image: ${item.imagePath}, Error: $error");
                        return const Center(
                            child: Icon(
                          Icons.broken_image,
                          size: 40,
                          color: Colors.red,
                        ));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item.name,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSurface,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          item.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: item.isFavorite
                              ? theme.colorScheme.primary
                              : theme.colorScheme.outline,
                        ),
                        onPressed: () => _onFavoriteToggle(item.imagePath),
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
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
