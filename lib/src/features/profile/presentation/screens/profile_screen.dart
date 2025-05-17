import 'package:flutter/material.dart';
import 'package:furniture_app/src/features/auth/presentation/screens/login_screen.dart'; // Import LoginScreen

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Mock data for UI display
  final String _firstName = 'Anas';
  final String _lastName = 'Khan';
  final String _email = 'anas@gmail.com';

  // Placeholder for logout functionality
  void _handleLogout(BuildContext context) {
    // In a real app, you'd clear user session, navigate to login, etc.
    print('Logout tapped - Navigating to LoginScreen');
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        // If this screen is always accessed via bottom nav, consider removing back button:
        // automaticallyImplyLeading: false,
      ),
      body: Center(
        // Center the content vertically and horizontally
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center column content
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '$_firstName $_lastName',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                _email,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40), // Spacer before logout button
              ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text('LOGOUT'),
                onPressed: () => _handleLogout(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme
                      .colorScheme.errorContainer, // Or another distinct color
                  foregroundColor: theme.colorScheme.onErrorContainer,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: theme.textTheme.labelLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                  minimumSize:
                      const Size(200, 50), // Ensure a good tap target size
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12), // Consistent with app theme if applicable
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
