import 'package:flutter/material.dart';
import 'package:furniture_app/src/features/auth/presentation/screens/login_screen.dart'; // Import LoginScreen

// TODO: Import OnboardingPageViewModel if we create one for state management (e.g., with Riverpod)
// TODO: Import navigation logic (e.g., AutoRoute) for Skip and Get Started

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'image': 'assets/images/onboarding_image_1.png',
      'title': 'Discover furniture styles that match your unique interior design taste.',
      // 'subtitle': 'Briefly explain the benefit here.' // Optional subtitle
    },
    {
      'image': 'assets/images/onboarding_image_2.png',
      'title':
          'Personalized furniture suggestions to elevate your home visual appeal.', // Updated title
      // 'subtitle': 'Another compelling point.'
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _navigateToLogin() {
    if (mounted) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration:
              const Duration(milliseconds: 500), // Adjust duration if needed
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use theme colors
    final Color primaryColor = Theme.of(context).primaryColor;
    final Color lightGreyColor = Colors.grey[300]!;
    final Color skipButtonColor =
        Theme.of(context).textTheme.bodyMedium?.color ?? Colors.grey;

    return Scaffold(
      // backgroundColor is handled by theme
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  return _buildOnboardingPage(
                    imagePath: _onboardingData[index]['image']!,
                    title: _onboardingData[index]['title']!,
                    // subtitle: _onboardingData[index]['subtitle'],
                  );
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  if (_currentPage == 0)
                    TextButton(
                      onPressed: _navigateToLogin,
                      child: Text(
                        'Skip',
                        style: TextStyle(fontSize: 16, color: skipButtonColor),
                      ),
                    )
                  else
                    const SizedBox(width: 70), // Maintain space balance

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(_onboardingData.length,
                        (int index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 10,
                        width: _currentPage == index ? 30 : 10,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: _currentPage == index
                              ? primaryColor
                              : lightGreyColor,
                        ),
                      );
                    }),
                  ),

                  _currentPage == _onboardingData.length - 1
                      ? ElevatedButton(
                          onPressed: _navigateToLogin,
                          child: const Text(
                              'Get Started'), // Style from ElevatedButtonTheme
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(
                                0.1), // Light primary background for the circle
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward_ios,
                                color: primaryColor, size: 20),
                            onPressed: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                            // Style from IconButtonTheme or direct styling if needed
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingPage({
    required String imagePath,
    required String title,
    String? subtitle, // Optional subtitle
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context)
                    .colorScheme
                    .secondary
                    .withOpacity(0.1), // Soft background for image
              ),
              padding:
                  const EdgeInsets.all(20), // Padding inside the circle decor
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    print(
                        'Error loading onboarding image: $imagePath - $error');
                    return Center(
                      child: Icon(
                        Icons.error_outline,
                        color: Theme.of(context).colorScheme.error,
                        size: 50,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          height: 1.3, // Line height
                        ),
                  ),
                  if (subtitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 16,
                              height: 1.4,
                            ),
                      ),
                    ),
                ],
              )),
          const SizedBox(
              height: 20), // Spacer at the bottom of the page content
        ],
      ),
    );
  }
}
