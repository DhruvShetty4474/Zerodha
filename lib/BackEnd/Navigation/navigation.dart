import 'package:flutter/material.dart';


// Ui Pages Imports....
import 'package:kite/FrontEnd/Pages/Welcome/Welcome.dart';
import '../../FrontEnd/Components/navigation_bar.dart';
import '../../FrontEnd/Pages/Forget_Password/forget_Password_Ui.dart';
import '../../FrontEnd/Pages/HOME/Search_UI/search_ui.dart';
import '../../FrontEnd/Pages/Login/login_Ui.dart';
import '../../FrontEnd/Pages/Register/OTP/otp.dart';
import '../../FrontEnd/Pages/Register/register_Ui.dart';
import 'package:kite/FrontEnd/Pages/HOME/home.dart';



class NavigationServices {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => const Welcome(),
    '/login': (context) =>   const Login(),
    '/register': (context) =>  const Register(),
    '/forget_password': (context) =>  const ForgetPassword(),
    '/home': (context) =>  const Home(),
    '/navigationbar_page': (context) =>  const Navigation_Bar(),
    // '/otp': (context) =>  Otp(verificationId: ModalRoute.of(context)!.settings.arguments as String),
    '/search': (context) =>  const SearchUi(),
  };

  /// Navigate to a new route
  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  /// Replace the current route with a new one
  Future<dynamic> navigateToReplacement(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
  }
  /// Pop back to the previous screen
  void goBack([dynamic result]) {
    navigatorKey.currentState!.pop(result);
  }

  /// Navigate to a new route and remove all previous routes
  Future<dynamic> navigateAndRemoveUntil(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
  }

}