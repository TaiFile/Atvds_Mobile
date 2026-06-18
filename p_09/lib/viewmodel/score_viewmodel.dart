import 'package:flutter/foundation.dart';

class ScoreViewModel extends ChangeNotifier {
  int _scoreTeam1 = 0;
  int _scoreTeam2 = 0;
  bool _canUndo = false;
  int _lastTeam = 0;
  int _lastPoints = 0;

  int get scoreTeam1 => _scoreTeam1;
  int get scoreTeam2 => _scoreTeam2;
  bool get canUndo => _canUndo;

  void addPoints(int team, int points) {
    _lastTeam = team;
    _lastPoints = points;
    _canUndo = true;
    if (team == 1) {
      _scoreTeam1 += points;
    } else {
      _scoreTeam2 += points;
    }
    notifyListeners();
  }

  void undoLastAction() {
    if (_canUndo) {
      if (_lastTeam == 1) {
        _scoreTeam1 -= _lastPoints;
      } else {
        _scoreTeam2 -= _lastPoints;
      }
      _canUndo = false;
      _lastTeam = 0;
      _lastPoints = 0;
      notifyListeners();
    }
  }
}
