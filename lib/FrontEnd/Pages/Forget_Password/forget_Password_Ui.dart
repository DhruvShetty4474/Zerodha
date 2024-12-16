import 'dart:developer';

import 'package:flutter/material.dart';

import '../../Components/custom_Radio_Button.dart';
import '../../Components/resuable_textfield.dart';



enum ForgetPasswordState { remember, forget }
class ZerodhaForgetPassword extends StatefulWidget {
  const ZerodhaForgetPassword({super.key});

  @override
  State<ZerodhaForgetPassword> createState() => _ZerodhaForgetPasswordState();
}

class _ZerodhaForgetPasswordState extends State<ZerodhaForgetPassword> {
  late ForgetPasswordState? _selectedState = ForgetPasswordState.remember;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF000000),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
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
                                Navigator.pop(context);
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

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 26),
                      child: Column(
                        children: [
                          const SizedBox(height: 50,),

                          //Forget userID or Password text....
                          const Text(
                            "Forgot user ID or password?",
                            style: TextStyle(
                              fontSize: 26.4,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(height: 20,),

                          //Custom radio button with text i remember my user ID
                          ListTile(
                            title: Text('I remember my user ID',),
                            titleTextStyle: const TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                            //Custom Radio button along with text
                            leading: CustomRadio<ForgetPasswordState>(
                              value: ForgetPasswordState.remember,
                              groupValue: _selectedState,
                              onChanged: (ForgetPasswordState? value) {
                                setState(() {
                                  _selectedState = value;
                                });
                              },
                            ),
                          ),
                          //Custom radio button with text i forgot my user ID
                          ListTile(
                            title: Text('I forgot my user ID',),
                            titleTextStyle: const TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),

                            leading: CustomRadio<ForgetPasswordState>(
                              value: ForgetPasswordState.forget,
                              groupValue: _selectedState,
                              onChanged: (ForgetPasswordState? value) {
                                setState(() {
                                  _selectedState = value;
                                });
                              },
                            ),
                          ),

                          SizedBox(height: 100,),
                          PasswordResetForm(),



                        ],
                      ),

                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


//This is called with respect to what the user has selected in the radio button....
class PasswordResetForm extends StatefulWidget {
  const PasswordResetForm({super.key});

  @override
  State<PasswordResetForm> createState() => _PasswordResetFormState();
}

class _PasswordResetFormState extends State<PasswordResetForm> {


  //This widget is called when The User clicks the 'I remember my user ID' Option..
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReusableTextField(),
    );
  }

//This widget is called when The User clicks the 'I forgot my user ID' Option..

}
