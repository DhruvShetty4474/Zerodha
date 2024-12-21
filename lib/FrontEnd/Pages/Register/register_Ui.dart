import 'dart:developer';

import 'package:floating_animation/floating_animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kite/FrontEnd/Components/resuable_textfield.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../BackEnd/Authentication/Registeration/Registeration_auth.dart';
import '../../../BackEnd/Navigation/navigation.dart';
import '../Login/logic.dart';
import 'logic.dart';



/// TODO: NEED TO ADD  MORE ...
///1. need to add the logic if the user want to login using email/password or phone number.
///2. need to decide where to include this feature and how it will work.
///3. need to add a logic how the textbutton would function if there is 2 method and it should
///   call the method which is selected by the user and skip the other one.
/// for example currently i have 2 ideas:
/// 1. we can use the customo raido button just like in forgetpassword page where
/// there are 2 options email and phone number and if the user selects one of them
/// the text button would should show accordingly.
///
/// 2. we can also add an sign in with Email text below the texbutton or the textfield when clicked
/// it should ether do the same logic as the first idea( logic of which textfield will be shown) or
/// else it should build or naviagate to a  page for email registration.
///
/// need more ideas...





class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  //for phone number authentication
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    //for phone number authentication
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    //for phone number authentication
    _phoneController.dispose();
  }


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
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Back Button
                            IconButton(
                              onPressed: (){
                                log('back pressed');
                                NavigationServices().navigateAndRemoveUntil('/');
                              },
                              style: ButtonStyle(
                                padding: WidgetStateProperty.all(EdgeInsets.zero),
                                alignment: const Alignment(0.5, 0),
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
                        )
                    ),

                    //Add the Registration interface here....
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50,),

                          //Open your account text....
                          const Text(
                            "Open your account",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 40,),
                          //Registration image...
                          Center(
                            child: Image.asset('assets/kite_Registration_image.png',
                              scale: 2.5,
                            ),
                          ),

                          const SizedBox(height: 40,),

                          // Registration TextField Takes Phone number as input.....
                          //
                          // need to add an controller = TextController....
                          //
                          // Phone number TextField
                          TextField(
                            controller: _phoneController,
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(

                              //PART OF THE PHONE AUTHENTICATION WHERE THE UI NEEDED +91 AT PREFIX...
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RichText(
                                    text: TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: '  +91',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '  | ',
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 25,
                                            ),
                                          )
                                        ]
                                    )
                                ),
                              ),
                              prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                              contentPadding: const EdgeInsets.symmetric(vertical: 20),

                              labelText: 'Phone number',
                              labelStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 20,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[850]!),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[850]!),
                              ),
                              // change the border of the text field when it is enabled and not focused...
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[850]!),
                              ),
                            ),
                          ),
                          // ReusableTextField(
                          //   controller: _emailController,
                          //   keyboardType: TextInputType.emailAddress,
                          //   labelText: 'EMAIL ID',
                          //   labelTextStyle: TextStyle(
                          //     color: Colors.grey[400],
                          //     fontSize: 20,
                          //   ),
                          //   needIcon: false,
                          // ),
                          //
                          // const SizedBox(height: 20,),
                          //
                          // ReusableTextField(
                          //   controller: _passwordController,
                          //   keyboardType: TextInputType.visiblePassword,
                          //   labelText: 'Password',
                          //   labelTextStyle: TextStyle(
                          //     color: Colors.grey[400],
                          //     fontSize: 25,
                          //   ),
                          //   needIcon: false,
                          // ),



                          const SizedBox(height: 50,),

                          //Continue Button...
                          TextButton(onPressed: (){
                            //Part of the Phone Authtication with Firebase..
                            RegisterationPhoneAuth().registerPhoneNumber(context,_phoneController);

                            //for phone number authentication.......
                            // initializeRegisterAuth(_emailController.text.toString(), _passwordController.text.toString());
                            // log('Login button pressed: email: ${_emailController.text.toString()}, password: ${_passwordController.text.toString()}');

                          },
                            style: ButtonStyle(
                                padding: WidgetStateProperty.all(EdgeInsets.zero),
                                shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                                backgroundColor: WidgetStateProperty.all(Colors.blue),
                                minimumSize: WidgetStateProperty.all(const Size(double.infinity, 70))
                            ),
                            child: const Text('Continue', style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),

                          const SizedBox(height: 40,),

                          RichText(text: TextSpan(
                              children: [
                                TextSpan(text: 'By continuing, you agree to the ', style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 15,
                                ),),

                                TextSpan(text: ' terms & conditions',
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {

                                      }
                                ),


                              ]
                          )),

                          const SizedBox(height: 80),
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
                        ],

                      ),
                    ),

                  ],
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
