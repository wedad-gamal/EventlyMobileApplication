import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  Future<User?> createAccountWithEmailAndPassword(String email, String password, String userName) async {
    try {
      // 1. Create the user
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // 2. Update the display name
      if (credential.user != null) {
        await credential.user!.updateDisplayName(userName);

        // Optional: Refresh the user to ensure the object reflects the new name immediately
        await credential.user!.reload();
      }

      return FirebaseAuth.instance.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      // Modern Firebase versions often use 'invalid-credential' for both email and password errors
      if (e.code == 'user-not-found' || e.code == 'wrong-password' || e.code == 'invalid-credential') {
        print('Invalid email or password.');
      } else if (e.code == 'user-disabled') {
        print('This user account has been disabled.');
      } else {
        print('Auth Error: ${e.code}');
      }
      return null;
    } catch (e) {
      print('An unexpected error occurred: $e');
      return null;
    }
  }

  User get currentUser=> FirebaseAuth.instance.currentUser!;


}