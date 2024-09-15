import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payung_pribadi_clone/core/common/widgets/gradient_background.dart';
import 'package:payung_pribadi_clone/core/extensions/context_extensions.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/app/providers/wellness_provider.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/utils/core_utils.dart';
import '../../../profile/presentation/views/profile_screen.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home_grid.dart';

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
    context.read<HomeBloc>().add(const GetAllWellnessEvent());
  }

  List<String> financeProducts = [
    'Urun',
    'Pembiayaan Porsi Haji',
    'Financial Check Up',
    'Asuransi Mobil',
    'Asuransi Properti',
  ];

  List<String> categories = [
    'Hobi',
    'Merchandise',
    'Gaya Hidup Sehat',
    'Koneseling & Rohani',
    'Self Development',
    'Perencanaan Keuangan',
    'Media Konsultasi',
    'Lihat Semua',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Selamat Malam',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        toolbarHeight: 70,
        backgroundColor: Colours.primaryColour,
        actions: [
          SvgPicture.asset(
            MediaRes.infoIcon,
            height: 26,
            colorFilter: const ColorFilter.mode(
              Colours.secondaryColour,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProfileScreen.routeName);
            },
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: Colours.tertiaryDisabledColour,
              child: Icon(
                Icons.person,
                color: Colours.primaryDisabledColour,
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (_, state) {
          if (state is HomeError) {
            CoreUtils.showSnackBar(context, state.message, Colours.errorColour);
          } else if (state is WellnessLoaded) {
            context.wellnessProvider.initWellnesses(state.wellnesses);
          }
        },
        builder: (context, state) {
          return Container(
            color: Colours.primaryColour,
            child: Consumer<WellnessProvider>(
              builder: (_, wellnessProvider, __) {
                return GradientBackground(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(0),
                            height: 46,
                            decoration: const BoxDecoration(
                              color: Colours.tertiaryDisabledColour,
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.all(3),
                                    child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colours.primaryColour,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(43),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Payung Pribadi',
                                          style: TextStyle(
                                            color: Colours.secondaryColour,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.all(3),
                                    child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(43),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Payung Karyawan',
                                          style: TextStyle(
                                            color:
                                                Colours.quinaryDisabledColour,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Divider(
                            thickness: 1,
                            color: Colours.tertiaryDisabledColour,
                          ),
                          SizedBox(
                            height: 210,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Produk Keuangan',
                                  style: TextStyle(
                                    color: Colours.quinaryColour,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                HomeGrid(
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          MediaRes.infoIcon,
                                          height: 26,
                                          colorFilter: const ColorFilter.mode(
                                            Colours.quinaryColour,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                        Text(
                                          financeProducts[index],
                                          style: const TextStyle(
                                            color: Colours.quinaryColour,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 210,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Kategori Pilihan',
                                      style: TextStyle(
                                        color: Colours.quinaryColour,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 4,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Colours.tertiaryDisabledColour,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(40),
                                        ),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Center(
                                          child: Row(
                                            children: [
                                              const Text(
                                                'Wishlist',
                                                style: TextStyle(
                                                  color: Colours.quinaryColour,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                decoration: const BoxDecoration(
                                                  color: Colours.primaryColour,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(40),
                                                  ),
                                                ),
                                                child: const Text(
                                                  "0",
                                                  style: TextStyle(
                                                    color:
                                                        Colours.secondaryColour,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                HomeGrid(
                                  itemCount: 8,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          MediaRes.infoIcon,
                                          height: 26,
                                          colorFilter: const ColorFilter.mode(
                                            Colours.quinaryColour,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                        Text(
                                          categories[index],
                                          style: const TextStyle(
                                            color: Colours.quinaryColour,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          Consumer<WellnessProvider>(
                            builder: (_, wellnessProvider, __) {
                              return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Explore Wellness',
                                          style: TextStyle(
                                            color: Colours.quinaryColour,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 4,
                                          ),
                                          decoration: const BoxDecoration(
                                            color:
                                                Colours.tertiaryDisabledColour,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(40),
                                            ),
                                          ),
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: const Center(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Terpopuler',
                                                    style: TextStyle(
                                                      color:
                                                          Colours.quinaryColour,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color:
                                                        Colours.quinaryColour,
                                                    size: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    state is HomeLoading
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: Colours.primaryColour,
                                            ),
                                          )
                                        : wellnessProvider.wellnesses.isEmpty
                                            ? const Text(
                                                'No wellness products available',
                                                style: TextStyle(
                                                  color: Colours.quinaryColour,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                                textAlign: TextAlign.start,
                                              )
                                            : HomeGrid(
                                                itemCount: wellnessProvider
                                                    .wellnesses.length,
                                                maxAxisCount: 2,
                                                canBeScrolled: true,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.65,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        MediaRes.infoIcon,
                                                        height: 80,
                                                        colorFilter:
                                                            const ColorFilter
                                                                .mode(
                                                          Colours.quinaryColour,
                                                          BlendMode.srcIn,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 30,
                                                      ),
                                                      Text(
                                                        wellnessProvider
                                                            .wellnesses[index]
                                                            .title,
                                                        style: const TextStyle(
                                                          color: Colours
                                                              .quinaryColour,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        CoreUtils.toMoney(
                                                            wellnessProvider
                                                                .wellnesses[
                                                                    index]
                                                                .price),
                                                        style: const TextStyle(
                                                          color: Colours
                                                              .quinaryColour,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                    ],
                                                  );
                                                },
                                              )
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
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
