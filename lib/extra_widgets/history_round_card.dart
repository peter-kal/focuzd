import 'package:flutter/material.dart';

// Replace with your actual model imports
import 'package:focuzd/data/app_db.dart';

class SessionBlock {
  final MemoryCountdownVariableData first;
  final MemoryCountdownVariableData? second;
  final List<OutPlanningVariableData> before;
  final List<OutPlanningVariableData> between;
  final List<OutPlanningVariableData> after;

  SessionBlock({
    required this.first,
    this.second,
    required this.before,
    required this.between,
    required this.after,
  });
}

class HistoryRoundCard extends StatelessWidget {
  final List<dynamic> givenList;

  const HistoryRoundCard({
    Key? key,
    required this.givenList,
  }) : super(key: key);

  List<SessionBlock> _buildSessionBlocks() {
    final blocks = <SessionBlock>[];
    final sessions =
        givenList.whereType<MemoryCountdownVariableData>().toList();

    for (var i = 0; i < sessions.length; i += 2) {
      final first = sessions[i];
      final second = (i + 1 < sessions.length) ? sessions[i + 1] : null;

      final before = givenList
          .whereType<OutPlanningVariableData>()
          .where((o) =>
              o.memoryCountdownID == first.id &&
              o.startingTime != null &&
              first.startingTime != null &&
              o.startingTime!.isBefore(first.startingTime!))
          .toList();

      final between = givenList
          .whereType<OutPlanningVariableData>()
          .where((o) =>
              o.memoryCountdownID == first.id &&
              o.startingTime != null &&
              first.startingTime != null &&
              second?.startingTime != null &&
              o.startingTime!.isAfter(first.startingTime!) &&
              o.startingTime!.isBefore(second!.startingTime!))
          .toList();

      final after = givenList
          .whereType<OutPlanningVariableData>()
          .where((o) =>
              second != null &&
              o.memoryCountdownID == second.id &&
              o.startingTime != null &&
              second.startingTime != null &&
              o.startingTime!.isAfter(second.startingTime!))
          .toList();

      blocks.add(SessionBlock(
        first: first,
        second: second,
        before: before,
        between: between,
        after: after,
      ));
    }

    return blocks;
  }

  @override
  Widget build(BuildContext context) {
    final blocks = _buildSessionBlocks();

    return Card(
      margin: const EdgeInsets.all(14),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "#${givenList[1].id}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(width: 10),
              Text(
                  "${givenList[1].finishTime.day}/${givenList[1].finishTime.month}/${givenList[1].finishTime.year}")
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: blocks.length,
            itemBuilder: (context, index) {
              final block = blocks[index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      _buildCircle(index + 1, Theme.of(context).primaryColor),
                      if (index < blocks.length - 1)
                        Container(
                            width: 0.5,
                            height: 190,
                            color: Theme.of(context).shadowColor),
                    ],
                  ),
                  const SizedBox(width: 12),
                  // Countdown + Outplannings
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...block.before.map((o) => _buildOutplanningRow(o)),
                        _buildCountdownRow(
                            block.first, Theme.of(context).primaryColor),
                        ...block.between.map((o) => _buildOutplanningRow(o)),
                        if (block.second != null)
                          _buildCountdownRow(
                              block.second!, Theme.of(context).primaryColor),
                        ...block.after.map((o) => _buildOutplanningRow(o)),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ]),
      ),
    );
  }

  Widget _buildCircle(int number, Color color) {
    // not BuildContext so the primaryColor doesn't update autpmatically
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(
        child: Text(
          "$number",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildCountdownRow(MemoryCountdownVariableData c, Color prim) {
    final label = c.type == 'focus'
        ? c.subject == null
            ? 'Focus'
            : "Focus: ${c.subject}"
        : (c.type == 'break' ? 'Break' : 'Long Break');
    final color = c.type == 'focus' ? prim : Colors.green;
    // TASK: internationalise the strings
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                  width: 8,
                  height: 8,
                  decoration:
                      BoxDecoration(color: color, shape: BoxShape.circle)),
              const SizedBox(width: 8),
              Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(width: 8),
          Text("${_formatTime(c.startingTime)} - ${_formatTime(c.finishTime)}",
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildOutplanningRow(OutPlanningVariableData o) {
    final isPause = (o.type ?? '').toLowerCase() == 'pause';
    final label = isPause ? 'Paused' : 'Reset';
    final icon = isPause ? Icons.pause_circle_filled : Icons.restart_alt;

    // Calculate duration
    String durationText = '';
    if (o.startingTime != null && o.finishTime != null) {
      final duration = o.duration!;
      if (duration < 60) {
        durationText = ' (${duration}s)';
      } else {
        durationText = ' (${(duration / 60).round()}m)';
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: Colors.redAccent),
              const SizedBox(width: 6),
              Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(width: 8),
          Text(
            "${_formatTime(o.startingTime)} - ${_formatTime(o.finishTime)}$durationText",
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime? time) {
    if (time == null) return '--:--';
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }
}
