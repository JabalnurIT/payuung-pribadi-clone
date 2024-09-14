import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/app/providers/wellness_provider.dart';
import '../../../../core/utils/core_utils.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (_, state) {
          if (state is HomeError) {
            CoreUtils.showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Consumer<WellnessProvider>(
              builder: (_, wellnessProvider, __) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.86,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
