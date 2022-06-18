import 'package:airplane/models/User_model.dart';
import 'package:airplane/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User_model> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User_model user =
          await UserService().getUserById(userCredential.user!.uid);
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<User_model> signUp(
      {required String email,
      required String password,
      required String name,
      String hobby = ''}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      User_model user = User_model(
        id: userCredential.user!.uid,
        email: email,
        name: name,
        hobby: hobby,
        balance: 280000000,
        password: password,
      );

      await UserService().setUser(user);

      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }
}
