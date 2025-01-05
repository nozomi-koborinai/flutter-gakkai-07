import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository {
  FirebaseAuthRepository({
    required this.auth,
  });

  final FirebaseAuth auth;

  Future<String> signinAnonymously() async {
    try {
      final userCredential = await auth.signInAnonymously();
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      throw throw Exception('Failed: ${e.toString()}');
    }
  }
}
