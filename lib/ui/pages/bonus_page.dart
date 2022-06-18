import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class bonusPage extends StatelessWidget {
  const bonusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bonusCard() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              height: 211,
              width: 300,
              padding: EdgeInsets.all(defaultMargin),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/image_card.png',
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.5),
                    blurRadius: 50,
                    offset: Offset(
                      0,
                      10,
                    ),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: whiteTextStyle.copyWith(
                                fontWeight: light,
                              ),
                            ),
                            Text(
                              state.user.name,
                              style: whiteTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: medium,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        margin: EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/icon_plane.png',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Pay',
                          style: whiteTextStyle.copyWith(
                              fontSize: 16, fontWeight: medium),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 41),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Balance',
                              style: whiteTextStyle.copyWith(fontWeight: light),
                            ),
                          ],
                        ),
                        Text(
                          'Rp.290,000,000',
                          style: whiteTextStyle.copyWith(
                              fontSize: 26, fontWeight: medium),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget judul() {
      return Container(
        margin: EdgeInsets.only(
          top: 80,
        ),
        child: Column(
          children: [
            Text(
              'Big Bonus 🎉',
              style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: semibold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'We give you early credit so that\nyou can buy a flight ticket',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    Widget buttonstartfly() {
      return customButtonNext(
        title: 'Start Fly Now',
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        },
        width: 220,
        margin: EdgeInsets.only(top: 50),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bonusCard(),
            judul(),
            buttonstartfly(),
          ],
        ),
      ),
    );
  }
}
