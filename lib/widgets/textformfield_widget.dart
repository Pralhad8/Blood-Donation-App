import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final Widget icon;
  final String hintText;
  final bool boolValue;
  final dynamic inputType;
  final dynamic validator;

  const TextFormFieldWidget({
    required this.icon,
    required this.hintText,
    required this.boolValue,
    required this.inputType,
    required this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 243, 235, 235),
        ),
        child: TextFormField(

         validator: validator,
          // validator: (value) {
          //   if (value != null && value.length < 7 ) {
          //     return 'enter min 7 char. ';
          //   } else {
          //     return null;
          //   }
          // },

          
          obscureText: boolValue,
          keyboardType: inputType,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0XFFF8F8F8)),
              borderRadius: BorderRadius.circular(5.5),
            ),
            prefixIcon: icon,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black),
            filled: true,
            fillColor: Colors.blue[50],
          ),
        ),
      ),
    );
  }
}
