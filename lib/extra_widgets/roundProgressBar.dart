import 'package:flutter/material.dart';
import 'package:focuzd/l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:yaru/yaru.dart';

class RoundProgressBar extends StatelessWidget {
  final double progress;
  final String? subjectName;
  final int sessionNumber;
  final String type;
  final DateTime endRound;
  const RoundProgressBar(
      {super.key,
      required this.progress,
      required this.sessionNumber,
      this.subjectName,
      required this.type,
      required this.endRound});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Only show the linear progress indicator if subjectName is not null
          // Wrap Row with a rounded Container for a section-like look
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius:
                  BorderRadius.circular(32), // More rounded than YaruSection
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min, // Add this line
              children: [
                if (type == "focus")
                  // Subject text in the progress area, expands and ellipsizes if needed
                  if (subjectName != null)
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            subjectName ?? "",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w200,
                              color: colorScheme.onPrimaryContainer,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            softWrap: false,
                          ),
                        ),
                      ),
                    ),
                if (subjectName == null && type == "focus") SizedBox(width: 10),
                Tooltip(
                  message:
                      '${AppLocalizations.of(context)!.tooltipRoundProgressEnd} ${(progress * 100).floor()}% , ${DateFormat('kk:mm').format(endRound)}.',
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onHover: (value) {},
                    onTap: () {
                      print("tapped right");
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
