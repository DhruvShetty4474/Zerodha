import 'package:flutter/material.dart';

import 'BackEnd/Navigation/navigation.dart';
import 'FrontEnd/Pages/Welcome/Welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: NavigationServices.navigatorKey, // Set the global navigator key
      routes: NavigationServices.routes, // Set the global routes
      initialRoute: '/', // Set the initial route
    );
  }
}
