import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget(
      {@required this.style,
      @required this.percentageW,
      @required this.percentageH,
      @required this.text});

  final TextStyle style;
  final double percentageW;
  final double percentageH;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: percentageW,
      child: Text(
        '$text ',
        style: style.copyWith(fontSize: percentageH),
      ),
    );
  }
}
