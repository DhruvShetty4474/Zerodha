


import '../../../BackEnd/Authentication/Login/Login_auth.dart';

final LoginAuth _loginAuth = LoginAuth();

Future<void> signOut() async {
  await _loginAuth.signOut();
}