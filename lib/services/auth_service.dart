import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseAuth? get firebaseAuth => _firebaseAuth;

  Future<UserModel?> signUpWithEmail(String email, String password) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = result.user;
      return UserModel(uid: user!.uid, email: user.email!, passwod: password);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "An unknown error occurred.";
    }
  }

  Future<UserModel?> signInWithEmail(String email, String password) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = result.user;
      return UserModel(uid: user!.uid, email: user.email!, passwod: password);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "An unknown error occurred.";
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
