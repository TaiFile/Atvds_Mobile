import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../viewmodel/score_viewmodel.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final vm = context.watch<ScoreViewModel>();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(l10n.placar),
          Text(
            l10n.scoreFormat(vm.scoreTeam1, vm.scoreTeam2),
            style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          ),
          Text(l10n.time1),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => vm.addPoints(1, 1),
                  child: Text(l10n.lanceLivre),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => vm.addPoints(1, 2),
                  child: Text(l10n.doisPontos),
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => vm.addPoints(1, 3),
              child: Text(l10n.tresPontos),
            ),
          ),
          Text(l10n.time2),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => vm.addPoints(2, 1),
                  child: Text(l10n.lanceLivre),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => vm.addPoints(2, 2),
                  child: Text(l10n.doisPontos),
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => vm.addPoints(2, 3),
              child: Text(l10n.tresPontos),
            ),
          ),
          ElevatedButton(
            onPressed: vm.canUndo ? vm.undoLastAction : null,
            child: Text(l10n.voltarLance),
          ),
        ],
      ),
    );
  }
}
