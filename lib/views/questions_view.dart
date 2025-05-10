import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/styles/app_colors.dart';
import 'package:quiz_app/styles/app_text_styles.dart';
import 'package:quiz_app/widgets/custom_back_button.dart';
import 'package:quiz_app/widgets/custom_next_button.dart';
import '../generated/assets.dart';

class QuestionsView extends StatefulWidget {
  QuestionsView({super.key});

  final List<QuestionModel> questions = [
    QuestionModel(
      questionNumber: 'Question 1',
      svgPicture: SvgPicture.asset(Assets.imagesQ1),
      question:
      'How would you describe your level of satisfaction with the healthcare system?',
      option1: 'Strongly Satisfied',
      option2: 'Satisfied',
      option3: 'Neutral',
      option4: 'Not Satisfied',
    ),
    QuestionModel(
      questionNumber: 'Question 2',
      svgPicture: SvgPicture.asset(Assets.imagesQ2),
      question: 'What vitamins do you take?',
      option1: 'Vitamin D3',
      option2: 'Vitamin B',
      option3: 'Zinc',
      option4: 'Magnesium',
    ),
    QuestionModel(
      questionNumber: 'Question 3',
      svgPicture: SvgPicture.asset(Assets.imagesQ3),
      question: 'How often do you engage in physical activity during the week?',
      option1: 'Daily',
      option2: '3-4 times',
      option3: '1-2 times',
      option4: 'Rarely',
    ),
    QuestionModel(
      questionNumber: 'Question 4',
      svgPicture: SvgPicture.asset(Assets.imagesQ4),
      question: 'How would you rate your current sleep quality?',
      option1: 'Excellent',
      option2: 'Good',
      option3: 'Fair',
      option4: 'Poor',
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
    final options = [
      question.option1,
      question.option2,
      question.option3,
      question.option4,
    ];

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
                  Text(question.question, style: AppTextStyles.medium24()),
                  const SizedBox(height: 40),
                  ...List.generate(options.length, (index) {
                    final isSelected = selectedIndex == index;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedAnswers[currentIndex] = index;
                          });
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          padding: const EdgeInsets.all(15),
                          decoration: ShapeDecoration(
                            color: isSelected
                                ? const Color(0xFFB8B2FF)
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: isSelected
                                    ? const Color(0xFF2B0062)
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 19,
                                height: 19,
                                decoration: ShapeDecoration(
                                  color: isSelected
                                      ? const Color(0xFF2B0062)
                                      : Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.5),
                                    side: const BorderSide(
                                      color: Color(0xFF2B0062),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: isSelected
                                    ? const Icon(
                                  Icons.check,
                                  size: 13,
                                  color: Colors.white,
                                )
                                    : null,
                              ),
                              const SizedBox(width: 16),
                              Text(
                                options[index],
                                style: AppTextStyles.regular16(
                                  color: const Color(0xFF2B0062),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
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