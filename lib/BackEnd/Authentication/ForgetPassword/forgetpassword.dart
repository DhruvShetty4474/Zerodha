

import 'package:firebase_auth/firebase_auth.dart';

class ForgetPassword {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  /// Sends a password reset email to the provided email address...
  Future<bool> sendResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      // Log specific error messages
      switch (e.code) {
        case 'invalid-email':
          print('The email address is not valid.');
          break;
        case 'user-not-found':
          print('No user found for the provided email.');
          break;
        default:
          print('Error sending password reset email: ${e.message}');
      }
      return false;
    } catch (e) {
      print('Unexpected error sending password reset email: $e');
      return false;
    }
  }


}