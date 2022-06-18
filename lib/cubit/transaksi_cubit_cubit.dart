import 'package:airplane/models/transaksi_model.dart';
import 'package:airplane/services/transaksi_service.dart';
import 'package:airplane/ui/pages/transaksi_page.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaksi_cubit_state.dart';

class TransaksiCubitCubit extends Cubit<TransaksiCubitState> {
  TransaksiCubitCubit() : super(TransaksiCubitInitial());

  void createTransaksi(transaksiModel transaksi) async {
    try {
      emit(TransaksiLoading());
      await TransaksiService().createTransaksi(transaksi);
      emit(TransaksiSuccess([]));
    } catch (e) {
      emit(TransaksiFail(e.toString()));
    }
  }

  void fetchTransaksi() async {
    try {
      emit(TransaksiLoading());
      List<transaksiModel> transaksi =
          await TransaksiService().fetchTransaksi();
      emit(TransaksiSuccess(transaksi));
    } catch (e) {
      emit(TransaksiFail(e.toString()));
    }
  }
}
