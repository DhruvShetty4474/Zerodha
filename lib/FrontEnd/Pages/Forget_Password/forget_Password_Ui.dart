import 'dart:developer';

import 'package:floating_animation/floating_animation.dart';
import 'package:flutter/material.dart';

import '../../../BackEnd/Logic/ForgotPassword/logic.dart';
import '../../../BackEnd/Navigation/navigation.dart';
import '../../Components/custom_Radio_Button.dart';
import '../../Components/resuable_textfield.dart';



class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late ForgetPasswordState? _selectedState = ForgetPasswordState.remember;
  late RadioButtonState _radioButtonState = RadioButtonState(_selectedState!);
  late OtpReceiver? _otpReceiver = OtpReceiver.sms;
  late OtpReceiverState _otpReceiverState = OtpReceiverState(_otpReceiver!);



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
                                NavigationServices().goBack();
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
                      padding: const EdgeInsets.symmetric(horizontal: 26),
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
                            title: const Text('I remember my user ID',),
                            titleTextStyle: const TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                            //Custom Radio button along with text
                            leading: CustomRadio<ForgetPasswordState>(
                              value: ForgetPasswordState.remember,
                              groupValue: _selectedState,
                              onChanged: (value) {
                                setState(() {
                                  _selectedState = value!;
                                  _radioButtonState = RadioButtonState(value);
                                });
                              },
                            ),
                          ),
                          //Custom radio button with text i forgot my user ID
                          ListTile(
                            title: const Text('I forgot my user ID',),
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
                                  _selectedState = value!;
                                  _radioButtonState = RadioButtonState(value);
                                });
                              },
                            ),
                          ),

                          const SizedBox(height: 20,),

                          //if the user remembers the user id then it will show the user id field
                          if(_radioButtonState.shouldShowUserIdField())
                          // A Text Field where the user will provide there user id..
                            ReusableTextField(
                              labelText: 'User ID',
                              labelTextStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 25,
                              ),
                              needIcon: false,
                            ),

                          const SizedBox(height: 20,),

                          // A Text Field where the user will provide there PAN number..
                          ReusableTextField(
                            labelText: 'PAN',
                            labelTextStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 25,
                            ),
                            needIcon: false,
                          ),

                          const SizedBox(height: 20,),
                          // A Text called 'Receive OTP on'...
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Receive OTP on",
                              style:  TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // A radio button for email number..
                              CustomRadio<OtpReceiver>(
                                value: OtpReceiver.sms,
                                groupValue: _otpReceiver,
                                onChanged: (value) {
                                  setState(() {
                                    _otpReceiver = value!;
                                    _otpReceiverState = OtpReceiverState(value);
                                  }
                                  );
                                },
                              ),
                              // A text field called 'Email'
                              const Text('SMS',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  )
                              ),

                              const SizedBox(width: 60,),

                              // A radio button for mobile number..
                              CustomRadio<OtpReceiver>(
                                value: OtpReceiver.email,
                                groupValue: _otpReceiver,
                                onChanged: (value) {
                                  setState(() {
                                    _otpReceiver = value!;
                                    _otpReceiverState = OtpReceiverState(value);
                                  }
                                  );
                                },
                              ),
                              // A text field called 'Mobile'
                              const Text('E-mail', style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),)

                            ],
                          ),

                          const SizedBox(height: 20,),
                          ReusableTextField(
                            labelText: _otpReceiverState.shouldChangeLabelText() ? 'Mobile number (as on account)' : 'E-mail (as on account)',
                            labelTextStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 18.2,
                            ),
                            needIcon: false,
                          ),

                          SizedBox(height: 30,),

                          // A button called 'Continue'
                          TextButton(onPressed: (){},
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

                          // here i would check with a conditional statement that if the user is selecting the first option in the radio button..

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

    /// The only change in the ui is that if the user is selecting remember user id there is an
    ///extra text field called User id and if not it doesn't show up and all the other text fields are same..
    /// SO i guess i have to create a logic such that if the user select the first option then the
    /// user id should be visible with the other text fields and if the user select the second option then the user id should
    /// not be visible and all the other text fields should be visible the same...




    return Container(
      child: const Column(
        children: [
          ReusableTextField(
            labelText: 'User ID',
            needIcon: false,
          ),
          SizedBox(height: 20,),
          ReusableTextField(
            labelText: 'PAN',
            needIcon: false,
          ),
        ],
      ),

    );
  }

//This widget is called when The User clicks the 'I forgot my user ID' Option..

}
