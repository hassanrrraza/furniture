import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_app/src/features/favorites/application/favorite_items_notifier.dart';
import 'package:furniture_app/src/features/home/data/datasources/mock_furniture_data.dart';
import 'package:furniture_app/src/features/home/domain/models/furniture_item.dart';

// Display model for categories in UI
class DisplayCategory {
  final String name;
  final IconData? icon;
  final ProductCategory productCategory; // Link to the enum for filtering

  const DisplayCategory(
      {required this.name, this.icon, required this.productCategory});
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  ProductCategory _selectedProductCategory = ProductCategory.all;
  String _searchQuery = '';

  // Updated list of categories for display in ChoiceChips
  final List<DisplayCategory> _displayCategories = [
    const DisplayCategory(name: 'All', productCategory: ProductCategory.all),
    const DisplayCategory(
        name: 'Chairs',
        icon: Icons.chair_outlined,
        productCategory: ProductCategory.chairs),
    const DisplayCategory(
        name: 'Beds',
        icon: Icons.bed_outlined,
        productCategory: ProductCategory.beds),
    const DisplayCategory(
        name: 'Sofa',
        icon: Icons.living_outlined,
        productCategory: ProductCategory.sofa),
    const DisplayCategory(
        name: 'Lamps',
        icon: Icons.lightbulb_outline,
        productCategory: ProductCategory.lamps),
  ];

  List<FurnitureItem> get _filteredItems {
    List<FurnitureItem> itemsByCategory;
    if (_selectedProductCategory == ProductCategory.all) {
      itemsByCategory = mockFurnitureItems;
    } else {
      itemsByCategory = mockFurnitureItems
          .where((item) => item.productCategory == _selectedProductCategory)
          .toList();
    }

    if (_searchQuery.isEmpty) {
      return itemsByCategory;
    } else {
      return itemsByCategory
          .where((item) =>
              item.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
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
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Search Furniture',
          prefixIcon: Icon(Icons.search, color: theme.hintColor),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear, color: theme.hintColor),
                  onPressed: () {
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                )
              : null,
          filled: true,
          fillColor: theme.colorScheme.surfaceContainerHighest,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
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
          itemCount: _displayCategories.length,
          itemBuilder: (context, index) {
            final displayCategory = _displayCategories[index];
            final bool isSelected =
                displayCategory.productCategory == _selectedProductCategory;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ChoiceChip(
                label: Text(displayCategory.name),
                avatar: displayCategory.icon != null &&
                        displayCategory.productCategory != ProductCategory.all
                    ? Icon(displayCategory.icon,
                        color: isSelected
                            ? Colors.white
                            : theme.colorScheme.onSurfaceVariant)
                    : null,
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    _selectedProductCategory = displayCategory.productCategory;
                  });
                },
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
                selectedColor: theme.colorScheme.primary,
                labelStyle: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : theme.colorScheme.onSurfaceVariant,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide.none,
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
      String message = 'No items found for this category.';
      if (_searchQuery.isNotEmpty) {
        message = "No results found for '$_searchQuery'";
        final selectedCategoryForDisplay = _displayCategories.firstWhere(
            (cat) => cat.productCategory == _selectedProductCategory);
        if (_selectedProductCategory != ProductCategory.all) {
          message += " in ${selectedCategoryForDisplay.name}";
        }
      } else if (_selectedProductCategory != ProductCategory.all) {
        final selectedCategoryForDisplay = _displayCategories.firstWhere(
            (cat) => cat.productCategory == _selectedProductCategory);
        message = 'No items in ${selectedCategoryForDisplay.name} category.';
      } else {
        message = 'No furniture items available at the moment.';
      }
      return Expanded(
        child: Center(child: Text(message)),
      );
    }
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.75,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final favoriteItems = ref.watch(favoriteItemsProvider);
          final bool isItemFavorite = favoriteItems
              .any((favItem) => favItem.imagePath == item.imagePath);

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
                          isItemFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isItemFavorite
                              ? theme.colorScheme.primary
                              : theme.colorScheme.outline,
                        ),
                        onPressed: () {
                          ref
                              .read(favoriteItemsProvider.notifier)
                              .toggleFavorite(item);
                        },
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
