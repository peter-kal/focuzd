import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_el.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('el'),
    Locale('en')
  ];

  /// No description provided for @mainPage.
  ///
  /// In en, this message translates to:
  /// **'Main Page'**
  String get mainPage;

  /// No description provided for @settingsPage.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsPage;

  /// No description provided for @backArrowTooltip.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get backArrowTooltip;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get minutes;

  /// No description provided for @reset2Default.
  ///
  /// In en, this message translates to:
  /// **'Reset to Default'**
  String get reset2Default;

  /// No description provided for @alwaysOnTopOption.
  ///
  /// In en, this message translates to:
  /// **'Window Always On Top'**
  String get alwaysOnTopOption;

  /// No description provided for @alwaysOnTopOptionDescription.
  ///
  /// In en, this message translates to:
  /// **'Make the window always be on top of others'**
  String get alwaysOnTopOptionDescription;

  /// No description provided for @playButtonTooltip.
  ///
  /// In en, this message translates to:
  /// **'Plan'**
  String get playButtonTooltip;

  /// No description provided for @resumeButtonTooltip.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resumeButtonTooltip;

  /// No description provided for @pauseButtonTooltip.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pauseButtonTooltip;

  /// No description provided for @resetSessionButtonTooltip.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetSessionButtonTooltip;

  /// No description provided for @nextSessionButtonTooltip.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextSessionButtonTooltip;

  /// No description provided for @focusTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Focus Time'**
  String get focusTimeLabel;

  /// No description provided for @breakTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Break Time'**
  String get breakTimeLabel;

  /// No description provided for @longBreakTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Long Break Time'**
  String get longBreakTimeLabel;

  /// No description provided for @numberLabelSettings.
  ///
  /// In en, this message translates to:
  /// **'integer'**
  String get numberLabelSettings;

  /// No description provided for @roundsLabelSettings.
  ///
  /// In en, this message translates to:
  /// **'Sessions per Round'**
  String get roundsLabelSettings;

  /// No description provided for @roundPlanningTitleBar.
  ///
  /// In en, this message translates to:
  /// **'Round Plan'**
  String get roundPlanningTitleBar;

  /// No description provided for @addSessionButton.
  ///
  /// In en, this message translates to:
  /// **'Add Session'**
  String get addSessionButton;

  /// No description provided for @startButtonOnPlanning.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get startButtonOnPlanning;

  /// No description provided for @changeDurationLabel.
  ///
  /// In en, this message translates to:
  /// **'Change Duration'**
  String get changeDurationLabel;

  /// No description provided for @selectSubjectLabel.
  ///
  /// In en, this message translates to:
  /// **'Select a Subject'**
  String get selectSubjectLabel;

  /// No description provided for @deleteSessionTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete Session'**
  String get deleteSessionTooltip;

  /// No description provided for @tooltipTakeNotes.
  ///
  /// In en, this message translates to:
  /// **'Take Notes'**
  String get tooltipTakeNotes;

  /// No description provided for @tooltipRoundProgressEnd.
  ///
  /// In en, this message translates to:
  /// **'Round Progress:'**
  String get tooltipRoundProgressEnd;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['el', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
