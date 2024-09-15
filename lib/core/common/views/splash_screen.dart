import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payung_pribadi_clone/core/extensions/context_extensions.dart';
import 'package:payung_pribadi_clone/core/utils/core_utils.dart';
import 'package:payung_pribadi_clone/src/profile/presentation/bloc/profile_bloc.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/fonts.dart';
import '../../../src/dashboard/presentation/views/dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const GetProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileError) {
          CoreUtils.showSnackBar(context, state.message, Colours.errorColour);
        } else if (state is ProfileLoaded) {
          context.userProvider.initUser(state.user);
          Navigator.pushReplacementNamed(context, Dashboard.routeName);
        }
      },
      builder: (context, state) {
        return const Scaffold(
          backgroundColor: Colours.primaryColour,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.umbrella,
                    size: 60,
                    color: Colors.white,
                  ),
                  Text(
                    'payuung',
                    style: TextStyle(
                      fontFamily: Fonts.inter,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'pribadi - clone',
                    style: TextStyle(
                      fontFamily: Fonts.inter,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
