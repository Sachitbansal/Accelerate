import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {


  final iconChoose;
  final suffixiIcon;
  final hint;
  final validator;
  final onChanged;
  final controller;
  final keyboardtype;
  final label;
  final bool obscureText = true;

  const RoundedInputField({Key? key, this.iconChoose, this.suffixiIcon, this.hint, this.validator, this.onChanged, this.controller, this.keyboardtype, this.label}) : super(key: key);

  @override

  Widget build(BuildContext context) {

    return TextFormField(
      keyboardType: keyboardtype,
      validator: validator,
      onSaved: onChanged,
      obscureText: obscureText,
      controller: controller,
      cursorColor: Colors.blue[800],
      decoration: InputDecoration(
          fillColor: Colors.blue[50],
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0.8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              width: 0.8,
              color: Theme.of(context).primaryColor,
            ),
          ),
          hintText: hint,
          labelText: label,
          prefixIcon: Icon(
            iconChoose,
            color: Theme.of(context).primaryColor,
          ),
          suffixIcon: suffixiIcon
      ),
    );
  }
}
