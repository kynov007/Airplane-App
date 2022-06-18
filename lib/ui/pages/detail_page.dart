import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/choose_seat.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/custom_interest.dart';
import 'package:airplane/ui/widgets/custon_photos_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final destinationModel destination;
  const DetailPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundimage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(destination.imageUrl), fit: BoxFit.cover),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget conttent() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          children: [
            //emblem
            Container(
              width: double.infinity,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_emblem.png'),
                ),
              ),
            ),

            //judul
            Container(
              margin: EdgeInsets.only(
                top: 256,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination.name,
                          style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semibold,
                          ),
                        ),
                        Text(
                          destination.city,
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icon_star.png'),
                          ),
                        ),
                      ),
                      Text(
                        destination.ratting.toString(),
                        style: whiteTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            //about
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 30,
              ),
              padding: EdgeInsets.only(
                top: 30,
                left: 20,
                right: 20,
                bottom: 30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: kWhiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                    style: blackTextStyle.copyWith(height: 1.3),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Photos',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      photosItem(imgUrl: 'assets/image_photo1.png'),
                      photosItem(imgUrl: 'assets/image_photo2.png'),
                      photosItem(imgUrl: 'assets/image_photo3.png'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Interests',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Interest(
                        title: 'Kids Park',
                      ),
                      Interest(
                        title: 'Honor Bridge',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Interest(title: 'City Museum'),
                      Interest(title: 'Central Mall')
                    ],
                  ),
                  SizedBox(
                    height: 61,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'IDR ',
                                      decimalDigits: 0)
                                  .format(destination.price),
                              style: blackTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: medium,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Per Orang',
                              style: greyTextStyle.copyWith(
                                fontWeight: light,
                              ),
                            ),
                          ],
                        ),
                      ),
                      customButtonNext(
                        title: 'Book Now',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => pilihKursi(destination)),
                            ),
                          );
                        },
                        width: 170,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundimage(),
            customShadow(),
            conttent(),
          ],
        ),
      ),
    );
  }
}
