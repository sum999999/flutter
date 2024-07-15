
import 'package:flutter/foundation.dart';

class UserInfoProvider with ChangeNotifier {
  String _name = '';
  String _email = '';

  String get name => _name;
  String get email => _email;

  void updateUserInfo(String name, String email) {
    _name = name;
    _email = email;
    notifyListeners();
  }
  void removeUserInfo(String name, String email) {
    _name = '';
    _email = '';
    notifyListeners();
  }
}