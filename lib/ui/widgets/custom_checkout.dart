import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class custom_checkout extends StatelessWidget {
  final String title;
  final String valueText;
  final Color valueColor;
  const custom_checkout({
    Key? key,
    required this.title,
    required this.valueColor,
    required this.valueText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 16,
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 6),
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_check.png'),
              ),
            ),
          ),
          Text(title),
          Spacer(),
          Text(
            valueText,
            style: blackTextStyle.copyWith(
              fontWeight: semibold,
              color: valueColor,
            ),
          )
        ],
      ),
    );
  }
}
