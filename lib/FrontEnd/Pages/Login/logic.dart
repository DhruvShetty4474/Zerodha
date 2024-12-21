

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../BackEnd/Authentication/Login/Login_auth.dart';
import '../Register/logic.dart';

// final ValueNotifier<User?> userNotifier = ValueNotifier<User?>(null);
// Firebase Authentication helper
  final LoginAuth _loginAuth = LoginAuth();

  User? _user; // Tracks the authenticated user


Future<void> initializeLogicAuth(String email, String password) async {
  try {
    // Sign in the user with the provided email and password
    User? user = await _loginAuth.login(email, password);
    userNotifier.value = user; // Update the ValueNotifier
  } catch (e) {
    // Show an error dialog if authentication fails
    log(e.toString());
  }
}


