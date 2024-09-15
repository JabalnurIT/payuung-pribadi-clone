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

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeIndex(int currentIndex) {
    if (_currentIndex != currentIndex) {
      _currentIndex = currentIndex;
      notifyListeners();
    }
  }

  bool? _sameAddress = false;

  bool? get sameAddress => _sameAddress;

  void changeSameAddress(bool? sameAddress) {
    if (_sameAddress != sameAddress) {
      _sameAddress = sameAddress;
      notifyListeners();
    }
  }
}
