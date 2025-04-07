import 'package:flutter/material.dart';

class SessionCard extends StatelessWidget {
  const SessionCard(this.id, {super.key});
  final id;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(id.toString()),
    );
  }
}
