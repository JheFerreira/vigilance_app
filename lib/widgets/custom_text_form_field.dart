import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  //String hintText;
  Icon? prefixIcon;
  var suffixIcon;
  Icon? icon;
  Color? iconColor;
  Border? border;
  var keyboardType;

  String labelText;
  var validator;
  bool obscureText = false;
  TextEditingController controller;

  CustomTextFormField({
    required this.labelText,
   // required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.icon,
    this.iconColor,
    this.border,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    required this.controller, required Icon child,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        icon: widget.icon,
        border: InputBorder.none,
        iconColor: Colors.grey,
        labelText: widget.labelText,
       // hintText: widget.hintText,
      ),
    );
  }
}
