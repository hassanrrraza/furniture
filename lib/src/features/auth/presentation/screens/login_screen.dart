import 'package:flutter/material.dart';
import 'package:furniture_app/src/features/auth/presentation/screens/signup_screen.dart'; // Import SignupScreen
import 'package:furniture_app/src/features/main_navigation/presentation/screens/app_scaffold_with_bottom_nav.dart'; // Import AppScaffold

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  // TODO: Add TextEditingControllers for email and password
  // TODO: Implement login logic
  // TODO: Implement navigation for 'Forgot password?' and 'Sign up'

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      // appBar: AppBar(title: const Text('Login')), // Optional: if you want an app bar
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Log in',
                    textAlign: TextAlign.left,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface, // Or onSurface
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildEmailField(theme),
                  const SizedBox(height: 20),
                  _buildPasswordField(theme),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // TODO: Navigate to Forgot Password screen
                        print('Forgot password tapped');
                      },
                      child: Text(
                        'Forgot password?',
                        style:
                            TextStyle(color: theme.textTheme.bodyMedium?.color),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // TODO: Process login (Firebase etc.)
                        print('Login button pressed - Navigating to Home');
                        Navigator.of(context).pushReplacement(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const AppScaffoldWithBottomNav(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                  opacity: animation, child: child);
                            },
                            transitionDuration:
                                const Duration(milliseconds: 500),
                          ),
                        );
                      }
                    },
                    child: const Text('Log in'),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Already have an account? ', // Corrected from image to match common phrasing
                        style: theme.textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const SignupScreen(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                            ),
                          );
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme
                                .primaryColor, // Use primary color for emphasis
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'abc@gmail.com', // Label text from image
          style: theme.textTheme.labelSmall?.copyWith(color: theme.hintColor),
        ),
        const SizedBox(height: 4),
        TextFormField(
          initialValue: 'anas@gmail.com', // Value shown in image
          decoration: const InputDecoration(
              // hintText: 'Enter your email', // Standard hint
              // Using inputDecorationTheme from app_theme.dart
              ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!value.contains('@')) {
              // Basic email validation
              return 'Please enter a valid email';
            }
            return null;
          },
          // TODO: onSaved: (value) => _email = value!,
        ),
      ],
    );
  }

  Widget _buildPasswordField(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: theme.textTheme.labelSmall?.copyWith(color: theme.hintColor),
        ),
        const SizedBox(height: 4),
        TextFormField(
          initialValue: '••••••••', // Placeholder dots from image
          decoration: InputDecoration(
            // hintText: 'Enter your password',
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: theme.hintColor,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
            // Using inputDecorationTheme from app_theme.dart
          ),
          obscureText: !_isPasswordVisible,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            // Add more password validation if needed
            return null;
          },
          // TODO: onSaved: (value) => _password = value!,
        ),
      ],
    );
  }
}
