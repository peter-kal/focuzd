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
    this.optionalFocusTime,
    this.optionalBreakTime,
    this.lastFocuzdOnSessionID = 0,
    this.children = const <SubjectTreeNode>[],
  });

  final String title;
  final String id;
  final String? superId;
  final int subSubjects;
  final DateTime updatedAt;
  final int lastFocuzdOnSessionID;
  final int totalTimeSpent;
  final int? optionalFocusTime;
  final int? optionalBreakTime;
  final SubjectData subject;
  final List<SubjectTreeNode> children;
}
