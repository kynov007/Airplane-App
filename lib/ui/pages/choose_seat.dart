import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/models/transaksi_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/checkout_page.dart';
import 'package:airplane/ui/pages/transaksi_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/custom_seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class pilihKursi extends StatelessWidget {
  final destinationModel destination;
  const pilihKursi(
    this.destination, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        child: Text(
          'Select Your\nFavorite Seat',
          style: blackTextStyle.copyWith(
            fontWeight: semibold,
            fontSize: 24,
          ),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                right: 6,
              ),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_available.png'),
                ),
              ),
            ),
            Text(
              'Available',
              style: blackTextStyle,
            ),
            Container(
              margin: EdgeInsets.only(
                right: 6,
                left: 45,
              ),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_selected.png'),
                ),
              ),
            ),
            Text(
              'Available',
              style: blackTextStyle,
            ),
            Container(
              margin: EdgeInsets.only(
                right: 6,
                left: 45,
              ),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_unavailable.png'),
                ),
              ),
            ),
            Text(
              'Available',
              style: blackTextStyle,
            ),
          ],
        ),
      );
    }

    Widget listSeat() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(
              top: 30,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 30,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'A',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'B',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          '',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'C',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'D',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                //
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customSeat(
                        id: 'A1',
                        isAvailable: false,
                      ),
                      customSeat(
                        id: 'B1',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '1',
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      customSeat(
                        id: 'C1',
                      ),
                      customSeat(
                        id: 'D1',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customSeat(
                        id: 'A2',
                      ),
                      customSeat(
                        id: 'B2',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '2',
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      customSeat(
                        id: 'C2',
                      ),
                      customSeat(
                        id: 'D2',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customSeat(
                        id: 'A3',
                      ),
                      customSeat(
                        id: 'B3',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '3',
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      customSeat(
                        id: 'C3',
                      ),
                      customSeat(
                        id: 'D3',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customSeat(
                        id: 'A4',
                      ),
                      customSeat(
                        id: 'B4',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '4',
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      customSeat(
                        id: 'C4',
                      ),
                      customSeat(
                        id: 'D4',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customSeat(
                        id: 'A5',
                      ),
                      customSeat(
                        id: 'B5',
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '5',
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      customSeat(
                        id: 'C5',
                      ),
                      customSeat(
                        id: 'D5',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 30,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Your Seat',
                          style: greyTextStyle.copyWith(fontWeight: light),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          state.join(', '),
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16, bottom: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                            .format(state.length * destination.price),
                        style: purpleTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                ),
                BlocBuilder<SeatCubit, List<String>>(
                  builder: (context, state) {
                    return customButtonNext(
                      title: 'Continue To Payment',
                      onPressed: () {
                        int price = destination.price * state.length;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => checkout_pages(
                                  transaksiModel(
                                    destination: destination,
                                    amountOfTraveler: state.length,
                                    selectedSeats: state.join(', '),
                                    insurance: true,
                                    refundable: false,
                                    price: price,
                                    vat: 0.45,
                                    grandTotal: price + (price * 0.45).toInt(),
                                  ),
                                )),
                          ),
                        );
                      },
                      width: 327,
                      margin: EdgeInsets.only(bottom: 46),
                    );
                  },
                )
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            title(),
            seatStatus(),
            listSeat(),
          ],
        ),
      ),
    );
  }
}
