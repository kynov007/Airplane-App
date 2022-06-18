import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/ui/pages/home_page.dart';
import 'package:airplane/ui/pages/setting_page.dart';
import 'package:airplane/ui/pages/transaksi_page.dart';
import 'package:airplane/ui/pages/wallet_page.dart';
import 'package:airplane/ui/widgets/custom_buttom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class mainPage extends StatelessWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildcontent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return wallet();
        case 3:
          return setting();
        default:
          return HomePage();
      }
    }

    Widget customButtonNav() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
            bottom: 10,
            left: 24,
            right: 24,
          ),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              custombuttonnavitem(
                index: 0,
                imageUrl: 'assets/icon_home.png',
              ),
              custombuttonnavitem(
                index: 1,
                imageUrl: 'assets/icon_booking.png',
              ),
              custombuttonnavitem(
                index: 2,
                imageUrl: 'assets/icon_card.png',
              ),
              custombuttonnavitem(
                index: 3,
                imageUrl: 'assets/icon_setting.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              buildcontent(currentIndex),
              customButtonNav(),
            ],
          ),
        );
      },
    );
  }
}
