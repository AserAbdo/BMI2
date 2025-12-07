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
          const SizedBox(height: 10),
          // Arrow indicator pointing down
          const Icon(
            Icons.arrow_drop_down,
            color: AppColors.primaryOrange,
            size: 30,
          ),
          const SizedBox(height: 5),
          // Ruler picker - fits screen width
          HeightRulerPicker(height: height, onChanged: onChanged),
        ],
      ),
    );
  }
}

/// Advanced ruler-style height picker
/// Uses GestureDetector for tap/drag - no scrolling
/// Fits the available width using LayoutBuilder
class HeightRulerPicker extends StatelessWidget {
  final int height;
  final ValueChanged<double> onChanged;

  // Height range
  static const int minHeight = 100;
  static const int maxHeight = 250;
  static const int totalTicks = maxHeight - minHeight; // 150 ticks

  const HeightRulerPicker({
    super.key,
    required this.height,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use full available width
        final double rulerWidth = constraints.maxWidth;
        final double tickSpacing = rulerWidth / totalTicks;

        // Calculate center position based on current height
        final double centerX = (height - minHeight) * tickSpacing;

        return GestureDetector(
          // Handle tap
          onTapDown: (details) =>
              _updateHeight(details.localPosition.dx, rulerWidth),
          // Handle drag
          onHorizontalDragUpdate: (details) =>
              _updateHeight(details.localPosition.dx, rulerWidth),
          child: SizedBox(
            height: 50,
            width: rulerWidth,
            child: CustomPaint(
              painter: RulerPainter(
                currentHeight: height,
                minHeight: minHeight,
                maxHeight: maxHeight,
                tickSpacing: tickSpacing,
                centerX: centerX,
              ),
            ),
          ),
        );
      },
    );
  }

  void _updateHeight(double dx, double rulerWidth) {
    // Convert tap position to height value
    final double percentage = (dx / rulerWidth).clamp(0.0, 1.0);
    final int newHeight = (minHeight + (percentage * totalTicks)).round();
    final int clampedHeight = newHeight.clamp(minHeight, maxHeight);
    onChanged(clampedHeight.toDouble());
  }
}

/// Custom painter for drawing the ruler
/// More performant than building widgets
class RulerPainter extends CustomPainter {
  final int currentHeight;
  final int minHeight;
  final int maxHeight;
  final double tickSpacing;
  final double centerX;

  RulerPainter({
    required this.currentHeight,
    required this.minHeight,
    required this.maxHeight,
    required this.tickSpacing,
    required this.centerX,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint tickPaint = Paint()
      ..color = AppColors.grey.withValues(alpha: 0.5)
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    final Paint majorTickPaint = Paint()
      ..color = AppColors.grey.withValues(alpha: 0.6)
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    final Paint centerPaint = Paint()
      ..color = AppColors.primaryOrange
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    // Draw all tick marks
    for (int i = 0; i <= maxHeight - minHeight; i++) {
      final int value = minHeight + i;
      final double x = i * tickSpacing;

      final bool isMajor = value % 10 == 0;
      final bool isMid = value % 5 == 0 && !isMajor;

      // Tick heights
      final double tickHeight = isMajor ? 35 : (isMid ? 25 : 15);
      final double startY = size.height - tickHeight;
      final double endY = size.height;

      // Use appropriate paint
      final Paint paint = isMajor ? majorTickPaint : tickPaint;

      canvas.drawLine(Offset(x, startY), Offset(x, endY), paint);
    }

    // Draw center indicator (current selection)
    canvas.drawLine(
      Offset(centerX, size.height - 40),
      Offset(centerX, size.height),
      centerPaint,
    );
  }

  @override
  bool shouldRepaint(RulerPainter oldDelegate) {
    return oldDelegate.currentHeight != currentHeight;
  }
}
