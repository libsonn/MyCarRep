import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mycar/models/cars_database.dart';
import 'package:mycar/constants.dart';
import 'package:mycar/widgets/big_bottom_button_widget.dart';
import 'package:mycar/widgets/date_picker_widget.dart';
import 'package:mycar/widgets/text_field_widget.dart';
import 'package:mycar/widgets/text_widget.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_screen/responsive_screen.dart';

class TechnicalReviewScreen extends StatefulWidget {
  TechnicalReviewScreen({@required this.carIndex});
  final int carIndex;

  @override
  _TechnicalReviewScreenState createState() =>
      _TechnicalReviewScreenState(carIndex: carIndex);
}

class _TechnicalReviewScreenState extends State<TechnicalReviewScreen> {
  _TechnicalReviewScreenState({@required this.carIndex});

  final int carIndex;

  DateTime _expOfTechnicalReview;
  DateTime _expOfInsurance;

  double _mileage = 0;

  @override
  Widget build(BuildContext context) {
    _expOfTechnicalReview = Provider.of<CarsDatabase>(context)
        .getListOfCars()[carIndex]
        .getExpOfTechnicalReview();
    _expOfInsurance = Provider.of<CarsDatabase>(context)
        .getListOfCars()[carIndex]
        .getExpOfInsurance();

    final screenWidth = Screen(context).wp;
    final screenHeight = Screen(context).hp;

    return Scaffold(
        resizeToAvoidBottomPadding: true,
        resizeToAvoidBottomInset: true,
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextWidget(
                    text: 'Przegląd',
                    style: kHeaderTextStyle,
                    percentageW: screenWidth(100),
                    percentageH: screenHeight(4),
                  ),
                  SizedBox(
                    height: screenHeight(1),
                  ),
                  SizedBox(
                    height: 0.2,
                    child: Container(
                      color: kAccentColor,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight(2),
                  ),
                  DatePickerWidget(
                    text: 'Data ważności przeglądu technicznego: ',
                    perWText: screenWidth(100),
                    perHText: screenHeight(2.5),
                    perHCard: screenHeight(5.5),
                    perWCard: screenWidth(100),
                    style: kSmallTextStyleLabel,
                    currentTime: _expOfTechnicalReview,
                    minTime: DateTime.now(),
                    maxTime: DateTime(DateTime.now().year + 2,
                        DateTime.now().month, DateTime.now().day),
                    onConfirm: (date) {
                      setState(() {
                        _expOfTechnicalReview = date;
                        Provider.of<CarsDatabase>(context, listen: false)
                            .getListOfCars()[carIndex]
                            .setExpOfTechnicalReview(_expOfTechnicalReview);
                      });
                    },
                  ),
                  TextFieldWidget(
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    text: 'Aktualny przebieg',
                    icon: FontAwesomeIcons.tachometerAlt,
                    onChange: (aktualnyPrzbieg) {
                      _mileage = double.parse(aktualnyPrzbieg);
                    },
                    textInputType: TextInputType.number,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                  BigBottomButtonWidget(
                    text: 'Zapisz datę kolejnego przeglądu',
                    icon: Icons.add,
                    onPress: () {
                      Provider.of<CarsDatabase>(context, listen: false)
                          .setExpOfTechnicalReview(
                              _expOfTechnicalReview, carIndex);
                      Provider.of<CarsDatabase>(context, listen: false)
                          .setMileage(_mileage, carIndex);
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: screenHeight(2),
                  ),
                  TextWidget(
                    text: 'Ubezpieczenie',
                    style: kHeaderTextStyle,
                    percentageW: screenWidth(100),
                    percentageH: screenHeight(4),
                  ),
                  SizedBox(
                    height: screenHeight(1),
                  ),
                  SizedBox(
                    height: 0.2,
                    child: Container(
                      color: kAccentColor,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight(2),
                  ),
                  DatePickerWidget(
                    text: 'Data ważności ubezpieczenia: ',
                    perWText: screenWidth(100),
                    perHText: screenHeight(2.5),
                    perHCard: screenHeight(5.5),
                    perWCard: screenWidth(100),
                    style: kSmallTextStyleLabel,
                    currentTime: _expOfInsurance,
                    minTime: DateTime.now(),
                    maxTime: DateTime(DateTime.now().year + 2,
                        DateTime.now().month, DateTime.now().day),
                    onConfirm: (date) {
                      setState(() {
                        _expOfInsurance = date;
                        Provider.of<CarsDatabase>(context, listen: false)
                            .getListOfCars()[carIndex]
                            .setExpOfInsurance(_expOfInsurance);
                      });
                    },
                  ),
                  SizedBox(
                    height: screenHeight(1),
                  ),
                  BigBottomButtonWidget(
                    text: 'Zapisz datę ważności ubezpieczenia',
                    icon: Icons.add,
                    onPress: () {
                      Provider.of<CarsDatabase>(context, listen: false)
                          .getListOfCars()[carIndex]
                          .setExpOfInsurance(_expOfInsurance);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
