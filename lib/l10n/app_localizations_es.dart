// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get mainPage => 'Main Page';

  @override
  String get settingsPage => 'Ajustes';

  @override
  String get backArrowTooltip => 'Volver';

  @override
  String get minutes => 'Minutos';

  @override
  String get reset2Default => 'Restablecer valores predeterminados';

  @override
  String get alwaysOnTopOption => 'Ventana siempre visible';

  @override
  String get alwaysOnTopOptionDescription =>
      'Mantiene la ventana siempre por encima de las demás';

  @override
  String get playButtonTooltip => 'Iniciar';

  @override
  String get resumeButtonTooltip => 'Reanudar';

  @override
  String get pauseButtonTooltip => 'Pausar';

  @override
  String get resetSessionButtonTooltip => 'Reiniciar';

  @override
  String get nextSessionButtonTooltip => 'Siguiente';

  @override
  String get workTimeLabel => 'Tiempo de enfoque';

  @override
  String get breakTimeLabel => 'Tiempo de descanso';

  @override
  String get longBreakTimeLabel => 'Tiempo de descanso largo';

  @override
  String get numberLabelSettings => 'Número entero';

  @override
  String get roundsLabelSettings => 'Número de sesiones';

  @override
  String get periodLB => 'Frecuencia del descanso largo';

  @override
  String get manualStart => 'Inicio manual';

  @override
  String get infoManualStart =>
      'Una vez activado, el tiempo de enfoque después de los descansos se iniciará manualmente.';
}
