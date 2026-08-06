import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:focuzd/blocs/pomodoro_bloc/pomodoro_bloc.dart';
import 'package:focuzd/blocs/pomodoro_bloc/ticker.dart';
import 'package:focuzd/data/repo.dart';
import 'package:focuzd/data/settings_storage/db_settings.dart';

class MockSettingsRepository extends Mock implements SettingsRepository {}

class FakeTicker extends Ticker {
  // Always return a 3-step countdown stream for any ticks value
  @override
  Stream<int> tick({required int ticks}) => Stream.fromIterable([ticks - 1, if (ticks > 1) ticks - 2, if (ticks > 2) ticks - 3].where((e) => e >= 0));
}

void main() {
  group('PomodoroBloc unit tests', () {
    late MockSettingsRepository mockRepo;

    setUp(() {
      mockRepo = MockSettingsRepository();
      // Provide a default stored settings for tests to avoid null returns from mock
      final defaultStored = SettingsVariable(
        id: 1,
        windowOnTop: false,
        defaultNumberOfSessionsPerRound: 4,
        defaultBreakDurationStored: 5,
        defaultFocusDurationStored: 25,
        defaultLongBreakDurationStored: 15,
        atWillStart: false,
        periodofLongBreak: 4,
      );
      when(() => mockRepo.fetchSettings()).thenAnswer((_) async => defaultStored);
    });

    test('TimerInit reads settings and emits TimerInitial with stored values', () async {
      final stored = SettingsVariable(
        id: 1,
        windowOnTop: false,
        defaultNumberOfSessionsPerRound: 4,
        defaultBreakDurationStored: 1,
        defaultFocusDurationStored: 1,
        defaultLongBreakDurationStored: 2,
        atWillStart: false,
        periodofLongBreak: 4,
      );

      when(() => mockRepo.fetchSettings()).thenAnswer((_) async => stored);

      final bloc = PomodoroBloc(ticker: FakeTicker(), settingsRepo: mockRepo);

      bloc.add(const TimerInit());

      // allow async handlers to run
      await Future.delayed(Duration.zero);

      final state = bloc.state;
      expect(state, isA<TimerInitial>());
      expect(state.duration, stored.defaultFocusDurationStored * 60);

      await bloc.close();
    });

    test('TimerStarted emits TimerRunInProgress with given duration', () async {
      // Use a ticker stream that does not emit 0 to avoid triggering NextPomodoroTimer
      final tickerStream = Stream.fromIterable([3, 2, 1]);
      final bloc = PomodoroBloc(ticker: FakeTicker(), settingsRepo: mockRepo);

      bloc.add(const TimerStarted(duration: 3));

      // allow asynchronous events to process
      await Future.delayed(Duration(milliseconds: 50));

      expect(bloc.state, isA<TimerRunInProgress>());
      expect(bloc.state.duration, 3);

      await bloc.close();
    });
  });
}
