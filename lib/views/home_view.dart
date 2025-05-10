import 'package:flutter/material.dart';
import 'package:quiz_app/generated/assets.dart';
import 'package:quiz_app/styles/app_colors.dart';
import 'package:quiz_app/styles/app_text_styles.dart';
import 'package:quiz_app/views/questions_view.dart';

import '../widgets/custom_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  SizedBox(height: 30),
                  Text('Good morning,', style: AppTextStyles.regular16(color: Colors.white)),
                  SizedBox(height: 8),
                  Text('New topic is waiting', style: AppTextStyles.medium18()),

                  Expanded(child: SizedBox()),

                  CustomButton(text: 'Start Quiz', onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuestionsView(),));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
