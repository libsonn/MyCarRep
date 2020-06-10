import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycar/constants.dart';

import 'package:mycar/models/cars_database.dart';
import 'package:mycar/widgets/blue_button_widget.dart';
import 'package:mycar/widgets/text_widget.dart';

import 'package:responsive_screen/responsive_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ConfirmDeletingScreen extends StatefulWidget {
  ConfirmDeletingScreen({this.carIndex});
  final int carIndex;
  @override
  _ConfirmDeletingScreenState createState() =>
      _ConfirmDeletingScreenState(carIndex: carIndex);
}

class _ConfirmDeletingScreenState extends State<ConfirmDeletingScreen> {
  _ConfirmDeletingScreenState({this.carIndex});
  int carIndex;
  @override
  Widget build(BuildContext context) {
    final screenWidth = Screen(context).wp;
    final screenHeight = Screen(context).hp;
    return Container(
      height: 1500,
      color: Color(0xFF141414),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: kBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                TextWidget(
                    text: 'Czy potwierdzasz usunięcie pojazdu: '
                        '${Provider.of<CarsDatabase>(context).getListOfCars()[carIndex].getBrandName()} ${Provider.of<CarsDatabase>(context).getListOfCars()[carIndex].getModelName()}?',
                    style: kNormalTextStyle,
                    percentageW: screenWidth(100),
                    percentageH: screenHeight(2.5)),
                SizedBox(
                  height: screenHeight(1),
                ),
                TextWidget(
                    text: 'Wszystkie informacje o pojeździe zostaną usunięte!',
                    style: kNormalTextStyle,
                    percentageW: screenWidth(100),
                    percentageH: screenHeight(1.5)),
                SizedBox(
                  height: screenHeight(1),
                ),
                BlueButtonWidget(
                  text: 'Tak',
                  percentageHNapis: screenHeight(2),
                  percentageWNapis: screenWidth(60),
                  percentageWSizedBox: screenWidth(5),
                  percentageWCard: screenWidth(100),
                  onPressed: () async {
                    bool toDelete = true;
                    carIndex = 0;

                    Navigator.pop(context, toDelete);
                  },
                  icon: FontAwesomeIcons.check,
                ),
                SizedBox(
                  height: screenHeight(1),
                ),
                BlueButtonWidget(
                  text: 'Nie',
                  percentageHNapis: screenHeight(2),
                  percentageWNapis: screenWidth(60),
                  percentageWSizedBox: screenWidth(5),
                  percentageWCard: screenWidth(100),
                  onPressed: () async {
                    bool toDelete = false;
                    carIndex = 0;

                    Navigator.pop(context, toDelete);
                  },
                  icon: FontAwesomeIcons.times,
                ),
              ],
            ),
          )),
    );
  }
}
