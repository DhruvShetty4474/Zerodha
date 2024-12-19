
import 'package:flutter/material.dart';

class ReusableTextFieldLogic extends StatefulWidget{

  final Icon? icon;
  final bool needIcon;
  const ReusableTextFieldLogic({ super.key, required this.icon, required this.needIcon });

  @override
  State<ReusableTextFieldLogic> createState() => _ReusableTextFieldLogicState();
}

class _ReusableTextFieldLogicState extends State<ReusableTextFieldLogic> {
  @override
  Widget build(BuildContext context) {
    return widget.needIcon && widget.icon != null ? widget.icon! : const SizedBox.shrink();
  }
}