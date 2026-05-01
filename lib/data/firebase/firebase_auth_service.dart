import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Change this line
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> createAccountWithEmailAndPassword(
    String email,
    String password,
    String userName,
  ) async {
    try {
      // 1. Create the user
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

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

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      // Modern Firebase versions often use 'invalid-credential' for both email and password errors
      if (e.code == 'user-not-found' ||
          e.code == 'wrong-password' ||
          e.code == 'invalid-credential') {
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

  Future<User?> signInWithGoogle() async {
    try {
      // 1. Trigger the Google authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return null; // User cancelled

      // 2. Obtain auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // 3. Create a new credential for Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // 4. Sign in to Firebase with the Google credential
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      return userCredential.user;
    } catch (e) {
      print("Error during Google Sign-In: $e");
      return null;
    }
  }

  /// Sends a password reset email to the given address.
  /// Returns null on success, or an error message string on failure.
  Future<String?> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return null; // success
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No account found for this email.';
      }
      return e.message ?? 'An error occurred.';
    } catch (e) {
      return e.toString();
    }
  }

  User? get currentUser => FirebaseAuth.instance.currentUser;

  Future<void> logout() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }
}
