import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class successPage extends StatelessWidget {
  const successPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 300,
                    margin: EdgeInsets.only(
                      top: 60,
                      right: 36,
                      left: 39,
                      bottom: 80,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image_success.png'),
                      ),
                    ),
                  ),
                  Text(
                    'Well Booked 😍',
                    style: blackTextStyle.copyWith(
                      fontWeight: semibold,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Are you ready to explore the new\nworld of experiences?',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  customButtonNext(
                    title: 'My Bookings',
                    onPressed: () {
                      context.read<PageCubit>().setPage(1);
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/main', (route) => false);
                    },
                    width: 220,
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
