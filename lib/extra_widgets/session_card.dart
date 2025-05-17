import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/repo_bloc/repo_bloc.dart';
import 'package:focuzd/data/app_db.dart';
import 'package:focuzd/data/repo.dart';
import 'package:yaru/widgets.dart';

class SessionCard extends StatelessWidget {
  SessionCard(this.id, {super.key});
  MemorySessionVariableData id;
  var memoryrepo = MemorySessionRepository(AppDatabase.instance);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
              "${id.finishTime!.day.toString()}/${id.finishTime!.month.toString()}/${id.finishTime!.year.toString()}"),
          Text(style: TextStyle(color: Colors.red), id.type),
          Text(style: TextStyle(color: Colors.green), id.subject.toString()),
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
