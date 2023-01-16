import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
 // String hintText;
  String labelText;
  Icon? prefixIcon;
  var suffixIcon;
  Icon? icon;
  Color? iconColor;
  Border? border;

  bool obscureText = false;
  TextEditingController controller;

  CustomTextField(
      {
        //required this.hintText,
      required this.labelText,
      this.prefixIcon,
      this.suffixIcon,
      this.icon,
      this.iconColor,
      this.border,
      this.obscureText = false,
      required this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        icon: widget.icon,
        border: InputBorder.none,
        iconColor: Colors.grey,
       // hintText: widget.hintText,
        labelText: widget.labelText,
        
      ),
    );
  }
}
