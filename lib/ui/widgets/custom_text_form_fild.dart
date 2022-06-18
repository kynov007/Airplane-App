import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class customTextFormFild extends StatelessWidget {
  final String title;
  final String hint;
  final bool obscureText;
  final TextEditingController controller;

  const customTextFormFild({
    Key? key,
    required this.title,
    required this.hint,
    required this.obscureText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
          ),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            // mengganti warna ketikan
            cursorColor: kBlackColor,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
                // mengganti warna border ketika focus
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
