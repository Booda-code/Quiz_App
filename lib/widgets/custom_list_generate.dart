import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListGenerate extends StatelessWidget {
  final List<String> options;
  final int? selectedIndex;
  final Function(int) onOptionSelected;

  const CustomListGenerate({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(options.length, (index) {
        final isSelected = selectedIndex == index;

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: GestureDetector(
            onTap: () => onOptionSelected(index),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: ShapeDecoration(
                color: isSelected ? const Color(0xFFB8B2FF) : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: isSelected ? const Color(0xFF2B0062) : Colors.transparent,
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
                      color: isSelected ? const Color(0xFF2B0062) : Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.5),
                        side: const BorderSide(color: Color(0xFF2B0062), width: 1),
                      ),
                    ),
                    child: isSelected
                        ? const Icon(Icons.check, size: 13, color: Colors.white)
                        : null,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    options[index],
                    style: const TextStyle(color: Color(0xFF2B0062)),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}