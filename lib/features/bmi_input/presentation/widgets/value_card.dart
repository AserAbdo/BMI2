import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

class ValueCard extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ValueCard({
    super.key,
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.lightOrange,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: AppColors.grey),
          ),
          const SizedBox(height: 10),
          Text(
            '$value',
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryOrange,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.white,
                child: IconButton(
                  icon: const Icon(
                    Icons.remove,
                    color: AppColors.primaryOrange,
                  ),
                  onPressed: onDecrement,
                ),
              ),
              const SizedBox(width: 20),
              CircleAvatar(
                backgroundColor: AppColors.white,
                child: IconButton(
                  icon: const Icon(Icons.add, color: AppColors.primaryOrange),
                  onPressed: onIncrement,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
