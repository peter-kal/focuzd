import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:focuzd/blocs/page_navigation_bloc/page_navigation_bloc.dart';

void main() {
  group('PageNavigationBloc', () {
    blocTest<PageNavigationBloc, PageNavigationState>(
      'emits MainPageState when MainPageEvent is added',
      build: () => PageNavigationBloc(),
      act: (bloc) => bloc.add(MainPageEvent()),
      expect: () => [isA<MainPageState>()],
    );

    blocTest<PageNavigationBloc, PageNavigationState>(
      'emits SettingsPageState when SettingsPageEvent is added',
      build: () => PageNavigationBloc(),
      act: (bloc) => bloc.add(SettingsPageEvent()),
      expect: () => [isA<SettingsPageState>()],
    );
  });
}
