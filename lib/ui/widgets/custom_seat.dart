import 'package:airplane/cubit/seat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class customSeat extends StatelessWidget {
  final bool isAvailable;

  final String id;
  const customSeat({
    Key? key,
    required this.id,
    this.isAvailable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (!isAvailable) {
        return kunavailable;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kAvailable;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return kunavailable;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kPrimaryColor;
        }
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            'You',
            style: whiteTextStyle.copyWith(
              fontWeight: semibold,
            ),
          ),
        );
      } else {
        SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor()),
        ),
        child: child(),
      ),
    );
  }
}
