import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../FrontEnd/Pages/Register/OTP/otp.dart';
import '../../Navigation/navigation.dart';

//Phone authentication part not working due to billing should be enabled
class RegisterationPhoneAuth {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void registerPhoneNumber( BuildContext context, TextEditingController phoneController) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: "+91"+phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        debugPrint('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Otp(verificationId: verificationId),
          ),
        );

      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void otpVerification(String verificationId, String otp) async {
    try {
      if (otp.isEmpty) {
        return log('OTP is empty');
      }
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      await _auth.signInWithCredential(credential).then((value) {
        NavigationServices().navigateAndRemoveUntil('/home');
      });
    }catch(e){
      log(e.toString());
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