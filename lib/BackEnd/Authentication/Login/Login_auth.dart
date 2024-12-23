import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import '../../../FrontEnd/Pages/Register/logic.dart';
import '../../Navigation/navigation.dart';

class LoginAuth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      log("Signed in: ${userCredential.user?.email}");
      NavigationServices().navigateAndRemoveUntil('/navigationbar_page');
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Log specific error messages based on the Firebase error codes
      switch (e.code) {
        case 'user-not-found':
          print('No user found for the provided email.');
          break;
        case 'wrong-password':
          print('Incorrect password provided.');
          break;
        default:
          print('Error signing in with email: ${e.message}');
          log("Signed in: email :${email}, password:${password}");
      }
      return null;
    } catch (e) {
      print('Unexpected error signing in with email: $e');
      return null;
    }
  }


  /// Retrieves the currently signed-in user, if any.
  ///
  /// Returns the [User] object if a user is signed in, or `null` if no user is signed in.
  User? getCurrentUser() {
    return auth.currentUser;
  }

  /// Signs out the user from all accounts.
  ///
  /// This method signs the user out of Firebase and Google (if signed in).
  Future<void> signOut() async {
    try {
      log("Signed out: ${getCurrentUser()}");
      log("Signed out: ${userNotifier.value}");
      await auth.signOut();
      userNotifier.value = null;
      log("Signed out");
    } catch (e) {
      print('Error signing out: $e');
    }
  }


}



