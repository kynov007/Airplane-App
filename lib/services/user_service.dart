import 'package:airplane/models/User_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class UserService {
  CollectionReference _UserReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(User_model user) async {
    try {
      _UserReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'hobby': user.hobby,
        'ballance': user.balance,
        'password': user.password
      });
    } catch (e) {
      throw e;
    }
  }

  Future<User_model> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _UserReference.doc(id).get();
      return User_model(
        id: id,
        email: snapshot['email'],
        name: snapshot['name'],
        hobby: snapshot['hobby'],
        password: snapshot['password'],
      );
    } catch (e) {
      throw e;
    }
  }
}
