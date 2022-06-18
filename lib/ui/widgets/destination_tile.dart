import 'package:airplane/models/destination_model.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import '../pages/detail_page.dart';

class destinationTile extends StatelessWidget {
  final destinationModel destination;

  const destinationTile(
    this.destination, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(destination),
          ),
        );
      }),
      child: Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: NetworkImage(destination.imageUrl),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    destination.city,
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 50,
                right: 5,
              ),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_star.png'),
                ),
              ),
            ),
            Text(
              destination.ratting.toString(),
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
