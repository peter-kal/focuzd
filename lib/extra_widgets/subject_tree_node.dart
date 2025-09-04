import 'package:focuzd/data/app_db.dart';

class SubjectTreeNode {
  const SubjectTreeNode({
    required this.title,
    required this.id,
    required this.superId,
    required this.subSubjects,
    required this.totalTimeSpent,
    required this.updatedAt,
    required this.subject,
    this.lastFocuzdOnSessionID = 0,
    this.children = const <SubjectTreeNode>[],
  });

  final String title;
  final int id;
  final int? superId;
  final int subSubjects;
  final DateTime updatedAt;
  final int lastFocuzdOnSessionID;
  final int totalTimeSpent;
  final SubjectData subject;
  final List<SubjectTreeNode> children;
}
