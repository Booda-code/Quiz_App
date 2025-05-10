import 'package:flutter_svg/flutter_svg.dart';

class QuestionModel {
  final String questionNumber;
  final SvgPicture svgPicture;
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;

  QuestionModel({
    required this.questionNumber,
    required this.svgPicture,
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
  });
}
