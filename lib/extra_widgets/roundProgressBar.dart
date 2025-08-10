import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class RoundProgressBar extends StatelessWidget {
  final double progress; // 0.0 - 1.0
  final String? subjectName;
  final int sessionNumber;
  final VoidCallback? onLeftButtonTap;
  final VoidCallback? onRightButtonTap; // new

  const RoundProgressBar({
    super.key,
    required this.progress,
    required this.sessionNumber,
    this.subjectName,
    this.onLeftButtonTap,
    this.onRightButtonTap, // new
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Yaru progress indicator replaces the green rectangle
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: YaruLinearProgressIndicator(
                  value: progress,
                  strokeWidth: 40,
                ),
              ),
            ),
          ),
          // Content row with subject text inside the colored area
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {
                  print("tapped");
                  if (onLeftButtonTap != null) {
                    onLeftButtonTap!(); // Call the callback if provided
                  }
                },
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: colorScheme.surfaceVariant,
                  child: Transform.rotate(
                    angle: -0.20, // adjust for arrow direction
                    child: Icon(Icons.edit, size: 28, color: colorScheme.onSurface),
                  ),
                ),
              ),
              // Subject text in the progress area, expands and ellipsizes if needed
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      subjectName ?? "Not a subject",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: colorScheme.onPrimaryContainer,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    ),
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {
                  print("tapped right");
                  if (onRightButtonTap != null) {
                    onRightButtonTap!();
                  }
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: YaruCircularProgressIndicator(
                        value: progress.clamp(0.0, 1.0),
                        strokeWidth: 6,
                      ),
                    ),
                    CircleAvatar(
                      radius: 21,
                      backgroundColor: colorScheme.primaryContainer,
                      child: Text(
                        (progress * 100).toStringAsFixed(0),
                        style: TextStyle(
                          fontSize: 18,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}