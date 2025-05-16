import 'package:flutter/material.dart';
import 'package:furniture_app/src/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:furniture_app/src/features/home/presentation/screens/home_screen.dart';
import 'package:furniture_app/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:furniture_app/src/features/style_quiz/presentation/screens/style_quiz_screen.dart';
// TODO: Import other main screens (Favorites, Quiz, Profile) when created

class AppScaffoldWithBottomNav extends StatefulWidget {
  const AppScaffoldWithBottomNav({super.key});

  @override
  State<AppScaffoldWithBottomNav> createState() =>
      _AppScaffoldWithBottomNavState();
}

class _AppScaffoldWithBottomNavState extends State<AppScaffoldWithBottomNav> {
  int _selectedIndex = 0;

  // Correctly using imported screens
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(), // Actual HomeScreen from its file
    const FavoritesScreen(), // Actual FavoritesScreen from its file
    const StyleQuizScreen(), // Use the actual StyleQuizScreen
    const ProfileScreen(), // Actual ProfileScreen from its file
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Define active and inactive colors based on your app theme
    final Color activeColor =
        theme.primaryColor; // Example: Use primary color for active items
    final Color inactiveColor =
        theme.unselectedWidgetColor; // Standard unselected color

    return Scaffold(
      body: IndexedStack(
        // Use IndexedStack to keep state of pages
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 0 ? Icons.home : Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 1
                ? Icons.favorite
                : Icons.favorite_border_outlined),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 2
                ? Icons.lightbulb
                : Icons.lightbulb_outline),
            label: 'Style Quiz',
          ),
          BottomNavigationBarItem(
            icon:
                Icon(_selectedIndex == 3 ? Icons.person : Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: activeColor,
        unselectedItemColor: inactiveColor,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Ensures all labels are visible
        showUnselectedLabels: true,
        backgroundColor: theme.cardColor, // Or theme.bottomAppBarTheme.color
        elevation: 8.0, // Add some elevation as seen in design
      ),
    );
  }
}
