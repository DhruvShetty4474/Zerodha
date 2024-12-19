
import 'package:flutter/material.dart';

//has the logic for icon to be shown or not
import '../../BackEnd/Logic/ReuseableComponets/TextField.dart';




class ReusableTextField extends StatelessWidget {

  const ReusableTextField({
    super.key,
    // this.controller,
    this.labelText = 'hello',
    this.icon,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.needIcon = false,
    this.labelTextStyle
  });

  //To Define the controller of the text field...
  // final TextEditingController controller;

  //Need label Text to define which text field is it...
  final String labelText;
  //To Define if the text field need an icon or not...
  final bool needIcon;
  //To Take an Icon Data...
  final Icon? icon;
  //To Define if the text field need to be obsecure or not...
  final bool obscureText;
  //To Define the style of the label text...
  final TextStyle? labelTextStyle;
  //To Define the validator of the text field...
  final String? Function(String?)? validator;
  //To Define the keyboard type of the text field...
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        // contentPadding: const EdgeInsets.symmetric(vertical: 20),
        labelText: labelText,
        labelStyle: labelTextStyle,
        // labelStyle: TextStyle(
        //   color: Colors.grey[400],
        //   fontSize: 25,
        // ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[850]!),
          // borderRadius: BorderRadius.circular(10),
        ),
        // change the border of the text field when it is enabled and not focused...
        enabledBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[850]!),
        ),


        //i need to write an logic that if the text field need an icon then i just need ask while the
        // text field is called in the widget and also which icon does it needed...
        //eg. when i call this Text Field if i need an icon i will assign the needIcon bool value to true and
        // also take the icon data as a parameter...
        suffixIcon: ReusableTextFieldLogic(icon: icon, needIcon: needIcon),


      ),

    );
  }

}



