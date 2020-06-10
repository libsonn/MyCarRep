import 'package:flutter/material.dart';
import 'package:mycar/constants.dart';
import 'package:responsive_screen/responsive_screen.dart';

class BigBottomButtonWidget extends StatelessWidget {
  BigBottomButtonWidget(
      {@required this.text, @required this.onPress, this.icon});

  final String text;
  final Function onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final wp = Screen(context).wp;
    final hp = Screen(context).hp;

    return Container(
      width: wp(100),
      height: hp(5),
      child: FlatButton(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: kButtonIconColor,
              ),
              Text('$text', style: kSmallButtonTextStyle),
            ],
          ),
        ),
        onPressed: onPress,
        color: kButtonColor,
      ),
    );
  }
}
