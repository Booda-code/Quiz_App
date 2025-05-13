import 'package:quiz_app/models/question_model.dart';

class QuestionManager {
  final List<QuestionModel> questions ;

  QuestionManager(this.questions);

  void updateQuestion(QuestionModel question) {
    questions.remove(question);
    questions.add(question);
  }
}