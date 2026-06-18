import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'viewmodel/score_viewmodel.dart';
import 'screens/score_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScoreViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const ScoreScreen(),
    );
  }
}
