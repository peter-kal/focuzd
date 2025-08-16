import 'package:flutter_test/flutter_test.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/extra_functions/extra_functions.dart';

void main() {
  group('extra functions test', () {
    

    test('test getPermanantList', () {
      final List<SessionVariablePlanning> historyList = [
        SessionVariablePlanning('focus', 1500, null, expFinishTime: null),
        SessionVariablePlanning('break', 300, null)
      ];
      // final listGivenByCode = ExtraFunctions().getThePermanentList(historyList, );
    });

    
    test('test endsOn', () {
      final fixedTime = DateTime(2024, 0, 0, 10, 0, 0, 0, 0);
      final whenTimerRuns = ExtraFunctions()
          .endsOn(300, TimerRunInProgress(200, 2, 1, 4, 200, 0, 0, [], 'focus',1000, 200, DateTime.now().add(Duration(seconds: 300))), fixedTime);
      final whenInitial =
          ExtraFunctions().endsOn(300, TimerInitial(300, 1, 4), fixedTime);
      final whenPause = ExtraFunctions()
          .endsOn(300, TimerRunPause(300, 1,1, 4, 300, 0, 0, [], 'focus', 1000, 200, DateTime.now().add(Duration(seconds: 300))), fixedTime);

      expect(whenTimerRuns, "10:05");
      expect(whenInitial, "-- : --");
      expect(whenPause, "-- : --");
    });
  });
}
