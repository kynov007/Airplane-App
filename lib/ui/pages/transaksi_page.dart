import 'package:airplane/cubit/transaksi_cubit_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/transaksi_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransaksiCubitCubit>().fetchTransaksi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransaksiCubitCubit, TransaksiCubitState>(
      builder: (context, state) {
        if (state is TransaksiLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransaksiSuccess) {
          if (state.transaksi.length == 0) {
            return Center(
              child: Text('Kamu belum memiliki transaksi'),
            );
          } else {
            return ListView.builder(
                itemCount: state.transaksi.length,
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                itemBuilder: (context, index) {
                  return transaksiCard(
                    state.transaksi[index],
                  );
                });
          }
        }

        return Center(
          child: Text('Transaction '),
        );
      },
    );
  }
}
