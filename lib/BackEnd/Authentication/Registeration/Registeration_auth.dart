import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../FrontEnd/Pages/Register/OTP/otp.dart';
import '../../Navigation/navigation.dart';

///Phone Authentication is working without enabling the billing option for that we need to add a
/// dummy phone number in the phone number for testing option and as well as the otp( need to
/// remember the otp for login/register) as in testing
/// it can not send the otp through sms and will work both on the emulator and on the real phone.
///
/// To enable the OTP to receive on sms we need to enable SHA-1 and SHA-256 keys in your project settings
/// ( you can do that by following the steps in "https://docs.fluxbuilder.com/sha-1-and-sha-256/").
/// You can only receive OTP in SMS on your real device not in the emulator.
///
/// The Login and Register has the same logic.
class RegisterationPhoneAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Initiates phone number verification.
  Future<void> registerPhoneNumber(
      BuildContext context, TextEditingController phoneController) async {
    final String phoneNumber = "+91" + phoneController.text.trim();

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        debugPrint('Auto-retrieved verification completed.');
      },
      verificationFailed: (FirebaseAuthException e) {
        debugPrint('Phone number verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        /// Navigate to the OTP screen and pass the verificationId.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Otp(verificationId: verificationId),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        debugPrint('Code auto-retrieval timed out for verification ID: $verificationId');
      },
    );
  }

  /// Verifies the OTP entered by the user.
  Future<void> otpVerification(String verificationId, String otp) async {
    if (otp.trim().isEmpty) {
      log('OTP is empty. Please enter a valid OTP.');
      return;
    }

    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      ///This is the part where you can change the logic for login and register
      ///like if you are using this for registration and if the credentials are correct
      ///you can navigate to the login page.
      ///and same in login you can navigate it to your home page...
      ///just hy changing the route..
      ///here NavigationServices().navigateAndRemoveUntil('/home'); is my own custom function.
      ///you can use Navigator.push(), Navigator.pushReplacement() or Navigator.pushAndRemoveUntil()..
      await _auth.signInWithCredential(credential).then((value) {
        /// Navigate based on login or registration logic.
        /// Example for successful login/registration:
        NavigationServices().navigateAndRemoveUntil('/home');
      });
    } catch (e) {
      log('OTP verification failed: ${e.toString()}');
    }
  }
}









/// Registeration Auth for Email and Password.......................
class RegisterationAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> register(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log("Signed in: ${userCredential.user?.email}");
      NavigationServices().navigateAndRemoveUntil('/login');
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Handle registration-specific errors
      switch (e.code) {
        case 'email-already-in-use':
          print('The email address is already in use.');
          break;

        case 'weak-password':
          print('The provided password is too weak.');
          break;
        default:
          print('Error registering with email: ${e.message}');
          log("Signed in: email :$email, password:$password");

      }
      return null;
    } catch (e) {
      print('Unexpected error registering with email: $e');
      return null;
    }
  }

}