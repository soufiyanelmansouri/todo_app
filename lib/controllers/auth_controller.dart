import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthController with ChangeNotifier {
  final AuthService _authService = AuthService();
  UserModel? _currentUser;
  String? _authError;

  UserModel? get currentUser => _currentUser;
  String? get authError => _authError;

  Future<void> signUp(String email, String password) async {
    try {
      _currentUser = await _authService.signUpWithEmail(email, password);
      _authError = null;
      notifyListeners();
    } catch (error) {
      _authError = error.toString();
      notifyListeners();
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      _currentUser = await _authService.signInWithEmail(email, password);
      _authError = null;
      notifyListeners();
    } catch (error) {
      _authError = error.toString();
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
    _currentUser = null;
    notifyListeners();
  }
}
