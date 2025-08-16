import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/repo_bloc/repo_bloc.dart';
import 'package:focuzd/data/app_db.dart';
import 'package:focuzd/data/repo.dart';
import 'package:yaru/widgets.dart';

class SessionCard extends StatelessWidget {
  SessionCard(this.id, {super.key});
  MemoryCountdownVariableData id;
  var memoryrepo = MemorySessionRepository(AppDatabase.instance);
  var subjectRepo = SubjectRepository(AppDatabase.instance);
  Future<String?> getSubjectName(int subid) async {
    if (id.subject == null) {
      return null;
    } else if (id.subject != null) {
      var n = await subjectRepo.fetchSubjectByID(id.subject!);
      return n!.name;
    }
    return null;
  }
@override
Widget build(BuildContext context) {
  return Card(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
            "${id.finishTime!.day.toString()}/${id.finishTime!.month.toString()}/${id.finishTime!.year.toString()}"),
        Text(style: TextStyle(color: Colors.red), id.type),
        if (id.type == 'break' || id.type == 'longBreak')
          const SizedBox.shrink()
        else
          FutureBuilder<String?>(
            future: getSubjectName(id.subject ?? -1),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("...");
              } else if (snapshot.hasData && snapshot.data != null) {
                return Text(
                  snapshot.data!,
                  style: const TextStyle(color: Colors.green),
                );
              } else {
                return const Text(
                  "No subject",
                  style: TextStyle(color: Colors.green),
                );
              }
            },
          ),
        YaruIconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            memoryrepo.deleteMemorySessionById(id.id);
            BlocProvider.of<RepoBloc>(context).add(EmitStateWithDBVars());
          },
        ),
      ],
    ),
  );
}
}