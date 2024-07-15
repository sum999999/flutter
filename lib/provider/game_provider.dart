import 'package:flutter/foundation.dart';

class GameProvider with ChangeNotifier {
  bool _hasPlayed = false;

  bool get hasPlayed => _hasPlayed;

  void playGame() {
    _hasPlayed = true;
    notifyListeners();
  }
  void noplayGame() {
    _hasPlayed = false;
    notifyListeners();
  }
}