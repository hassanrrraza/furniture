import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // TODO: Fetch actual user data (name, email) from a service/state
  final String _userName = 'John Abram';
  final String _userEmail = 'johnabram@gmail.com';
  final String _firstName = 'John';
  final String _lastName = 'Abram';

  void _handleLogout(BuildContext context) {
    // TODO: Implement actual logout logic (clear session, navigate to Login)
    print('Logout Tapped');
    // Example: Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // This assumes ProfileScreen is pushed onto the stack.
            // If it's a root tab, different navigation might be needed or no back arrow.
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              // Potentially navigate to home if it's a tab and we want to mimic back to home
              // For now, this handles cases where it might be pushed.
            }
          },
        ),
        title: const Text('My Profile'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300], // Placeholder color
              // backgroundImage: NetworkImage('USER_AVATAR_URL'), // TODO: Add user avatar image
              child: Text(
                _userName.isNotEmpty
                    ? _userName[0].toUpperCase()
                    : 'U', // Placeholder initial
                style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
              ),
            ),
          ),
        ],
        // elevation: 0, // To match design if flat
        // backgroundColor: theme.scaffoldBackgroundColor, // To match design if flat
        // foregroundColor: theme.colorScheme.onSurface, // To match design if flat
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _userName,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            Text(
              _userEmail,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.hintColor,
              ),
            ),
            const SizedBox(height: 30),
            _buildProfileDetailItem(theme,
                label: 'First name', value: _firstName),
            const SizedBox(height: 20),
            _buildProfileDetailItem(theme,
                label: 'Last name', value: _lastName),
            const SizedBox(height: 20),
            _buildProfileDetailItem(theme,
                label: 'Email address', value: _userEmail),
            const SizedBox(height: 50),
            Center(
              child: TextButton(
                onPressed: () => _handleLogout(context),
                child: Text(
                  'LOGOUT',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.error, // Red color for logout
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileDetailItem(ThemeData theme,
      {required String label, required String value}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest, // Light background for fields
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.labelSmall
                ?.copyWith(color: theme.hintColor, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
