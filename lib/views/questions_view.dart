import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/styles/app_colors.dart';
import 'package:quiz_app/styles/app_text_styles.dart';
import 'package:quiz_app/widgets/custom_back_button.dart';
import 'package:quiz_app/widgets/custom_next_button.dart';
import '../generated/assets.dart';
import '../widgets/custom_list_generate.dart';

class QuestionsView extends StatefulWidget {
  QuestionsView({super.key});

  final List<QuestionModel> questions = [
    QuestionModel(
      questionNumber: 'Question 1',
      svgPicture: SvgPicture.asset(Assets.imagesQ1),
      question:
      'How would you describe your level of satisfaction with the healthcare system?',
      options: [
        'Strongly Satisfied',
        'Satisfied',
        'Neutral',
        'Not Satisfied',
      ],
      correctAnswer: 'Strongly Satisfied',
    ),
    QuestionModel(
      questionNumber: 'Question 2',
      svgPicture: SvgPicture.asset(Assets.imagesQ2),
      question: 'What vitamins do you take?',
      options: [
        'Vitamin D3',
        'Vitamin B',
        'Zinc',
        'Magnesium',
      ],
      correctAnswer: 'Zinc',
    ),
    QuestionModel(
      questionNumber: 'Question 3',
      svgPicture: SvgPicture.asset(Assets.imagesQ3),
      question: 'How often do you engage in physical activity during the week?',
      options: [
        'Daily',
        '3-4 times',
        '1-2 times',
        'Rarely',
      ],
      correctAnswer: '3-4 times',
    ),
    QuestionModel(
      questionNumber: 'Question 4',
      svgPicture: SvgPicture.asset(Assets.imagesQ4),
      question: 'How would you rate your current sleep quality?',
      options: [
        'Excellent',
        'Good',
        'Fair',
        'Poor',
      ],
      correctAnswer: 'Good',
    ),
  ];

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  int currentIndex = 0;
  late List<int?> selectedAnswers;

  @override
  void initState() {
    super.initState();
    selectedAnswers = List<int?>.filled(widget.questions.length, null);
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[currentIndex];
    final options = question.options;

    final selectedIndex = selectedAnswers[currentIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(Assets.imagesGradient),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF8D83FF),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          color: Color(0xFFB8B2FF),
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        question.svgPicture,
                        const SizedBox(width: 8),
                        Text(
                          question.questionNumber,
                          style: AppTextStyles.regular16(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 20),
                    child: Text(question.question, style: AppTextStyles.medium24()),
                  ),
                  const SizedBox(height: 40),
                  CustomListGenerate(
                    options: options,
                    selectedIndex: selectedIndex,
                    correctAnswer: question.correctAnswer,
                    onOptionSelected: (index) {
                      setState(() {
                        selectedAnswers[currentIndex] = index;
                      });
                    },
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Visibility(
                        visible: currentIndex > 0,
                        child: CustomBackButton(
                          onPressed: () {
                            if (currentIndex > 0) {
                              setState(() {
                                currentIndex--;
                              });
                            }
                          },
                        ),
                      ),
                      const Spacer(),
                      CustomNextButton(
                        onPressed: () {
                          if (currentIndex < widget.questions.length - 1) {
                            setState(() {
                              currentIndex++;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}