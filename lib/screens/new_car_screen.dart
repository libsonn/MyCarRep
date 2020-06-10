import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mycar/constants.dart';
import 'package:mycar/models/cars_database.dart';
import 'package:mycar/models/car_model.dart';

import 'package:mycar/widgets/text_widget.dart';
import 'package:mycar/widgets/date_picker_widget.dart';
import 'package:mycar/widgets/text_field_widget.dart';
import 'package:mycar/widgets/big_bottom_button_widget.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_screen/responsive_screen.dart';

class NewCarScreen extends StatefulWidget {
  @override
  _NewCarScreenState createState() => _NewCarScreenState();
}

class _NewCarScreenState extends State<NewCarScreen> {
  String _eneteredBrandName = 'BRAK';
  String _enteredModelName = 'BRAK';
  String _enteredFuelType = 'Diesel';
  String _enteredRegistrationNumber = 'BRAK';
  String _enteredVINNumber = 'BRAK';

  int _enteredYearOfProduction = 2010;
  int _eneterdFuelIndex = 0;
  double _enteredMileage = 0;
  double _enteredPower = 0;
  double _enteredEngineSize = 0;

  DateFormat dateFormat = DateFormat.yMMMd();

  DateTime _enteredExpOfTechnicalReview =
      DateTime.now().add(Duration(days: 365));
  DateTime _enteredExpOfInsurance = DateTime.now().add(Duration(days: 365));

  CupertinoPicker yearOfProductionPicker() {
    List<Text> listOfYears = [];

    for (int year = 1950; year < 2021; year++) {
      listOfYears.add(Text('$year'));
    }

    return CupertinoPicker(
      scrollController: FixedExtentScrollController(initialItem: 60),
      backgroundColor: kBackgroundColor,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedYear) {
        _enteredYearOfProduction = (selectedYear + 1950);
      },
      children: listOfYears,
    );
  }

  CupertinoPicker typeOfFuelPicker() {
    List<String> listOfFuelTypesString = [];
    List<Text> listOfFuelTypesText = [];

    listOfFuelTypesString.add('Diesel');
    listOfFuelTypesString.add('Benzyna');
    listOfFuelTypesString.add('Benzyna+Gaz');
    listOfFuelTypesString.add('Inne');

    for (int i = 0; i < listOfFuelTypesString.length; i++) {
      listOfFuelTypesText.add(Text('${listOfFuelTypesString[i]}'));
    }

    return CupertinoPicker(
      backgroundColor: kBackgroundColor,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedFuelIndex) {
        _enteredFuelType =
            listOfFuelTypesString.elementAt(selectedFuelIndex).toString();
        _eneterdFuelIndex = selectedFuelIndex;
      },
      children: listOfFuelTypesText,
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  text: 'Nowy samochód',
                  percentageW: screenWidth(100),
                  percentageH: screenHeight(4),
                  style: kHeaderTextStyle,
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
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextWidget(
                            text: 'Wprowadź markę samochodu',
                            percentageH: screenHeight(2),
                            percentageW: screenWidth(100),
                            style: kSmallTextStyleLabel,
                          ),
                          TextFieldWidget(
                            textInputAction: TextInputAction.next,
                            maxLines: 1,
                            text: 'Marka samochodu: ',
                            icon: FontAwesomeIcons.car,
                            textInputType: TextInputType.text,
                            onChange: (markaSamochodu) {
                              _eneteredBrandName = markaSamochodu;
                            },
                            onEditingComplete: () =>
                                FocusScope.of(context).nextFocus(),
                          ),
                          TextWidget(
                            text: 'Wprowadź model samochodu: ',
                            percentageH: screenHeight(2),
                            percentageW: screenWidth(100),
                            style: kSmallTextStyleLabel,
                          ),
                          TextFieldWidget(
                            textInputAction: TextInputAction.done,
                            maxLines: 1,
                            text: "Model samochodu",
                            icon: FontAwesomeIcons.car,
                            textInputType: TextInputType.text,
                            onChange: (modelSamochodu) {
                              _enteredModelName = modelSamochodu;
                            },
                            onEditingComplete: () =>
                                FocusScope.of(context).unfocus(),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    TextWidget(
                                      text: 'Rocznik: ',
                                      percentageH: screenHeight(2),
                                      percentageW: screenWidth(50),
                                      style: kSmallTextStyleLabel,
                                    ),
                                    SizedBox(
                                      height: screenHeight(2),
                                    ),
                                    Container(
                                      child: yearOfProductionPicker(),
                                      height: screenHeight(6),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    TextWidget(
                                      text: 'Typ paliwa: ',
                                      percentageH: screenHeight(2),
                                      percentageW: screenWidth(50),
                                      style: kSmallTextStyleLabel,
                                    ),
                                    SizedBox(
                                      height: screenHeight(2),
                                    ),
                                    Container(
                                      child: typeOfFuelPicker(),
                                      height: screenHeight(6),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight(2),
                          ),
                          TextWidget(
                            text: 'Przebieg samochodu: ',
                            percentageH: screenHeight(2),
                            percentageW: screenWidth(100),
                            style: kSmallTextStyleLabel,
                          ),
                          TextFieldWidget(
                            text: 'Przebieg',
                            icon: FontAwesomeIcons.tachometerAlt,
                            onEditingComplete: () =>
                                FocusScope.of(context).nextFocus(),
                            maxLines: 1,
                            textInputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChange: (wprowadzonyPrzebieg) {
                              _enteredMileage =
                                  double.parse(wprowadzonyPrzebieg);
                            },
                          ),
                          TextWidget(
                            text: 'Numer rejestracyjny samochodu: ',
                            percentageH: screenHeight(2),
                            percentageW: screenWidth(100),
                            style: kSmallTextStyleLabel,
                          ),
                          TextFieldWidget(
                            text: 'Numer rejestracyjny',
                            icon: FontAwesomeIcons.hashtag,
                            onEditingComplete: () =>
                                FocusScope.of(context).nextFocus(),
                            maxLines: 1,
                            textInputType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onChange: (numerRejestracyjny) {
                              _enteredRegistrationNumber = numerRejestracyjny;
                            },
                          ),
                          TextWidget(
                            text: 'Numer VIN samochodu: ',
                            percentageH: screenHeight(2),
                            percentageW: screenWidth(100),
                            style: kSmallTextStyleLabel,
                          ),
                          TextFieldWidget(
                            text: 'Numer VIN',
                            icon: FontAwesomeIcons.hashtag,
                            onEditingComplete: () =>
                                FocusScope.of(context).nextFocus(),
                            maxLines: 1,
                            textInputType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onChange: (vin) {
                              _enteredVINNumber = vin;
                            },
                          ),
                          TextWidget(
                            text: 'Moc silnika w KM: ',
                            percentageH: screenHeight(2),
                            percentageW: screenWidth(100),
                            style: kSmallTextStyleLabel,
                          ),
                          TextFieldWidget(
                            text: 'Moc',
                            icon: FontAwesomeIcons.hashtag,
                            onEditingComplete: () =>
                                FocusScope.of(context).nextFocus(),
                            maxLines: 1,
                            textInputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChange: (mocSilnika) {
                              _enteredPower = double.parse(mocSilnika);
                            },
                          ),
                          TextWidget(
                            text: 'Pojemność silnika: ',
                            percentageH: screenHeight(2),
                            percentageW: screenWidth(100),
                            style: kSmallTextStyleLabel,
                          ),
                          TextFieldWidget(
                            text: 'Pojemność silnika',
                            icon: FontAwesomeIcons.hashtag,
                            onEditingComplete: () =>
                                FocusScope.of(context).unfocus(),
                            maxLines: 1,
                            textInputType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            onChange: (pojemnoscSilnika) {
                              _enteredEngineSize =
                                  double.parse(pojemnoscSilnika);
                            },
                          ),
                          DatePickerWidget(
                            text: 'Data ważności przeglądu technicznego:',
                            perWText: screenWidth(100),
                            perHText: screenHeight(2),
                            perHCard: screenHeight(5.5),
                            perWCard: screenWidth(100),
                            style: kSmallTextStyleLabel,
                            currentTime: _enteredExpOfTechnicalReview,
                            minTime: DateTime.now(),
                            maxTime: DateTime(DateTime.now().year + 2,
                                DateTime.now().month, DateTime.now().day),
                            onConfirm: (date) {
                              setState(() {
                                _enteredExpOfTechnicalReview = date;
                              });
                            },
                          ),
                          SizedBox(
                            height: screenHeight(1),
                          ),
                          DatePickerWidget(
                            text: 'Data ważności ubezpieczenia samochodu:',
                            perWText: screenWidth(100),
                            perHText: screenHeight(2),
                            perHCard: screenHeight(5.5),
                            perWCard: screenWidth(100),
                            style: kSmallTextStyleLabel,
                            currentTime: _enteredExpOfInsurance,
                            minTime: DateTime.now(),
                            maxTime: DateTime(DateTime.now().year + 2,
                                DateTime.now().month, DateTime.now().day),
                            onConfirm: (date) {
                              setState(() {
                                _enteredExpOfInsurance = date;
                              });
                            },
                          ),
                          SizedBox(
                            height: screenHeight(2),
                          ),
                          BigBottomButtonWidget(
                            text: 'Zapisz',
                            onPress: () {
                              setState(() {
                                CarModel nowySamochod = CarModel(
                                  brandName: _eneteredBrandName,
                                  modelName: _enteredModelName,
                                  yearOfProduction: _enteredYearOfProduction,
                                  mileage: _enteredMileage,
                                  fuelType: _enteredFuelType,
                                  registrationNumber:
                                      _enteredRegistrationNumber,
                                  expOfTechnicalReview:
                                      _enteredExpOfTechnicalReview,
                                  expOfInsurance: _enteredExpOfInsurance,
                                  vinNumber: _enteredVINNumber,
                                  power: _enteredPower,
                                  engineSize: _enteredEngineSize,
                                  fuelIndex: _eneterdFuelIndex,
                                );
                                Provider.of<CarsDatabase>(context,
                                        listen: false)
                                    .addCar(nowySamochod);
                                Navigator.pop(context);
                              });
                            },
                            icon: Icons.add,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
