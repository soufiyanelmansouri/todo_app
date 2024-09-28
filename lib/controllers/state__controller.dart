import 'package:flutter/foundation.dart';

enum EnState { idel, busy }

class StateController extends ChangeNotifier {
  EnState _state = EnState.idel;
  EnState get state => _state;

  void setState(newState) {
    _state = newState;
    notifyListeners();
  }
}
