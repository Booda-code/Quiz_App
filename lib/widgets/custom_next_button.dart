import 'package:flutter/material.dart';
import 'package:quiz_app/styles/app_text_styles.dart';

class CustomNextButton extends StatelessWidget {
  const CustomNextButton({super.key, this.onPressed});
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: const Size(105, 0), // Sets fixed width
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        backgroundColor: const Color(0xFF8D83FF), // SECONDARY-VIOLET
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Text(
            'Next',
            style: AppTextStyles.regular16(
              color: Colors.white,
            )
          ),
          const SizedBox(width: 11),
          Icon(Icons.arrow_forward_ios, color: Colors.white, size: 19,),
          Container(
            width: 19,
            height: 19,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: Stack(),
          ),
        ],
      ),
    )
    ;
  }
}
