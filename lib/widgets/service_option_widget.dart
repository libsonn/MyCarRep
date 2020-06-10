import 'package:flutter/material.dart';
import 'package:mycar/constants.dart';

class ServiceOptionWidget extends StatelessWidget {
  ServiceOptionWidget(
      {@required this.text, @required this.iconData, @required this.onTap});

  final String text;
  final IconData iconData;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        //elevation: 8.0,
        child: SizedBox(
          height: 40,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 3.0,
              ),
              Icon(
                iconData,
                color: kIconColor,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                '$text',
                style: kSmallTextStyleLabel,
              ),
            ],
          ),
        ),
        color: kInactiveColor,
      ),
    );
  }
}
