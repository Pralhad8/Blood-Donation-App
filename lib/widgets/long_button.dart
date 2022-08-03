import 'package:blood_donor_app/utils/dimensions.dart';
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
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.07,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor,
                style: BorderStyle.solid,
                width: Dimensions.width3,
              ),
              color: fillColor,
              borderRadius: BorderRadius.circular(Dimensions.radius30),
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
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.w600,
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
