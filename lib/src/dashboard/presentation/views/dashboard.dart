import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/common/widgets/bottom_sheet_widget.dart';
import '../../../../core/res/media_res.dart';
import '../providers/dashboard_controller.dart';
import '../widgets/bottom_nav_column_item.dart';
import '../widgets/bottom_nav_icon.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  static const routeName = '/dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _isShowAllButton = false;
  double _height = 120;
  @override
  void initState() {
    super.initState();
    context.read<DashboardController>().getScreens();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(builder: (_, controller, __) {
      return Scaffold(
        body: GestureDetector(
          onTap: () {
            if (_isShowAllButton) {
              setState(() {
                _height = 120;
                _isShowAllButton = false;
              });
            }
          },
          child: Stack(
            children: [
              IndexedStack(
                index: controller.currentIndex,
                children: controller.screens,
              ),
              if (_isShowAllButton)
                Container(
                  color: Colors.black.withOpacity(0.3),
                ),
            ],
          ),
        ),
        bottomNavigationBar: BottomSheetWidget(
          onTap: () {
            setState(() {
              if (!_isShowAllButton) {
                _height = 360;
                _isShowAllButton = true;
              } else {
                _height = 120;
                _isShowAllButton = false;
              }
            });
          },
          isShowAllButton: _isShowAllButton,
          height: _height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BottomNavColumnItem(
                items: [
                  BottomNavItemIcon(
                    controller: controller,
                    onTap: controller.changeIndex,
                    icon: MediaRes.homeIcon,
                    index: 0,
                    label: 'Beranda',
                  ),
                  BottomNavItemIcon(
                    controller: controller,
                    onTap: controller.changeIndex,
                    icon: MediaRes.searchIcon,
                    index: 1,
                    label: 'Cari',
                  ),
                  BottomNavItemIcon(
                    controller: controller,
                    onTap: controller.changeIndex,
                    icon: MediaRes.cartIcon,
                    index: 2,
                    label: 'Keranjang',
                  ),
                ],
              ),
              BottomNavColumnItem(
                items: [
                  BottomNavItemIcon(
                    controller: controller,
                    onTap: controller.changeIndex,
                    icon: MediaRes.transactionIcon,
                    index: 3,
                    label: 'Daftar Transaksi',
                  ),
                  BottomNavItemIcon(
                    controller: controller,
                    onTap: controller.changeIndex,
                    icon: MediaRes.voucherIcon,
                    index: 4,
                    label: 'Voucher Saya',
                  ),
                  BottomNavItemIcon(
                    controller: controller,
                    onTap: controller.changeIndex,
                    icon: MediaRes.addressIcon,
                    index: 5,
                    label: 'Alamat Pengiriman',
                  ),
                ],
              ),
              BottomNavColumnItem(
                items: [
                  BottomNavItemIcon(
                    controller: controller,
                    onTap: controller.changeIndex,
                    icon: MediaRes.friendsIcon,
                    index: 6,
                    label: 'Daftar Teman',
                  ),
                  const BottomNavItemIcon(
                    isActive: false,
                  ),
                  const BottomNavItemIcon(
                    isActive: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
