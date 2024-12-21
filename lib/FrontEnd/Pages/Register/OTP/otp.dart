import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_animation/floating_animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../BackEnd/Authentication/Registeration/Registeration_auth.dart';
import '../../../../BackEnd/Navigation/navigation.dart';
import '../../../Components/resuable_textfield.dart';

//NEED TO ADD  MORE ...
//1. NEED TO MAKE THE ALL TEXT FIELD AS  WHEN CLICKED OUTSIDE IT SHOULD GET UNFOCUSED.
//2. NEED TO ADD THE LINK TO THE TERMS & CONDITIONS TEXT TO REDIRECT..
//3. NEED TO MAKE THE CONTINUE BUTTON WORK AS WHEN CLICKED IT SHOULD CHECK WITH FIREBASE...

class Otp extends StatefulWidget {
  final String verificationId;
  const Otp({super.key, required this.verificationId});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  late TextEditingController _otpController;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    _otpController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF000000),
        body: Stack(children: [
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
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Back Button
                          IconButton(
                            onPressed: () {
                              log('back pressed');
                              NavigationServices().goBack();
                            },
                            style: ButtonStyle(
                              padding: WidgetStateProperty.all(EdgeInsets.zero),
                              alignment: const Alignment(0.5, 0),
                            ),
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),

                          const Spacer(),
                          //Zerodha logo
                          Image.asset(
                            'assets/zerodha-kite-logo.png',
                            width: 50,
                            height: 30,
                          ),
                        ],
                      )),

                  //Add the Registration interface here....
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),

                        //Open your account text....
                        const Text(
                          "Verify your number",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        //Registration image...
                        Center(
                          child: Image.asset(
                            'assets/otp.png',
                            scale: 2.5,
                          ),
                        ),

                        const SizedBox(
                          height: 40,
                        ),

                        ReusableTextField(
                          controller: _otpController,
                          keyboardType: TextInputType.phone,
                          labelText: 'OTP',
                          labelTextStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 25,
                          ),
                          needIcon: false,
                        ),

                        const SizedBox(
                          height: 50,
                        ),

                        //Continue Button...
                        TextButton(
                          onPressed: () async {
                            //need to add the logic for otp verify button
                            RegisterationPhoneAuth().otpVerification(
                                widget.verificationId,
                                _otpController.text);
                            // try{
                            //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
                            //       verificationId: widget.verificationId, smsCode: _otpController.text.toString());
                            //   await _auth.signInWithCredential(credential).then((value) {
                            //     NavigationServices().navigateAndRemoveUntil('/home');
                            //   });
                            // }catch(e){
                            //   log(e.toString());
                            // }

                          },
                          style: ButtonStyle(
                              padding: WidgetStateProperty.all(EdgeInsets.zero),
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.blue),
                              minimumSize: WidgetStateProperty.all(
                                  const Size(double.infinity, 70))),
                          child: const Text(
                            'Verify',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 40,
                        ),

                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Resend via SMS',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 15,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {}),
                          TextSpan(
                              text: 'Resend via WhatsApp',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {}),
                        ])),

                        const SizedBox(height: 80),
                        //Footer for the Login Screen with some links....
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text:
                                  'NSE & BSE - SEBI Registeration no.:INZ000031632 | MCX - SEBI Registeration no.:INZ000031634 | CDSL - SEBI Registeration no.: IN-DP-431-2019 | ',
                              style: TextStyle(
                                  color: Colors.grey[400], fontSize: 14),
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
                                    color: Colors.grey[400], fontSize: 14)),
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
                          ]),
                        ),
                      ],
                    ),
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
        ]),
      ),
    );
  }
}
