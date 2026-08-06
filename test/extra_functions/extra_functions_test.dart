import 'package:flutter_test/flutter_test.dart';
import 'package:focuzd/blocs/blocs.dart';
import 'package:focuzd/extra_functions/extra_functions.dart';

void main() {
  group('extra functions test', () {
    test('Test countingWorkTimes ', () {
      final testWork = ExtraFunctions().countingWorkRounds(3);
      final testBreak = ExtraFunctions().countingWorkRounds(4);

      expect(testWork, 2);
      expect(testBreak, 2);
    });

    test('test currentSessionStatus', () {
      final outputBreak = ExtraFunctions()
          .currentSessionStatus(2, 4, "longBreak", "work", "break");
      final outputWork = ExtraFunctions()
          .currentSessionStatus(3, 4, "longBreak", "work", "break");
      final outputLongBreak = ExtraFunctions()
          .currentSessionStatus(8, 4, "longBreak", "work", "break");
      final outputLongBreak2 = ExtraFunctions()
          .currentSessionStatus(16, 4, "longBreak", "work", "break");

      expect(outputBreak, "break");
      expect(outputWork, "work");
      expect(outputLongBreak, "longBreak");
      expect(outputLongBreak2, "longBreak");
    });

    test('test endsOn', () {
      final fixedTime = DateTime(2024, 0, 0, 10, 0, 0, 0, 0);
      final whenTimerRuns = ExtraFunctions()
          .endsOn(300, const TimerRunInProgress(200, 2, 4, 200, 4, false), fixedTime);
      final whenInitial = ExtraFunctions()
          .endsOn(300, const TimerInitial(300, 1, 4, 300, 4, false), fixedTime);
      final whenPause = ExtraFunctions()
          .endsOn(300, const TimerRunPause(300, 1, 4, 300, 4, false), fixedTime);

      expect(whenTimerRuns, "10:05");
      expect(whenInitial, "-- : --");
      expect(whenPause, "-- : --");
    });
  });
}
