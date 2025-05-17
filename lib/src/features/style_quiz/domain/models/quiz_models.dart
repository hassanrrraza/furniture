// Defines the structure for quiz questions and options

// Enum for the different furniture styles
enum StyleType {
  modern,
  classic,
  minimalist,
  bohemian,
}

class QuizOption {
  final String text;
  final StyleType styleAffinity; // Each option contributes to a specific style

  QuizOption({required this.text, required this.styleAffinity});
}

class QuizQuestion {
  final String questionText;
  final List<QuizOption> options;
  // final String? correctAnswer; // Not needed for style quiz, more for knowledge quizzes

  QuizQuestion({
    required this.questionText,
    required this.options,
    // this.correctAnswer,
  });
}
