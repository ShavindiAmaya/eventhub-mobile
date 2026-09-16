import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase _db = FirebaseDatabase.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserCredential> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required String role,
  }) async {
    UserCredential credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (credential.user != null) {
      await _db.ref('users/${credential.user!.uid}').set({
        'fullName': fullName,
        'email': email,
        'role': role.toLowerCase(),
      });
    }

    return credential;
  }

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<Map<String, dynamic>?> getUserProfile(String uid) async {
    final snapshot = await _db.ref('users/$uid').get();
    if (snapshot.exists && snapshot.value != null) {
      final Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
      return data.cast<String, dynamic>();
    }
    return null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
