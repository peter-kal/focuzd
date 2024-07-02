/// Custom [BlocObserver] which observes all bloc and cubit instances.

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/pomodoro_bloc/pomodoro_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (event is! UpdateRemainingTime) {
      print(
        "event ${event.toString()}",
      );
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print("error ${error.toString()}");
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print("transition");
  }
}
