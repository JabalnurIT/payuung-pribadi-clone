import 'package:flutter/cupertino.dart';

import '../../../../src/profile/domain/entities/user.dart';

class UserProvider extends ChangeNotifier {
  LocalUser? _user;

  LocalUser? get user => _user;

  void initUser(LocalUser user) {
    if (_user != user) {
      _user = user;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }

  set user(LocalUser? user) {
    if (_user != user) {
      _user = user;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }
}
