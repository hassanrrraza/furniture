class QuizOption {
  final String id; // Unique ID for the option within a question (e.g., 'opt1', 'opt2')
  final String text;

  const QuizOption({required this.id, required this.text});
}

class QuizQuestion {
  final String id; // Unique ID for the question (e.g., 'q1', 'q2')
  final String questionText;
  final List<QuizOption> options;
  // final String? imageUrl; // Optional: if questions sometimes have images

  const QuizQuestion({
    required this.id,
    required this.questionText,
    required this.options,
    // this.imageUrl,
  });
} 