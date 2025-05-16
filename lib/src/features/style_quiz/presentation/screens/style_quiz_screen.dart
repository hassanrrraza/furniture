import 'package:flutter/material.dart';
import 'package:furniture_app/src/features/style_quiz/domain/models/quiz_models.dart';
import 'package:furniture_app/src/features/style_quiz/presentation/screens/suggestion_screen.dart';

// Sample Quiz Data (6 questions)
final List<QuizQuestion> _sampleQuizQuestions = [
  QuizQuestion(
    id: 'q1',
    questionText:
        'Which color palette are you most drawn to for your living space?',
    options: [
      const QuizOption(
          id: 'q1_opt1', text: 'Neutral tones (beige, grey, white)'),
      const QuizOption(
          id: 'q1_opt2', text: 'Earthy tones (brown, green, terracotta)'),
      const QuizOption(
          id: 'q1_opt3', text: 'Bold & vibrant colors (blue, yellow, red)'),
      const QuizOption(
          id: 'q1_opt4', text: 'Pastel shades (light pink, mint, baby blue)'),
    ],
  ),
  QuizQuestion(
    id: 'q2',
    questionText: 'What kind of materials do you prefer in furniture?',
    options: [
      const QuizOption(id: 'q2_opt1', text: 'Natural wood and stone'),
      const QuizOption(id: 'q2_opt2', text: 'Metals (steel, brass, chrome)'),
      const QuizOption(
          id: 'q2_opt3', text: 'Soft fabrics (velvet, cotton, linen)'),
      const QuizOption(id: 'q2_opt4', text: 'Leather and faux leather'),
    ],
  ),
  QuizQuestion(
    id: 'q3',
    questionText: 'Describe your ideal room atmosphere:',
    options: [
      const QuizOption(id: 'q3_opt1', text: 'Cozy and comfortable'),
      const QuizOption(id: 'q3_opt2', text: 'Minimalist and clean'),
      const QuizOption(id: 'q3_opt3', text: 'Elegant and sophisticated'),
      const QuizOption(id: 'q3_opt4', text: 'Eclectic and artistic'),
    ],
  ),
  QuizQuestion(
    id: 'q4',
    questionText: 'Which type of patterns do you like, if any?',
    options: [
      const QuizOption(id: 'q4_opt1', text: 'Solid colors, no patterns'),
      const QuizOption(id: 'q4_opt2', text: 'Geometric patterns'),
      const QuizOption(id: 'q4_opt3', text: 'Floral or botanical prints'),
      const QuizOption(id: 'q4_opt4', text: 'Abstract or artistic patterns'),
    ],
  ),
  QuizQuestion(
    id: 'q5',
    questionText:
        'How would you describe your preferred level of ornamentation?',
    options: [
      const QuizOption(
          id: 'q5_opt1', text: 'Very little, focus on function (Minimalist)'),
      const QuizOption(
          id: 'q5_opt2',
          text: 'Some decorative elements, but not cluttered (Modern)'),
      const QuizOption(
          id: 'q5_opt3',
          text: 'Rich details and ornamentation (Traditional/Classic)'),
      const QuizOption(
          id: 'q5_opt4',
          text: 'Unique, handcrafted, or vintage pieces (Bohemian/Eclectic)'),
    ],
  ),
  QuizQuestion(
    id: 'q6',
    questionText:
        'Which of these activities do you most enjoy doing in your living space?',
    options: [
      const QuizOption(id: 'q6_opt1', text: 'Relaxing and watching TV/movies'),
      const QuizOption(
          id: 'q6_opt2', text: 'Entertaining guests and socializing'),
      const QuizOption(id: 'q6_opt3', text: 'Working or studying'),
      const QuizOption(
          id: 'q6_opt4', text: 'Reading or pursuing hobbies quietly'),
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
  String? _selectedOptionId;
  final Map<String, String> _answers = {}; // To store questionId: optionText

  void _handleOptionSelected(String optionId, String optionText) {
    setState(() {
      _selectedOptionId = optionId;
      // Store the textual answer for the current question's ID
      _answers[_sampleQuizQuestions[_currentQuestionIndex].id] = optionText;
    });
    // Auto-navigate after a brief delay to show selection
    Future.delayed(const Duration(milliseconds: 300), () {
      _nextQuestion();
    });
  }

  void _nextQuestion() {
    if (_selectedOptionId == null)
      return; // Don't proceed if no option is selected

    if (_currentQuestionIndex < _sampleQuizQuestions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedOptionId = null; // Reset selection for the new question
      });
    } else {
      // Quiz finished, navigate to suggestions
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SuggestionScreen(answers: _answers),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentQuestion = _sampleQuizQuestions[_currentQuestionIndex];
    final double progress =
        (_currentQuestionIndex + 1) / _sampleQuizQuestions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Style Quiz'),
        automaticallyImplyLeading: false, // No back button for the quiz itself
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Question ${_currentQuestionIndex + 1} of ${_sampleQuizQuestions.length}',
              style:
                  theme.textTheme.titleSmall?.copyWith(color: theme.hintColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: theme.colorScheme.surfaceVariant,
              valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
              minHeight: 8,
            ),
            const SizedBox(height: 30),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentQuestion.questionText,
                    style: theme.textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w500, height: 1.4),
                  ),
                  const SizedBox(height: 25),
                  ...currentQuestion.options.map((option) {
                    final bool isSelected = _selectedOptionId == option.id;
                    return Card(
                      elevation: isSelected ? 4.0 : 1.0,
                      margin: const EdgeInsets.symmetric(vertical: 6.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: isSelected
                              ? theme.primaryColor
                              : theme.dividerColor,
                          width: isSelected ? 2.0 : 1.0,
                        ),
                      ),
                      child: InkWell(
                        onTap: () =>
                            _handleOptionSelected(option.id, option.text),
                        borderRadius: BorderRadius.circular(10.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  option.text,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: isSelected
                                        ? theme.primaryColor
                                        : theme.colorScheme.onSurface,
                                  ),
                                ),
                              ),
                              if (isSelected)
                                Icon(Icons.check_circle,
                                    color: theme.primaryColor, size: 24),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            )),
            // const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: _selectedOptionId != null ? _nextQuestion : null, // Enable if option selected
            //   child: const Text('Next'),
            // ),
          ],
        ),
      ),
    );
  }
}
