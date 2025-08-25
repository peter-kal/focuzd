import 'package:flutter/material.dart';

class SubjectListCard extends StatelessWidget {
  final int id;
  final String name;
  final int totalTimeSpent; // in seconds
  final VoidCallback? onTap;

  const SubjectListCard({
    Key? key,
    required this.id,
    required this.name,
    required this.totalTimeSpent,
    this.onTap,
  }) : super(key: key);

  String _formatTime(int seconds) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final secs = seconds % 60;
    return '${hours}h ${minutes}m ${secs}s';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('ID: $id\nTime Spent: ${_formatTime(totalTimeSpent)}'),
        onTap: onTap,
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}