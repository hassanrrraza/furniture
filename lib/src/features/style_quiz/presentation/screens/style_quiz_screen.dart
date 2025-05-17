import 'package:flutter/material.dart';
import 'package:furniture_app/src/features/style_quiz/domain/models/quiz_models.dart';
import 'package:furniture_app/src/features/style_quiz/presentation/screens/suggestion_screen.dart';

// New Quiz Questions Data
final List<QuizQuestion> styleQuizQuestions = [
  QuizQuestion(
    questionText:
        'Which color palette are you most drawn to for your living space?',
    options: [
      QuizOption(
          text: 'Crisp whites, cool greys, and bold black accents',
          styleAffinity: StyleType.modern),
      QuizOption(
          text: 'Rich jewel tones, warm woods, and patterned fabrics',
          styleAffinity: StyleType.classic),
      QuizOption(
          text: 'Soft neutrals, light woods, and a very clean look',
          styleAffinity: StyleType.minimalist),
      QuizOption(
          text: 'Earthy tones, vibrant patterns, and a mix of textures',
          styleAffinity: StyleType.bohemian),
    ],
  ),
  QuizQuestion(
    questionText: 'What kind of materials and textures do you prefer?',
    options: [
      QuizOption(
          text: 'Sleek metal, glass, and smooth, polished surfaces',
          styleAffinity: StyleType.modern),
      QuizOption(
          text: 'Velvet, silk, dark polished wood, and ornate carvings',
          styleAffinity: StyleType.classic),
      QuizOption(
          text: 'Natural light wood, concrete, and simple, unadorned textiles',
          styleAffinity: StyleType.minimalist),
      QuizOption(
          text: 'Rattan, macrame, layered rugs, and varied textiles',
          styleAffinity: StyleType.bohemian),
    ],
  ),
  QuizQuestion(
    questionText: 'Describe your ideal furniture shapes and silhouettes.',
    options: [
      QuizOption(
          text: 'Geometric shapes, clean lines, and functional forms',
          styleAffinity: StyleType.modern),
      QuizOption(
          text:
              'Elegant curves, detailed craftsmanship, and symmetrical designs',
          styleAffinity: StyleType.classic),
      QuizOption(
          text: 'Utilitarian, simple, and as few pieces as necessary',
          styleAffinity: StyleType.minimalist),
      QuizOption(
          text: 'Free-flowing, comfortable, and unique, often vintage pieces',
          styleAffinity: StyleType.bohemian),
    ],
  ),
  QuizQuestion(
    questionText: 'How do you feel about decorative items and accessories?',
    options: [
      QuizOption(
          text: 'Minimal and impactful; a few statement pieces are enough',
          styleAffinity: StyleType.modern),
      QuizOption(
          text: 'Antiques, classic art, and formal arrangements are key',
          styleAffinity: StyleType.classic),
      QuizOption(
          text: 'Almost none; function is beauty, clutter is avoided',
          styleAffinity: StyleType.minimalist),
      QuizOption(
          text: 'Lots! Plants, tapestries, and personal treasures tell a story',
          styleAffinity: StyleType.bohemian),
    ],
  ),
  QuizQuestion(
    questionText: 'What overall atmosphere do you want to create?',
    options: [
      QuizOption(
          text: 'Sophisticated, current, and uncluttered',
          styleAffinity: StyleType.modern),
      QuizOption(
          text: 'Timeless, elegant, and formal',
          styleAffinity: StyleType.classic),
      QuizOption(
          text: 'Calm, serene, and highly organized',
          styleAffinity: StyleType.minimalist),
      QuizOption(
          text: 'Cozy, eclectic, and full of personality',
          styleAffinity: StyleType.bohemian),
    ],
  ),
  QuizQuestion(
    questionText: 'Which of these best describes your approach to patterns?',
    options: [
      QuizOption(
          text: 'Subtle textures or bold, graphic prints in moderation',
          styleAffinity: StyleType.modern),
      QuizOption(
          text: 'Damask, brocade, and traditional motifs',
          styleAffinity: StyleType.classic),
      QuizOption(
          text: 'Solid colors primarily; patterns are rare and simple',
          styleAffinity: StyleType.minimalist),
      QuizOption(
          text: 'A vibrant mix of global-inspired patterns and prints',
          styleAffinity: StyleType.bohemian),
    ],
  ),
];

class StyleQuizScreen extends StatefulWidget {
  const StyleQuizScreen({super.key});

  @override
  State<StyleQuizScreen> createState() => _StyleQuizScreenState();
}

class _StyleQuizScreenState extends State<StyleQuizScreen> {
  int _currentQuestionIndex = 0;
  // Store votes for each style
  final Map<StyleType, int> _styleVotes = {
    StyleType.modern: 0,
    StyleType.classic: 0,
    StyleType.minimalist: 0,
    StyleType.bohemian: 0,
  };
  // Store the actual answers if needed for display on suggestion screen
  final List<Map<String, String>> _userAnswers = [];

  void _answerQuestion(QuizOption selectedOption) {
    // Record the vote
    setState(() {
      _styleVotes[selectedOption.styleAffinity] =
          (_styleVotes[selectedOption.styleAffinity] ?? 0) + 1;
      _userAnswers.add({
        'question': styleQuizQuestions[_currentQuestionIndex].questionText,
        'answer': selectedOption.text,
      });

      if (_currentQuestionIndex < styleQuizQuestions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _navigateToSuggestionScreen();
      }
    });
  }

  StyleType _determineDominantStyle() {
    StyleType dominantStyle = StyleType.modern; // Default
    int maxVotes = 0;
    _styleVotes.forEach((style, votes) {
      if (votes > maxVotes) {
        maxVotes = votes;
        dominantStyle = style;
      } else if (votes == maxVotes) {
        // Handle ties: for now, stick with the first one encountered or a predefined order.
        // Example: Prefer Modern in a Modern-Classic tie if that's desired.
        // This simple approach picks the one that appears first in the map iteration if counts are equal.
        // A more sophisticated tie-breaking might involve secondary criteria or user choice.
      }
    });
    return dominantStyle;
  }

  void _navigateToSuggestionScreen() {
    final StyleType dominantStyle = _determineDominantStyle();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SuggestionScreen(
          dominantStyle: dominantStyle,
          quizAnswers: _userAnswers, // Pass the collected answers
        ),
      ),
    );
  }

  Widget _buildQuizContent(
      BuildContext context, ThemeData theme, QuizQuestion question) {
    return Column(
      key: ValueKey<int>(
          _currentQuestionIndex), // Important for AnimatedSwitcher
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Question ${_currentQuestionIndex + 1}/${styleQuizQuestions.length}',
          style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(
              vertical: 24.0, horizontal: 16.0), // Increased vertical padding
          decoration: BoxDecoration(
              color: theme.colorScheme
                  .surfaceContainerHighest, // Using a slightly different container color for variety
              borderRadius:
                  BorderRadius.circular(16.0), // Slightly larger radius
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.shadow.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ]),
          child: Text(
            question.questionText,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.onSurface,
              height: 1.3, // Improved line height for readability
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 30),
        Expanded(
          child: ListView.builder(
            itemCount: question.options.length,
            itemBuilder: (context, index) {
              final QuizOption option = question.options[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 7.0), // Slightly reduced vertical padding
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primaryContainer,
                    foregroundColor: theme.colorScheme.onPrimaryContainer,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical:
                            20), // Increased vertical padding for tap target
                    textStyle: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.normal, height: 1.3),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // Consistent radius
                    ),
                    elevation: 3,
                    shadowColor: theme.colorScheme.shadow.withOpacity(0.2),
                  ),
                  onPressed: () => _answerQuestion(option),
                  child: Text(
                    option.text,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Style Quiz'),
        automaticallyImplyLeading: false,
        backgroundColor: theme.colorScheme.surface, // Theme consistent AppBar
        elevation: 1, // Subtle elevation
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            20.0, 10.0, 20.0, 20.0), // Adjusted top padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (_currentQuestionIndex + 1) / styleQuizQuestions.length,
              backgroundColor: theme
                  .colorScheme.surfaceContainerHighest, // Themed background
              valueColor:
                  AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
              minHeight: 10, // Slightly thicker
              borderRadius: BorderRadius.circular(
                  5), // Rounded corners for the progress bar itself
            ),
            const SizedBox(height: 20), // Increased spacing after progress bar
            Expanded(
              child: AnimatedSwitcher(
                duration:
                    const Duration(milliseconds: 400), // Animation duration
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: _buildQuizContent(
                    context, theme, styleQuizQuestions[_currentQuestionIndex]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
