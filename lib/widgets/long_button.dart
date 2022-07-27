import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final Color borderColor, fillColor, textColor;
  final String text;
  final VoidCallback onTap;

  const LongButton({
    required this.borderColor,
    required this.fillColor,
    required this.textColor,
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 50.0,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor,
                style: BorderStyle.solid,
                width: 3.0,
              ),
              color: fillColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
