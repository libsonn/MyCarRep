import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import 'text_widget.dart';

class DatePickerWidget extends StatelessWidget {
  DatePickerWidget(
      {@required this.text,
      @required this.minTime,
      @required this.maxTime,
      @required this.currentTime,
      @required this.onConfirm,
      @required this.perWCard,
      @required this.perHCard,
      @required this.perWText,
      @required this.perHText,
      @required this.style});
  final String text;
  final DateTime minTime;
  final DateTime maxTime;
  final DateTime currentTime;
  final Function onConfirm;
  final double perWText;
  final double perHText;
  final double perWCard;
  final double perHCard;
  final TextStyle style;

  final DateFormat dateFormat = DateFormat.yMMMd();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextWidget(
          text: '$text ',
          percentageH: perHText,
          percentageW: perWText,
          style: style,
        ),
        Card(
          color: kInactiveColor,
          elevation: 8.0,
          child: SizedBox(
            height: perHCard,
            width: double.infinity,
            child: FlatButton(
              onPressed: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: minTime,
                    maxTime: maxTime,
                    onConfirm: onConfirm,
                    currentTime: currentTime,
                    locale: LocaleType.pl);
              },
              child: Text(
                '${dateFormat.format(currentTime)}',
                style: kNormalTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
