import 'package:airplane/models/destination_model.dart';
import 'package:equatable/equatable.dart';

class transaksiModel extends Equatable {
  final String id;
  final destinationModel destination;
  final int amountOfTraveler;
  final String selectedSeats;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;

  transaksiModel({
    this.id = '',
    required this.destination,
    this.amountOfTraveler = 0,
    this.selectedSeats = '',
    this.insurance = false,
    this.refundable = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        destination,
        amountOfTraveler,
        selectedSeats,
        insurance,
        refundable,
        vat,
        price,
        grandTotal
      ];

  factory transaksiModel.fromJson(String id, Map<String, dynamic> json) =>
      transaksiModel(
        id: id,
        destination: destinationModel.fromJson(
            json['destination'][id], json['destination']),
        amountOfTraveler: json['amountOfTraveler'],
        selectedSeats: json['selectedSeats'],
        insurance: json['insurance'] ?? false,
        refundable: json['refundable'] ?? false,
        vat: json['vat'],
        price: json['price'],
        grandTotal: json['grandTotal'],
      );
}
