import 'package:mycar/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    @required this.text,
    this.icon,
    this.obscuredText = false,
    @required this.onChange,
    @required this.textInputType,
    @required this.maxLines,
    @required this.textInputAction,
    @required this.onEditingComplete,
  });

  final bool obscuredText;
  final String text;
  final IconData icon;
  final Function onChange;
  final Function onEditingComplete;
  final TextInputType textInputType;
  final int maxLines;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    final screenWidth = Screen(context).wp;

    return Column(
      children: <Widget>[
        SizedBox(
          height: screenWidth(3),
        ),
        SingleChildScrollView(
          child: TextField(
            obscureText: obscuredText,
            textInputAction: textInputAction,
            maxLines: maxLines,
            cursorColor: kTextColor,
            style: kSmallTextStyleLabel,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              labelText: text,
              labelStyle: TextStyle(color: kButtonTextColor),
              filled: true,
              fillColor: kButtonColor,
              icon: Icon(
                icon,
                color: kIconColor,
              ),
            ),
            keyboardType: textInputType,
            onChanged: onChange,
            onEditingComplete: onEditingComplete,
          ),
        ),
        SizedBox(
          height: screenWidth(3),
        ),
      ],
    );
  }
}
