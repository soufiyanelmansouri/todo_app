import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/controllers/state__controller.dart';
import '../../models/user_model.dart';

class AuthController extends StateController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel? _currentUser;
  String? _authError;

  AuthController() {
    _auth.authStateChanges().listen(_authStateChanged);
  }
  UserModel? get currentUser => _currentUser;

  String? get authError => _authError;

  void _authStateChanged(User? firebaseUser) {
    setState(EnState.busy);
    if (firebaseUser != null) {
      _currentUser = UserModel(
        uid: firebaseUser.uid,
        email: firebaseUser.email!,
      );
    } else {
      _currentUser = null;
    }
    _authError = null;
    setState(EnState.idel);
  }

  // Sign in method
  Future<void> signIn(String email, String password) async {
    try {
      setState(EnState.busy);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _authError = null;
    } on FirebaseAuthException catch (e) {
      _authError = e.message;
    }
    setState(EnState.idel);
  }

  // Sign up method
  Future<void> signUp(String email, String password) async {
    try {
      setState(EnState.busy);
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _authError = null;
    } on FirebaseAuthException catch (e) {
      _authError = e.message;
    }
    setState(EnState.idel);
  }

  // Sign out method
  Future<void> signOut() async {
    setState(EnState.busy);
    await _auth.signOut();
    _authError = null;
    setState(EnState.idel);
  }
}
