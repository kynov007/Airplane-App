import 'package:airplane/models/transaksi_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/theme.dart';
import 'custom_checkout.dart';

class transaksiCard extends StatelessWidget {
  final transaksiModel transaksi;
  const transaksiCard(this.transaksi, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
