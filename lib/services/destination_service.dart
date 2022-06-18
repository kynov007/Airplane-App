import 'package:airplane/models/destination_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DestinationService {
  CollectionReference _destinationReff =
      FirebaseFirestore.instance.collection('destinations');

  Future<List<destinationModel>> fetchDestination() async {
    try {
      QuerySnapshot result = await _destinationReff.get();

      List<destinationModel> destinations = result.docs.map(
        (e) {
          return destinationModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();
      return destinations;
    } catch (e) {
      throw e;
    }
  }
}
