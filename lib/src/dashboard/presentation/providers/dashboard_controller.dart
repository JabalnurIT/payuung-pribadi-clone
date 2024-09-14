import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payung_pribadi_clone/core/common/views/blank_screen.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/app/providers/tab_navigator.dart';
import '../../../../core/common/views/persistent_view.dart';
import '../../../../core/services/injection_container.dart';
import '../../../home/presentation/bloc/home_bloc.dart';
import '../../../home/presentation/views/home_screen.dart';

class DashboardController extends ChangeNotifier {
  List<int> _indexHistory = [0];
  // I want to get role user from ContextExtensions on BuildContext

  late List<Widget> _screens = [];

  List<Widget> get screens => _screens;

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  bool _isOverlay = false;

  bool get isOverlay => _isOverlay;

  void getScreens() {
    _screens = [
      ChangeNotifierProvider(
          create: (_) => TabNavigator(
                TabItem(
                  child: BlocProvider(
                    create: (context) => sl<HomeBloc>(),
                    child: const HomeScreen(),
                  ),
                ),
              ),
          child: const PersistentView()),
      ChangeNotifierProvider(
          create: (_) => TabNavigator(
                TabItem(
                  child: const BlankScreen(
                    title: "Cari",
                  ),
                ),
              ),
          child: const PersistentView()),
      ChangeNotifierProvider(
          create: (_) => TabNavigator(
                TabItem(
                  child: const BlankScreen(
                    title: "Keranjang",
                  ),
                ),
              ),
          child: const PersistentView()),
      ChangeNotifierProvider(
          create: (_) => TabNavigator(
                TabItem(
                  child: const BlankScreen(
                    title: "Daftar Transaksi",
                  ),
                ),
              ),
          child: const PersistentView()),
      ChangeNotifierProvider(
          create: (_) => TabNavigator(
                TabItem(
                  child: const BlankScreen(
                    title: "Voucher Saya",
                  ),
                ),
              ),
          child: const PersistentView()),
      ChangeNotifierProvider(
          create: (_) => TabNavigator(
                TabItem(
                  child: const BlankScreen(
                    title: "Alamat Pengiriman",
                  ),
                ),
              ),
          child: const PersistentView()),
      ChangeNotifierProvider(
          create: (_) => TabNavigator(
                TabItem(
                  child: Container(
                    height: double.infinity,
                    color: Colors.red,
                    child: const BlankScreen(
                      title: "Daftar Teman",
                    ),
                  ),
                ),
              ),
          child: const PersistentView()),
    ];
  }

  void changeIndex(int index) {
    if (index == _currentIndex) return;
    _currentIndex = index;
    _indexHistory.add(index);
    notifyListeners();
  }

  void changeOverlay(bool isOverlay) {
    _isOverlay = isOverlay;
    notifyListeners();
  }

  void goBack() {
    if (_indexHistory.length == 1) return;
    _indexHistory.removeLast();
    _currentIndex = _indexHistory.last;
    notifyListeners();
  }

  void resetIndex() {
    _indexHistory = [0];
    _currentIndex = 0;
    notifyListeners();
  }
}
