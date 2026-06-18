// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get placar => 'SCORE';

  @override
  String get time1 => 'Team 1';

  @override
  String get time2 => 'Team 2';

  @override
  String get lanceLivre => 'Free Throw';

  @override
  String get doisPontos => '2 Points';

  @override
  String get tresPontos => '3 Points';

  @override
  String get voltarLance => 'Undo Shot';

  @override
  String scoreFormat(int score1, int score2) {
    return '$score1 x $score2';
  }
}
