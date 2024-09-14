import 'package:flutter/cupertino.dart';

import '../../../../src/home/domain/entities/wellness.dart';

class WellnessProvider extends ChangeNotifier {
  Wellness? _wellness;

  Wellness? get wellness => _wellness;

  void initWellness(Wellness wellness) {
    if (_wellness != wellness) {
      _wellness = wellness;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }

  set wellness(Wellness? wellness) {
    if (_wellness != wellness) {
      _wellness = wellness;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }

  List<Wellness> _wellnesses = [];

  List<Wellness> get wellnesses => _wellnesses;

  void initWellnesses(List<Wellness> wellnesses) {
    if (_wellnesses != wellnesses) {
      _wellnesses = wellnesses;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }

  set wellnesses(List<Wellness> wellnesses) {
    if (_wellnesses != wellnesses) {
      _wellnesses = wellnesses;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }
}
