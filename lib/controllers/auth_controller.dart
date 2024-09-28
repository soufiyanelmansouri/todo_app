import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../models/user_model.dart';

class AuthController with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel? _currentUser;
  String? _authError;

  AuthController() {
    _auth.authStateChanges().listen(_authStateChanged);
  }
  UserModel? get currentUser => _currentUser;

  String? get authError => _authError;

  void _authStateChanged(User? firebaseUser) {
    if (firebaseUser != null) {
      _currentUser = UserModel(
        uid: firebaseUser.uid,
        email: firebaseUser.email!,
      );
    } else {
      _currentUser = null;
    }
    _authError = null; // Reset error when state changes successfully
    notifyListeners();
  }

  // Sign in method
  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _authError = null; // Clear any previous errors on successful sign-in
    } on FirebaseAuthException catch (e) {
      _authError = e.message; // Capture error message
    }
    notifyListeners();
  }

  // Sign up method
  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _authError = null; // Clear any previous errors on successful sign-up
    } on FirebaseAuthException catch (e) {
      _authError = e.message; // Capture error message
    }
    notifyListeners();
  }

  // Sign out method
  Future<void> signOut() async {
    await _auth.signOut();
    _authError = null; // Reset the error message on sign-out
    notifyListeners();
  }
}
