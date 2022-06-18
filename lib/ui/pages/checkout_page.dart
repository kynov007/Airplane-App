import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/cubit/transaksi_cubit_cubit.dart';
import 'package:airplane/models/transaksi_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/custom_checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class checkout_pages extends StatelessWidget {
  final transaksiModel transaksi;
  const checkout_pages(this.transaksi, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget Title() {
      return Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 25,
                bottom: 10,
              ),
              width: 291,
              height: 65,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image_checkout.png'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'CGK',
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semibold,
                      ),
                    ),
                    Text(
                      'Tangerang',
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'CGK',
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semibold,
                      ),
                    ),
                    Text(
                      'Tangerang',
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget badan() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor,
        ),
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16, bottom: 20),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      18,
                    ),
                    image: DecorationImage(
                        image: NetworkImage(transaksi.destination.imageUrl),
                        fit: BoxFit.cover),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaksi.destination.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    Text(
                      transaksi.destination.city,
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 31,
                  ),
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icon_star.png'),
                    ),
                  ),
                ),
                Text(
                  transaksi.destination.ratting.toString(),
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                )
              ],
            ),

            //
            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                'Booking Detail',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
            ),
            custom_checkout(
                title: 'Traveler',
                valueColor: kBlackColor,
                valueText: '${transaksi.amountOfTraveler} Person'),
            custom_checkout(
              title: 'Seat',
              valueColor: kBlackColor,
              valueText: transaksi.selectedSeats,
            ),
            custom_checkout(
              title: 'Insurance',
              valueColor: transaksi.insurance ? kGreenColor : kRedColor,
              valueText: transaksi.insurance ? 'YES' : 'NO',
            ),
            custom_checkout(
              title: 'Refundable',
              valueColor: transaksi.refundable ? kGreenColor : kRedColor,
              valueText: transaksi.refundable ? 'YES' : 'NO',
            ),
            custom_checkout(
              title: 'VAT',
              valueColor: kBlackColor,
              valueText: '${(transaksi.vat * 100).toStringAsFixed(0)}%',
            ),
            custom_checkout(
              title: 'Price',
              valueColor: kBlackColor,
              valueText: NumberFormat.currency(
                      locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                  .format(transaksi.price),
            ),
            custom_checkout(
              title: 'Grand Total',
              valueColor: kPrimaryColor,
              valueText: NumberFormat.currency(
                      locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                  .format(transaksi.grandTotal),
            ),
          ],
        ),
      );
    }

    Widget paymentDetail() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              margin: EdgeInsets.only(
                top: 30,
                bottom: 30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: kWhiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Payment Detail',
                      style: blackTextStyle.copyWith(
                        fontWeight: semibold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 18),
                        width: 100,
                        height: 70,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/image_card.png'),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 6),
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/icon_plane.png'),
                                  ),
                                ),
                              ),
                              Text(
                                'Pay',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'IDR ',
                                    decimalDigits: 0)
                                .format(state.user.balance),
                            style: blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: medium,
                            ),
                          ),
                          Text(
                            'Current Balance',
                            style: greyTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      );
    }

    Widget footer() {
      return BlocConsumer<TransaksiCubitCubit, TransaksiCubitState>(
        listener: (context, state) {
          if (state is TransaksiSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/success', (route) => false);
          } else if (state is TransaksiFail) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kRedColor,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TransaksiLoading) {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            margin: EdgeInsets.only(bottom: 30),
            child: customButtonNext(
              title: 'Pay Now',
              onPressed: () {
                context.read<TransaksiCubitCubit>().createTransaksi(transaksi);
              },
              width: double.infinity,
            ),
          );
        },
      );
    }

    Widget term() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Center(
          child: Text(
            'Terms and Conditions',
            style: greyTextStyle.copyWith(fontWeight: light, fontSize: 16),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          children: [
            Title(),
            badan(),
            paymentDetail(),
            footer(),
            term(),
          ],
        ),
      ),
    );
  }
}
