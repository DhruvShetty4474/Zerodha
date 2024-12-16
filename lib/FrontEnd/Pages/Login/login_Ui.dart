import 'dart:developer';

import 'package:floating_animation/floating_animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

//NEED TO ADD MORE...
//1. NEED TO MAKE THE ALL TEXT FIELD AS  WHEN CLICKED OUTSIDE IT SHOULD GET UNFOCUSED.
//2. NEED TO MAKE THE PASSWORD TEXT FIELD AS OBSECURE AND THE ICON SHOULD CHANGE ACCORDING TO IT.
//3. NEED TO MAKE THE LOGIN BUTTON AS A REUSABLE WIDGET.
//4. NEED TO MAKE THE TEXT FIELD AS A REUSABLE WIDGET.
//5. WHEN THE USER CLICKS THE FORGET PASSWORD TEXT IT SHOULD NAVIGATE TO THE FORGET PASSWORD PAGE.
//6. WHEN THE USER CLICKS THE LOGIN BUTTON IT SHOULD NAVIGATE TO THE HOME PAGE AS WELL AS SHOW A LOADING DIALOG.
//7. WHEN THE USER CLICKS THE ABOVE LEFT ARROW IT SHOULD NAVIGATE BACK TO THE WELCOME PAGE.


class ZerodhaLogin extends StatefulWidget {
  const ZerodhaLogin({super.key});

  @override
  State<ZerodhaLogin> createState() => _ZerodhaLoginState();
}

class _ZerodhaLoginState extends State<ZerodhaLogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFF000000),

          body: Stack(
              children: [
                const FloatingAnimation(
                  selectedShape: "circle",
                  direction: FloatingDirection.up,
                  maxShapes: 15,
                  sizeMultiplier: 0.4,
                  speedMultiplier: 2,
                  shapeColors: {"circle": Color(0xFFB71C1C)},
                  spawnRate: 100, // Adjust spawn rate as needed
                ),
                SingleChildScrollView (
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Add a back button and the logo of Zerodha...
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //Back button
                              IconButton(
                                onPressed: (){
                                  log('back pressed');
                                  Navigator.pop(context);
                                },
                                style: ButtonStyle(
                                  alignment: const Alignment(0.5, 0),
                                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                                ),
                                icon: const Icon(Icons.arrow_back_ios,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),

                              const Spacer(),
                              //Zerodha logo
                              Image.asset('assets/zerodha-kite-logo.png',
                                width: 50,
                                height: 30,
                              ),
                            ],
                          ),
                        ),

                        // Add the login user-interface here...
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                const SizedBox(height: 50,),
                                //Text for login...
                                const Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),

                                const SizedBox(height: 70,),
                                //TextField for phone number or user id...

                                TextField(
                                  cursorColor: Colors.blue,
                                  decoration: InputDecoration(
                                    // contentPadding: const EdgeInsets.symmetric(vertical: 20),
                                    labelText: 'Phone or User ID',
                                    labelStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 20,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey[850]!),
                                      // borderRadius: BorderRadius.circular(10),
                                    ),
                                    // change the border of the text field when it is enabled and not focused...
                                    enabledBorder: OutlineInputBorder(
                                      // borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: Colors.grey[850]!),
                                    ),
                                    suffixIcon: Icon(MdiIcons.accountOutline, color: Colors.grey[400], size: 30,),

                                  ),

                                ),

                                const SizedBox(height: 40,),


                                //TextField for password...
                                TextField(
                                  cursorColor: Colors.blue,
                                  decoration: InputDecoration(
                                    // contentPadding: const EdgeInsets.symmetric(vertical: 20),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 20,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey[850]!),
                                      // borderRadius: BorderRadius.circular(10),
                                    ),
                                    // change the border of the text field when it is enabled and not focused...
                                    enabledBorder: OutlineInputBorder(
                                      // borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: Colors.grey[850]!),
                                    ),
                                    suffixIcon: Icon(MdiIcons.eyeOutline, color: Colors.grey[400], size: 30,),
                                  ),),

                                const SizedBox(height: 50,),
                                //Login button...
                                TextButton(onPressed: (){},
                                  style: ButtonStyle(
                                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                                      shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                                      backgroundColor: WidgetStateProperty.all(Colors.blue),
                                      minimumSize: WidgetStateProperty.all(const Size(double.infinity, 70))
                                  ),
                                  child: const Text('LOGIN', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ),

                                const SizedBox(height: 40,),

                                // Text forget password option with gesture detector navigating to forget password screen...
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: GestureDetector(
                                    onTap: (){},
                                    child: const Text(
                                      'Forget user ID or password?',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 170),
                                //Footer for the Login Screen with some links....
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
                              ]),
                        ),
                      ],
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
          )
      ),
    );
  }
}