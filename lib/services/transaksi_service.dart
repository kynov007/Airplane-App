import 'package:airplane/models/transaksi_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class TransaksiService {
  CollectionReference _transaksiReference =
      FirebaseFirestore.instance.collection('transaksi');

  Future<void> createTransaksi(transaksiModel transaksi) async {
    try {
      _transaksiReference.add({
        'destination': transaksi.destination.toJson(),
        'amountOfTraveler': transaksi.amountOfTraveler,
        'SelectedSeat': transaksi.selectedSeats,
        'Insurance': transaksi.insurance,
        'Refoundable': transaksi.refundable,
        'Vat': transaksi.vat,
        'Price': transaksi.price,
        'GrandTotal': transaksi.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<transaksiModel>> fetchTransaksi() async {
    try {
      QuerySnapshot result = await _transaksiReference.get();

      List<transaksiModel> transaksi = result.docs.map(
        (e) {
          return transaksiModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();
      return transaksi;
    } catch (e) {
      throw e;
    }
  }
}
