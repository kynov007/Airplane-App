import 'package:flutter/material.dart';

class photosItem extends StatelessWidget {
  final String imgUrl;
  const photosItem({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(
          image: AssetImage(imgUrl),
        ),
      ),
    );
  }
}
