import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kite/BackEnd/Navigation/navigation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:floating_animation/floating_animation.dart';

import '../Login/login_Ui.dart';


//NEED TO ADD MORE...
//1. WHEN THE USER CLICKS ON THE LOGIN TO KITE BUTTON IT SHOULD NAVIGATE TO THE LOGIN PAGE.
//2. WHEN THE USER CLICKS ON THE OPEN A FREE ACCOUNT BUTTON IT SHOULD NAVIGATE TO THE REGISTER PAGE.
//3. SHOULD SHOW A LOADING DIALOG WHEN THE USER IS NAVIGATING TO THE OTHER PAGES.



class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}
class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF000000),
        body: Stack(
            children: [
              const  FloatingAnimation(
                selectedShape: "circle",
                direction: FloatingDirection.up,
                maxShapes: 15,
                sizeMultiplier: 0.4,
                speedMultiplier: 2,
                shapeColors: {"circle": Color(0xFFB71C1C)},
                spawnRate: 100, // Adjust spawn rate as needed
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 120,),

                        //Zerodha Logo.....
                        Image.asset('assets/zerodha-kite-logo.png',
                          width: 60,
                          height: 50,
                        ),
                        const SizedBox(height: 30,),

                        //Text for Welcome Screen as ( Welcome to Kite by Zerodha)...
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                              maxWidth: 270,
                              maxHeight: 200
                          ),
                          child: const Text(
                            'Welcome to Kite by Zerodha',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 37
                            ),
                          ),
                        ),
                        const SizedBox(height: 60,),

                        //Buttons for login and registration...

                        Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.grey[800],
                        ),

                        //Button for Open new account.....
                        TextButton(
                          // icon: Icon(MdiIcons.accountOutline, color: Colors.white,),
                          // iconAlignment: IconAlignment.end,
                            style: ButtonStyle(
                                padding: WidgetStateProperty.all(EdgeInsets.zero),
                                overlayColor: WidgetStateProperty.resolveWith<Color?>(
                                      (states) {
                                    if (states.contains(WidgetState.pressed)) {
                                      return Colors.white.withOpacity(0.2); // Color when clicked
                                    }
                                    return null; // Default color
                                  },
                                ),

                                alignment: Alignment.centerLeft,
                                backgroundColor: WidgetStateProperty.all(Colors.transparent),
                                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero, // Rectangle shape
                                  ),
                                ),
                                minimumSize: WidgetStateProperty.all(const Size(double.infinity, 70))
                            ),
                            onPressed: (){
                              log('Open a free account');
                              // Navigator.pushNamed(context, '/register');
                              NavigationServices().navigateTo('/register');
                            },
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Open a free account',
                                  style: TextStyle(
                                    // color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),

                                const SizedBox(width: 10,),
                                Icon(MdiIcons.accountOutline, color: Colors.white,
                                  size: 30,)


                              ],
                            )
                        ),

                        Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.grey[800],
                        ),

                        //Button for Login to Kite......
                        TextButton(
                            style: ButtonStyle(
                                padding: WidgetStateProperty.all(EdgeInsets.zero),
                                overlayColor: WidgetStateProperty.resolveWith<Color?>(
                                      (states) {
                                    if (states.contains(WidgetState.pressed)) {
                                      return Colors.white.withOpacity(0.2); // Color when clicked
                                    }
                                    return null; // Default color
                                  },
                                ),
                                alignment: Alignment.centerLeft,
                                backgroundColor: WidgetStateProperty.all(Colors.transparent),
                                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero, // Rectangle shape
                                  ),
                                ),
                                minimumSize: WidgetStateProperty.all(const Size(double.infinity, 70))
                            ),
                            onPressed: (){
                              log('Login to Kite');
                              NavigationServices().navigateTo('/login');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Login to Kite',
                                  style: TextStyle(
                                    // color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),

                                const SizedBox(width: 10,),

                                Icon(MdiIcons.login, color: Colors.white,
                                  size: 30,)
                              ],
                            )
                        ),

                        Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.grey[800],
                        ),
                        const SizedBox(height: 200),

                        //Footer for the Welcome Screen with some links....
                        RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'NSE & BSE - SEBI Registeration no.:INZ000031632 | MCX - SEBI Registeration no.:INZ000031634 | CDSL - SEBI Registeration no.: IN-DP-431-2019 | ',
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 14
                                  ),
                                ),
                                TextSpan(
                                  text: 'Smart Online Dispute Resolution ',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 14,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Handle the link tap here for Smart Online Dispute Resolution..
                                    },
                                ),
                                TextSpan(
                                    text: " | ",
                                    style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 14
                                    )
                                ),
                                TextSpan(
                                  text: 'SEBI SCORES',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 14,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Handle the link tap here for SEBI SCORES..
                                    },
                                ),
                              ]
                          ),
                        ),

                      ],
                    ),

                  ),
                ),
              ),
              const FloatingAnimation(
                selectedShape: "circle",
                direction: FloatingDirection.up,
                maxShapes: 15,
                sizeMultiplier: 0.4,
                speedMultiplier: 2,
                shapeColors: {"circle": Color(0xFFB71C1C)},
                spawnRate: 100, // Adjust spawn rate as needed
              ),
            ]
        ),
      ),
    );
  }
}
