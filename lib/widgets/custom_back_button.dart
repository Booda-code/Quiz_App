import 'package:flutter/material.dart';

import '../styles/app_text_styles.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onPressed,});

final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            color: Color(0xFF8D83FF), // SECONDARY-VIOLET
            width: 1,
          ),
        ),
        foregroundColor: Colors.white, // MAINE-WHITE
        backgroundColor: Colors.transparent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 12,
            height: 19,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: Stack(),
          ),

          Icon(Icons.arrow_back_ios, color: Colors.white, size: 19,),
          const SizedBox(width: 8),
          Text(
            'Back',
            style: AppTextStyles.regular16(),
          ),
        ],
      ),
    )
    ;
  }
}
