import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kite/FrontEnd/Pages/Login/login_Ui.dart';
import 'package:kite/FrontEnd/Pages/Register/register_Ui.dart';

import '../../BackEnd/Logic/Navigation Bar/navigation_bar.dart';
import '../Pages/Forget_Password/forget_Password_Ui.dart';
import '../Pages/HOME/home.dart';
import '../Pages/Welcome/Welcome.dart';

class Navigation_Bar extends StatefulWidget {
  const Navigation_Bar({super.key});

  @override
  State<Navigation_Bar> createState() => _Navigation_BarState();
}

class _Navigation_BarState extends State<Navigation_Bar> {

  late ValueNotifier<int> currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = ValueNotifier<int>(0);
  }

  @override
  void dispose() {
    currentIndex.dispose();
    super.dispose();
  }


  List<Widget> pages = [
    const Home(),
    const Login(),
    const Register(),
    const Welcome(),
    const ForgetPassword(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ValueListenableBuilder<int>(
        valueListenable: currentIndex,
        builder: (context, value, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0xFF000000),
            body: pages[value],
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                splashFactory:
                NoSplash.splashFactory, // Disable ripple animation globally
              ),
              child: NavigationBarTheme(
                data: NavigationBarThemeData(
                  indicatorColor:
                  Colors.transparent, // Keep the indicator transparent
                  backgroundColor: Colors.black,
                  labelTextStyle: LabelIconStyle.labelTextStyle(),
                  iconTheme: LabelIconStyle.iconTheme(),
                ),
                child: NavigationBar(
                  selectedIndex: value,
                  onDestinationSelected: (index) {
                    currentIndex.value = index;
                    log(index.toString());
                  },
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.bookmark_outline),
                      label: 'Watchlist',
                    ),
                    NavigationDestination(
                      icon: Icon(Iconsax.book, size: 25),
                      label: 'Orders',
                    ),
                    NavigationDestination(
                      icon: Icon(Iconsax.briefcase),
                      label: 'Portfolio',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.gavel),
                      label: 'Bids',
                    ),
                    NavigationDestination(
                      icon: Icon(Iconsax.user),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      )
    );
  }
}
