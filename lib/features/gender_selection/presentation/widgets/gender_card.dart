import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

class GenderCard extends StatelessWidget {
  final String gender;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderCard({
    super.key,
    required this.gender,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMale = gender == 'Male';
    final Color backgroundColor = isMale
        ? AppColors.lightGreen
        : AppColors.lightOrange;
    final Color textColor = isMale
        ? AppColors.primaryGreen
        : AppColors.primaryOrange;
    final Color borderColor = isSelected ? textColor : Colors.transparent;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor, width: 3),
        ),
        child: Row(
          children: [
            Text(
              gender,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const Spacer(),
            Image.asset(imagePath, width: 100, height: 100),
          ],
        ),
      ),
    );
  }
}
