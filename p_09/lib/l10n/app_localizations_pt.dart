// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get placar => 'PLACAR';

  @override
  String get time1 => 'Time 1';

  @override
  String get time2 => 'Time 2';

  @override
  String get lanceLivre => 'Lance Livre';

  @override
  String get doisPontos => '2 Pontos';

  @override
  String get tresPontos => '3 Pontos';

  @override
  String get voltarLance => 'Voltar Lance';

  @override
  String scoreFormat(int score1, int score2) {
    return '$score1 x $score2';
  }
}
