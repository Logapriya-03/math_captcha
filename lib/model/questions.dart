class QuestionModel {
  const QuestionModel(this.questions, this.answers, this.correctAnswer);

  final questions;
  final List<String> answers;
  final String correctAnswer;

  List<String> getShuffledList() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
