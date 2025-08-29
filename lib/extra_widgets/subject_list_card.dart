import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/data/app_db.dart';

class SubjectListCard extends StatelessWidget {
  final SubjectData subject;
  final int id;
  final String name;
  final int totalTimeSpent; // in seconds

  const SubjectListCard({
    super.key,
    required this.id,
    required this.name,
    required this.totalTimeSpent,
    required this.subject,
  });

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
        subtitle: Text(
            'ID: $id\nSuper-Subject ${subject.superSubjectID} \nAddress: ${subject.address}  \nSub-Subjects: ${subject.subSubjects}\nLast Focuzd: ${subject.lastFocuzdOnSessionID} \nTime Spent: ${_formatTime(totalTimeSpent)}'),
        onTap: () {
          BlocProvider.of<PageNavigationBloc>(context)
              .add(SubjectPageEvent(subject: subject));
        },
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
