import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../BackEnd/Authentication/Registeration/Registeration_auth.dart';

final ValueNotifier<User?> userNotifier = ValueNotifier<User?>(null);

final RegisterationAuth _RegisterationAuth = RegisterationAuth();

Future<void> initializeRegisterAuth(String email, String password) async {
  try {
    User? user = await _RegisterationAuth.register(email, password);
    userNotifier.value = user;
  } catch (e) {
    print(e);
  }
}


