part of 'transaksi_cubit_cubit.dart';

abstract class TransaksiCubitState extends Equatable {
  const TransaksiCubitState();

  @override
  List<Object> get props => [];
}

class TransaksiCubitInitial extends TransaksiCubitState {}

class TransaksiLoading extends TransaksiCubitState {}

class TransaksiSuccess extends TransaksiCubitState {
  final List<transaksiModel> transaksi;
  TransaksiSuccess(this.transaksi);

  @override
  // TODO: implement props
  List<Object> get props => [transaksi];
}

class TransaksiFail extends TransaksiCubitState {
  final String error;
  TransaksiFail(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
