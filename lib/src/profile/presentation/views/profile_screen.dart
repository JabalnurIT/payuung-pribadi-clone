import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/app/providers/user_provider.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/fonts.dart';
import '../../../../core/res/media_res.dart';
import 'personal_screen.dart';

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
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colours.quaternaryColour,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colours.secondaryColour,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Consumer<UserProvider>(
          builder: (_, userProvider, __) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.86,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colours.quaternaryColour,
                              child: Icon(
                                Icons.person,
                                size: 50,
                                color: Colours.secondaryDisabledColour,
                              ),
                            ),
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colours.secondaryDisabledColour,
                              child: Icon(
                                Icons.camera_alt,
                                size: 16,
                                color: Colours.primaryDisabledColour,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userProvider.user!.name,
                              style: const TextStyle(
                                color: Colours.quaternaryColour,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              userProvider.user!.email,
                              style: const TextStyle(
                                color: Colours.quaternaryColour,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PersonalScreen.routeName);
                    },
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colours.secondaryColour,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colours.quaternaryColour.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colours.secondaryDisabledColour,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset(
                              MediaRes.personalInfoIcon,
                              height: 16,
                              colorFilter: const ColorFilter.mode(
                                Colours.quaternaryColour,
                                BlendMode.srcIn,
                              ),
                              fit: BoxFit.none,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Informasi Pribadi',
                            style: TextStyle(
                              color: Colours.quaternaryColour,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colours.secondaryColour,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colours.quaternaryColour.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colours.secondaryDisabledColour,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            MediaRes.tacIcon,
                            height: 16,
                            colorFilter: const ColorFilter.mode(
                              Colours.quaternaryColour,
                              BlendMode.srcIn,
                            ),
                            fit: BoxFit.none,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Syarat & Ketentuan',
                          style: TextStyle(
                            color: Colours.quaternaryColour,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colours.secondaryColour,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colours.quaternaryColour.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colours.secondaryDisabledColour,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            MediaRes.helpIcon,
                            height: 16,
                            colorFilter: const ColorFilter.mode(
                              Colours.quaternaryColour,
                              BlendMode.srcIn,
                            ),
                            fit: BoxFit.none,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Bantuan',
                          style: TextStyle(
                            color: Colours.quaternaryColour,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colours.secondaryColour,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colours.quaternaryColour.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colours.secondaryDisabledColour,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            MediaRes.policyIcon,
                            height: 16,
                            colorFilter: const ColorFilter.mode(
                              Colours.quaternaryColour,
                              BlendMode.srcIn,
                            ),
                            fit: BoxFit.none,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Kebijakan Privasi',
                          style: TextStyle(
                            color: Colours.quaternaryColour,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colours.secondaryColour,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colours.quaternaryColour.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colours.secondaryDisabledColour,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            MediaRes.logOutIcon,
                            height: 16,
                            colorFilter: const ColorFilter.mode(
                              Colours.quaternaryColour,
                              BlendMode.srcIn,
                            ),
                            fit: BoxFit.none,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Log Out',
                          style: TextStyle(
                            color: Colours.quaternaryColour,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colours.secondaryColour,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colours.quaternaryColour.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colours.secondaryDisabledColour,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            MediaRes.deleteIcon,
                            height: 16,
                            colorFilter: const ColorFilter.mode(
                              Colours.quaternaryColour,
                              BlendMode.srcIn,
                            ),
                            fit: BoxFit.none,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Hapus Akun',
                          style: TextStyle(
                            color: Colours.quaternaryColour,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(child: SizedBox(height: 20)),
                  const Icon(
                    Icons.umbrella,
                    size: 30,
                    color: Colours.secondaryDisabledColour,
                  ),
                  const Text(
                    'payuung',
                    style: TextStyle(
                      fontFamily: Fonts.inter,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colours.secondaryDisabledColour,
                    ),
                  ),
                  const Text(
                    'pribadi - clone',
                    style: TextStyle(
                      fontFamily: Fonts.inter,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colours.secondaryDisabledColour,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
