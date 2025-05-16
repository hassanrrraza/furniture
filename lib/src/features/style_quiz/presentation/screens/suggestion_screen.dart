import 'package:flutter/material.dart';
import 'package:furniture_app/src/features/main_navigation/presentation/screens/app_scaffold_with_bottom_nav.dart'; // Import for navigation

class SuggestionScreen extends StatelessWidget {
  final Map<String, String> answers; // Quiz answers to determine suggestions

  const SuggestionScreen({super.key, required this.answers});

  void _navigateToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const AppScaffoldWithBottomNav()),
      (Route<dynamic> route) => false, // Remove all previous routes
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Implement actual suggestion logic based on answers
    // For now, just display the answers and a placeholder message
    return Scaffold(
      appBar: AppBar(
          title: const Text('Style Suggestions'),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => _navigateToHome(context), // Navigate to home
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Quiz Completed!',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Based on your answers, here are some style suggestions (to be implemented).',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text('Your Answers:'),
            ...answers.entries
                .map((entry) => Text('${entry.key}: ${entry.value}')),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _navigateToHome(context), // Navigate to home
              child: const Text('Back to Home'),
            )
          ],
        ),
      ),
    );
  }
}
