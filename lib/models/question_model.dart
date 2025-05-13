import 'package:equatable/equatable.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuestionModel extends Equatable {
  final String questionNumber;
  final SvgPicture svgPicture;
  final String question;
  final String correctAnswer;
   // String selectedAnswer;
   List<String> options = [];

  QuestionModel({
    required this.questionNumber,
    required this.svgPicture,
    required this.question,
    required this.options,
    required this.correctAnswer,
    // this.selectedAnswer = '',
  });

  @override
  List<Object?> get props => [question, options, correctAnswer];
}
