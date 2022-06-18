import 'package:airplane/models/destination_model.dart';
import 'package:airplane/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class customDestinationalcart extends StatelessWidget {
  final destinationModel destination;

  const customDestinationalcart(
    this.destination, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(destination),
          ),
        );
      },
      child: Container(
        width: 200,
        height: 323,
        margin: EdgeInsets.only(
          left: defaultMargin,
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: NetworkImage(destination.imageUrl),
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 55,
                  height: 30,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icon_star.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        destination.ratting.toString(),
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
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
                    style: greyTextStyle.copyWith(fontWeight: light),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
