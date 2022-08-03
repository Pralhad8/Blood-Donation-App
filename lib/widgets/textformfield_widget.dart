import 'package:blood_donor_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
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
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0XFFF8F8F8)),
              borderRadius: BorderRadius.circular(5.5),
            ),
            prefixIcon: Container(
                margin: EdgeInsets.only(right: 12, left: 5),
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: Color(0XFFD6D6D6))),
                ),
                child: icon),
            hintText: hintText,
            hintStyle:
                // TextStyle(color: Colors.black, fontSize: Dimensions.font15),
                GoogleFonts.poppins(
              color: Colors.black,
              fontSize: Dimensions.font14,
            ),
            filled: true,
            fillColor: Colors.blue[50],
          ),
        ),
      ),
    );
  }
}
