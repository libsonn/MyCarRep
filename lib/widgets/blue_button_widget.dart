import 'package:flutter/material.dart';

import '../constants.dart';
import 'package:mycar/widgets/text_widget.dart';

class BlueButtonWidget extends StatelessWidget {
  BlueButtonWidget(
      {@required this.text,
      @required this.percentageWNapis,
      @required this.percentageHNapis,
      @required this.percentageWCard,
      @required this.percentageWSizedBox,
      @required this.onPressed,
      @required this.icon});

  final String text;
  final double percentageWNapis;
  final double percentageHNapis;
  final double percentageWCard;
  final double percentageWSizedBox;
  final Function onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12.0,
      color: kButtonColor,
      child: FlatButton(
        color: kButtonColor,
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: kButtonIconColor,
            ),
            SizedBox(
              width: percentageWSizedBox,
            ),
            TextWidget(
              text: '$text',
              percentageH: percentageHNapis,
              percentageW: percentageWNapis,
              style: kSmallTextStyleLabel,
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
