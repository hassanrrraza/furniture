import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  // TODO: Add TextEditingControllers for all fields
  // TODO: Implement signup logic
  // TODO: Implement navigation for 'Log in'

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
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
                    'Sign Up',
                    textAlign: TextAlign.left,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildTextField(theme,
                      label: 'First name', initialValue: 'anas'),
                  const SizedBox(height: 16),
                  _buildTextField(theme,
                      label: 'Last name', initialValue: 'Farhad'),
                  const SizedBox(height: 16),
                  _buildEmailField(theme),
                  const SizedBox(height: 16),
                  _buildPasswordField(theme),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // TODO: Process signup
                        print('Sign Up button pressed');
                      }
                    },
                    child: const Text('Sign Up'),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Already have an account? ',
                        style: theme.textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context); // Go back to login screen
                          } else {
                            // Fallback: This case should ideally not be hit if navigating from login
                            // TODO: Consider replacing with a direct navigation to LoginScreen if needed
                            print(
                                "Navigate to Login screen (Fallback - pop failed)");
                          }
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColor,
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

  Widget _buildTextField(ThemeData theme,
      {required String label,
      String? initialValue,
      bool isObscure = false,
      Widget? suffixIcon,
      String? Function(String?)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(color: theme.hintColor),
        ),
        const SizedBox(height: 4),
        TextFormField(
          initialValue: initialValue,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
          ),
          obscureText: isObscure,
          validator: validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter $label';
                }
                return null;
              },
        ),
      ],
    );
  }

  Widget _buildEmailField(ThemeData theme) {
    return _buildTextField(
      theme,
      label: 'Email address',
      initialValue: 'johncharles@gmail.com',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email address';
        }
        if (!value.contains('@')) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField(ThemeData theme) {
    return _buildTextField(
      theme,
      label: 'Password',
      initialValue: '••••••••',
      isObscure: !_isPasswordVisible,
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        }
        // TODO: Add more robust password validation (length, complexity)
        return null;
      },
    );
  }
}
