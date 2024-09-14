import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/app/providers/user_provider.dart';
import '../../../../core/utils/core_utils.dart';
import '../bloc/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const routeName = '/profile';

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (_, state) {
          if (state is ProfileError) {
            CoreUtils.showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Consumer<UserProvider>(
              builder: (_, productProvider, __) {
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
