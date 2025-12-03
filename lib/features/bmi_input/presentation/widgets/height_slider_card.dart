import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

class HeightSliderCard extends StatelessWidget {
  final int height;
  final ValueChanged<double> onChanged;

  const HeightSliderCard({
    super.key,
    required this.height,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.lightOrange,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text(
            'Height (cm)',
            style: TextStyle(fontSize: 14, color: AppColors.grey),
          ),
          const SizedBox(height: 10),
          Text(
            '$height',
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryOrange,
            ),
          ),
          const SizedBox(height: 20),
          SliderTheme(
            data: SliderThemeData(
              activeTrackColor: AppColors.primaryOrange,
              inactiveTrackColor: AppColors.primaryOrange.withValues(
                alpha: 0.3,
              ),
              thumbColor: AppColors.primaryOrange,
              overlayColor: AppColors.primaryOrange.withValues(alpha: 0.2),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
              trackHeight: 4,
            ),
            child: Slider(
              value: height.toDouble(),
              min: 100,
              max: 250,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
