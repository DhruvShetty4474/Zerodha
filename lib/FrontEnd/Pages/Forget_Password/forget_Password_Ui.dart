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

  //Variable used for forget password Options
  late ValueNotifier<ForgetPasswordState> _selectedState;
  late ValueNotifier<RadioButtonState> _radioButtonState;

  //Variable used fot Receiving OTP Options
  late ValueNotifier<OtpReceiver> _otpReceiver;
  late ValueNotifier<OtpReceiverState> _otpReceiverState;


  @override
  void initState() {
    super.initState();
    // Initialize _selectedState
    _selectedState = ValueNotifier(ForgetPasswordState.remember);
    // Initialize _radioButtonState based on _selectedState
    _radioButtonState = ValueNotifier(RadioButtonState(_selectedState.value));

    // Initialize _otpReceiver
    _otpReceiver = ValueNotifier(OtpReceiver.sms);
    // Initialize _otpReceiverState based on _otpReceiver
    _otpReceiverState = ValueNotifier(OtpReceiverState(_otpReceiver.value));
  }
  @override
  void dispose() {
    // Dispose ValueNotifiers to free resources
    _selectedState.dispose();
    _radioButtonState.dispose();
    _otpReceiver.dispose();
    _otpReceiverState.dispose();
    super.dispose();
  }


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
                            "Forgot Email ID or password?",
                            style: TextStyle(
                              fontSize: 26.4,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(height: 20,),

                          //Custom radio button with text i remember my user ID
                          ListTile(
                            title: const Text('I remember my Email ID',),
                            titleTextStyle: const TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                            //Custom Radio button along with text
                            leading: ValueListenableBuilder<ForgetPasswordState>
                              (
                                valueListenable: _selectedState,
                                builder: (context, value, child) {
                                  return CustomRadio<ForgetPasswordState>(
                                    value: ForgetPasswordState.remember,
                                    groupValue: _selectedState.value,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedState.value = value!;
                                        _radioButtonState.value = RadioButtonState(value);
                                      });
                                    },
                                  );
                                }
                            ),
                          ),
                          //Custom radio button with text i forgot my user ID
                          ListTile(
                            title: const Text('I forgot my Email ID',),
                            titleTextStyle: const TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),

                            leading: ValueListenableBuilder<ForgetPasswordState>
                              (
                                valueListenable: _selectedState,
                                builder: (context, value, child) {
                                  return CustomRadio<ForgetPasswordState>(
                                    value: ForgetPasswordState.forget,
                                    groupValue: _selectedState.value,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedState.value = value!;
                                        _radioButtonState.value = RadioButtonState(value);
                                      });
                                    },
                                  );
                                }
                            ),
                          ),

                          const SizedBox(height: 20,),

                          //if the user remembers the user id then it will show the user id field
                          if(_radioButtonState.value.shouldShowUserIdField())
                          // A Text Field where the user will provide there user id..
                            ReusableTextField(
                              labelText: 'Email ID',
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
                              ValueListenableBuilder<OtpReceiver>
                                (
                                  valueListenable: _otpReceiver,
                                  builder: (context, value, child) {
                                    return CustomRadio<OtpReceiver>(
                                      value: OtpReceiver.sms,
                                      groupValue: _otpReceiver.value,
                                      onChanged: (value) {
                                        _otpReceiver.value= value!;
                                        _otpReceiverState.value = OtpReceiverState(value);
                                      },
                                    );
                                  }
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
                              ValueListenableBuilder<OtpReceiver>
                                (
                                  valueListenable: _otpReceiver,
                                  builder: (context, value, child) {
                                    return CustomRadio<OtpReceiver>(
                                      value: OtpReceiver.email,
                                      groupValue: _otpReceiver.value,
                                      onChanged: (value) {
                                        _otpReceiver.value= value!;
                                        _otpReceiverState.value = OtpReceiverState(value);
                                      },
                                    );
                                  }
                              ),
                              // A text field called 'Mobile'
                              const Text('E-mail', style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),)

                            ],
                          ),

                          const SizedBox(height: 20,),
                          ValueListenableBuilder<OtpReceiverState>
                            (
                              valueListenable: _otpReceiverState,
                              builder: (context, value, child) {
                                return ReusableTextField(
                                  labelText: _otpReceiverState.value.shouldChangeLabelText() ? 'Mobile number (as on account)' : 'E-mail (as on account)',
                                  labelTextStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 18.2,
                                  ),
                                  needIcon: false,
                                );
                              }
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