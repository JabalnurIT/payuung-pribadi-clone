import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../src/dashboard/presentation/providers/dashboard_controller.dart';
import '../common/app/providers/tab_navigator.dart';
import '../common/app/providers/user_provider.dart';
import '../common/app/providers/wellness_provider.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;
  double get width => size.width;
  double get height => size.height;

  UserProvider get userProvider => read<UserProvider>();

  WellnessProvider get wellnessProvider => read<WellnessProvider>();

  TabNavigator get tabNavigator => read<TabNavigator>();

  void pop() => tabNavigator.pop();

  void push(Widget page) => tabNavigator.push(TabItem(child: page));

  DashboardController get dashboardController => read<DashboardController>();
}
