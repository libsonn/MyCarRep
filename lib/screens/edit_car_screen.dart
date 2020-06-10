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

class EditCarScreen extends StatefulWidget {
  EditCarScreen({@required this.carIndex});

  final int carIndex;
  @override
  _EditCarScreenState createState() => _EditCarScreenState(carIndex: carIndex);
}

class _EditCarScreenState extends State<EditCarScreen> {
  _EditCarScreenState({@required this.carIndex});

  final int carIndex;

  int _enteredYearOfProduction;

  String _enteredBrand;
  String _enteredModel;
  String _enteredFuelType;
  String _enteredRegistrationNumber;
  String _enteredMileage;
  String _enteredVINNumber;
  String _enteredPower;
  String _enteredEngineSize;
  String _enteredOilName;
  String _enteredServiceInterval;

  DateTime _enteredExpOfInsurance;
  DateTime _enteredNextServiceDate;
  DateTime _enteredExpOfTechnicalReview;

  @override
  Widget build(BuildContext context) {
    final screenWidth = Screen(context).wp;
    final screenHeight = Screen(context).hp;

    _enteredBrand = Provider.of<CarsDatabase>(context)
        .getListOfCars()[carIndex]
        .getBrandName();
    _enteredModel = Provider.of<CarsDatabase>(context)
        .getListOfCars()[carIndex]
        .getModelName();
    _enteredYearOfProduction = Provider.of<CarsDatabase>(context)
        .getListOfCars()[carIndex]
        .getYearOfProduction();
    _enteredFuelType = Provider.of<CarsDatabase>(context)
        .getListOfCars()[carIndex]
        .getFuelType();
    _enteredRegistrationNumber = Provider.of<CarsDatabase>(context)
        .getListOfCars()[carIndex]
        .getRegistrationNumber();
    _enteredMileage = Provider.of<CarsDatabase>(context)
        .getListOfCars()[carIndex]
        .getMileage()
        .toStringAsFixed(2);
    _enteredVINNumber = Provider.of<CarsDatabase>(context)
        .getListOfCars()[carIndex]
        .getVINNumber();
    _enteredPower = Provider.of<CarsDatabase>(context)
        .getListOfCars()[carIndex]
        .getPower()
        .toStringAsFixed(2);
    _enteredEngineSize = Provider.of<CarsDatabase>(context)
        .getListOfCars()[carIndex]
        .getEngineSize()
        .toStringAsFixed(2);
    _enteredOilName = Provider.of<CarsDatabase>(context)
        .getListOfCars()[carIndex]
        .getOilName();
    _enteredServiceInterval = Provider.of<CarsDatabase>(context)
        .getListOfCars()[carIndex]
        .getServiceInterval()
        .toStringAsFixed(2);

    _enteredExpOfInsurance = Provider.of<CarsDatabase>(context)
        .getListOfCars()[carIndex]
        .getExpOfInsurance();
    _enteredNextServiceDate = Provider.of<CarsDatabase>(context)
        .getListOfCars()[carIndex]
        .getNextServiceDate();
    _enteredExpOfTechnicalReview = Provider.of<CarsDatabase>(context)
        .getListOfCars()[carIndex]
        .getExpOfTechnicalReview();

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
        scrollController: FixedExtentScrollController(
            initialItem: Provider.of<CarsDatabase>(context)
                .getListOfCars()[carIndex]
                .getFuelIndex()),
        backgroundColor: kBackgroundColor,
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedFuelIndex) {
          _enteredFuelType =
              listOfFuelTypesString.elementAt(selectedFuelIndex).toString();
          Provider.of<CarsDatabase>(context, listen: false)
              .setFuel(_enteredFuelType, selectedFuelIndex, carIndex);
        },
        children: listOfFuelTypesText,
      );
    }

    CupertinoPicker yearOfProductionPicker() {
      List<Text> listOfYears = [];

      for (int year = 1950; year < 2021; year++) {
        listOfYears.add(Text('$year'));
      }

      return CupertinoPicker(
        scrollController: FixedExtentScrollController(
            initialItem: _enteredYearOfProduction - 1950),
        backgroundColor: kBackgroundColor,
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedYear) {
          _enteredYearOfProduction = (selectedYear + 1950);
          Provider.of<CarsDatabase>(context, listen: false)
              .steYearOfProduction(_enteredYearOfProduction, carIndex);
        },
        children: listOfYears,
      );
    }

    return MaterialApp(
      theme: ThemeData(
        cupertinoOverrideTheme: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle: TextStyle(color: kTextColor, fontSize: 16),
            pickerTextStyle: TextStyle(color: kTextColor, fontSize: 20),
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: kBackgroundColor,
        resizeToAvoidBottomPadding: true,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextWidget(
                    text: 'Edytuj samochód',
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
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                TextWidget(
                                  text: 'Zdjęcie pojazdu: ',
                                  percentageH: screenHeight(2.5),
                                  percentageW: screenWidth(100),
                                  style: kSmallTextStyleLabel,
                                ),
                                SizedBox(
                                  height: screenHeight(1),
                                ),
                                Hero(
                                  tag: 'zdjeciePojazdu',
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Provider.of<CarsDatabase>(context,
                                                listen: false)
                                            .setPhoto(carIndex);
                                      },
                                      child: SizedBox(
                                        width: screenWidth(40),
                                        height: screenHeight(20),
                                        child: Provider.of<CarsDatabase>(
                                                        context)
                                                    .getListOfCars()[carIndex]
                                                    .getCarPhoto() ==
                                                null
                                            ? Icon(
                                                Icons.directions_car,
                                                color: Colors.orange,
                                                size: screenWidth(40),
                                              )
                                            : Provider.of<CarsDatabase>(context)
                                                .getListOfCars()[carIndex]
                                                .getCarPhoto(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight(2),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                TextWidget(
                                  text: 'Marka pojazdu: ',
                                  percentageH: screenHeight(2.5),
                                  percentageW: screenWidth(100),
                                  style: kSmallTextStyleLabel,
                                ),
                                TextFieldWidget(
                                  icon: FontAwesomeIcons.hashtag,
                                  textInputAction: TextInputAction.done,
                                  maxLines: 1,
                                  text: '$_enteredBrand',
                                  textInputType: TextInputType.text,
                                  onChange: (value) {
                                    _enteredBrand = value;
                                    Provider.of<CarsDatabase>(context,
                                            listen: false)
                                        .setBrandName(_enteredBrand, carIndex);
                                  },
                                  onEditingComplete: () =>
                                      FocusScope.of(context).unfocus(),
                                ),
                                TextWidget(
                                  text: 'Model pojazdu: ',
                                  percentageH: screenHeight(2.5),
                                  percentageW: screenWidth(100),
                                  style: kSmallTextStyleLabel,
                                ),
                                TextFieldWidget(
                                  icon: FontAwesomeIcons.hashtag,
                                  textInputAction: TextInputAction.done,
                                  maxLines: 1,
                                  text: '$_enteredModel',
                                  textInputType: TextInputType.text,
                                  onChange: (value) {
                                    _enteredModel = value;
                                    Provider.of<CarsDatabase>(context,
                                            listen: false)
                                        .setModelName(_enteredModel, carIndex);
                                  },
                                  onEditingComplete: () =>
                                      FocusScope.of(context).unfocus(),
                                ),
                                TextWidget(
                                  text: 'Numer rejestracyjny: ',
                                  percentageH: screenHeight(2.5),
                                  percentageW: screenWidth(100),
                                  style: kSmallTextStyleLabel,
                                ),
                                TextFieldWidget(
                                  icon: FontAwesomeIcons.hashtag,
                                  textInputAction: TextInputAction.done,
                                  maxLines: 1,
                                  text: '$_enteredRegistrationNumber',
                                  textInputType: TextInputType.text,
                                  onChange: (value) {
                                    _enteredRegistrationNumber = value;
                                    Provider.of<CarsDatabase>(context,
                                            listen: false)
                                        .setRegistrationNumber(
                                            _enteredRegistrationNumber,
                                            carIndex);
                                  },
                                  onEditingComplete: () =>
                                      FocusScope.of(context).unfocus(),
                                ),
                                TextWidget(
                                  text: 'Przebieg: ',
                                  percentageH: screenHeight(2.5),
                                  percentageW: screenWidth(100),
                                  style: kSmallTextStyleLabel,
                                ),
                                TextFieldWidget(
                                  icon: FontAwesomeIcons.tachometerAlt,
                                  textInputAction: TextInputAction.done,
                                  maxLines: 1,
                                  text: '$_enteredMileage',
                                  textInputType: TextInputType.number,
                                  onChange: (value) {
                                    _enteredMileage = value;
                                    Provider.of<CarsDatabase>(context,
                                            listen: false)
                                        .setMileage(
                                            double.parse(_enteredMileage),
                                            carIndex);
                                  },
                                  onEditingComplete: () =>
                                      FocusScope.of(context).unfocus(),
                                ),
                                SizedBox(
                                  height: screenHeight(1),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    TextWidget(
                                      text: 'Rocznik: ',
                                      percentageH: screenHeight(2.5),
                                      percentageW: screenWidth(40),
                                      style: kSmallTextStyleLabel,
                                    ),
                                    Container(
                                      child: yearOfProductionPicker(),
                                      width: screenWidth(50),
                                      height: screenHeight(6),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight(1),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    TextWidget(
                                      text: 'Typ paliwa: ',
                                      percentageH: screenHeight(2.5),
                                      percentageW: screenWidth(40),
                                      style: kSmallTextStyleLabel,
                                    ),
                                    Container(
                                      child: typeOfFuelPicker(),
                                      width: screenWidth(50),
                                      height: screenHeight(6),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight(1),
                                ),
                                TextWidget(
                                  text: 'Numer VIN: ',
                                  percentageH: screenHeight(2.5),
                                  percentageW: screenWidth(100),
                                  style: kSmallTextStyleLabel,
                                ),
                                TextFieldWidget(
                                  icon: FontAwesomeIcons.hashtag,
                                  textInputAction: TextInputAction.done,
                                  maxLines: 1,
                                  text: '$_enteredVINNumber',
                                  textInputType: TextInputType.text,
                                  onChange: (value) {
                                    _enteredVINNumber = value;
                                    Provider.of<CarsDatabase>(context,
                                            listen: false)
                                        .setVINNumber(
                                            _enteredVINNumber, carIndex);
                                  },
                                  onEditingComplete: () =>
                                      FocusScope.of(context).unfocus(),
                                ),
                                TextWidget(
                                  text: 'Moc silnika w KM: ',
                                  percentageH: screenHeight(2.5),
                                  percentageW: screenWidth(100),
                                  style: kSmallTextStyleLabel,
                                ),
                                TextFieldWidget(
                                  icon: FontAwesomeIcons.hashtag,
                                  textInputAction: TextInputAction.done,
                                  maxLines: 1,
                                  text: '$_enteredPower',
                                  textInputType: TextInputType.number,
                                  onChange: (value) {
                                    _enteredPower = value;
                                    Provider.of<CarsDatabase>(context,
                                            listen: false)
                                        .setPower(double.parse(_enteredPower),
                                            carIndex);
                                  },
                                  onEditingComplete: () =>
                                      FocusScope.of(context).unfocus(),
                                ),
                                TextWidget(
                                  text: 'Pojemność silnika: ',
                                  percentageH: screenHeight(2.5),
                                  percentageW: screenWidth(100),
                                  style: kSmallTextStyleLabel,
                                ),
                                TextFieldWidget(
                                  icon: FontAwesomeIcons.hashtag,
                                  textInputAction: TextInputAction.done,
                                  maxLines: 1,
                                  text: '$_enteredEngineSize',
                                  textInputType: TextInputType.number,
                                  onChange: (value) {
                                    _enteredEngineSize = value;
                                    Provider.of<CarsDatabase>(context,
                                            listen: false)
                                        .setEngineSize(
                                            double.parse(_enteredEngineSize),
                                            carIndex);
                                  },
                                  onEditingComplete: () =>
                                      FocusScope.of(context).unfocus(),
                                ),
                                TextWidget(
                                  text: 'Olej: ',
                                  percentageH: screenHeight(2.5),
                                  percentageW: screenWidth(100),
                                  style: kSmallTextStyleLabel,
                                ),
                                TextFieldWidget(
                                  icon: FontAwesomeIcons.oilCan,
                                  textInputAction: TextInputAction.done,
                                  maxLines: 1,
                                  text: '$_enteredOilName',
                                  textInputType: TextInputType.text,
                                  onChange: (value) {
                                    _enteredOilName = value;
                                    Provider.of<CarsDatabase>(context,
                                            listen: false)
                                        .setOilName(_enteredOilName, carIndex);
                                  },
                                  onEditingComplete: () =>
                                      FocusScope.of(context).unfocus(),
                                ),
                                TextWidget(
                                  text: 'Interwał serwisowy: ',
                                  percentageH: screenHeight(2.5),
                                  percentageW: screenWidth(100),
                                  style: kSmallTextStyleLabel,
                                ),
                                TextFieldWidget(
                                  icon: FontAwesomeIcons.tachometerAlt,
                                  textInputAction: TextInputAction.done,
                                  maxLines: 1,
                                  text: '$_enteredServiceInterval',
                                  textInputType: TextInputType.number,
                                  onChange: (value) {
                                    _enteredServiceInterval = value;
                                    Provider.of<CarsDatabase>(context,
                                            listen: false)
                                        .setServiceInterval(
                                            double.parse(
                                                _enteredServiceInterval),
                                            carIndex);
                                  },
                                  onEditingComplete: () =>
                                      FocusScope.of(context).unfocus(),
                                ),
                              ],
                            ),
                            DatePickerWidget(
                              text: 'Data ważności przeglądu: ',
                              perWText: screenWidth(100),
                              perHText: screenHeight(2.5),
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
                                  Provider.of<CarsDatabase>(context,
                                          listen: false)
                                      .setExpOfTechnicalReview(
                                          _enteredExpOfTechnicalReview,
                                          carIndex);
                                });
                              },
                            ),
                            SizedBox(
                              height: screenHeight(1),
                            ),
                            DatePickerWidget(
                              text: 'Data ważności ubezpieczenia: ',
                              perWText: screenWidth(100),
                              perHText: screenHeight(2.5),
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
                                  Provider.of<CarsDatabase>(context,
                                          listen: false)
                                      .setExpOfInsurance(
                                          _enteredExpOfInsurance, carIndex);
                                });
                              },
                            ),
                            SizedBox(
                              height: screenHeight(1),
                            ),
                            DatePickerWidget(
                              text: 'Data kolejnego serwisu: ',
                              perWText: screenWidth(100),
                              perHText: screenHeight(2.5),
                              perHCard: screenHeight(5.5),
                              perWCard: screenWidth(100),
                              style: kSmallTextStyleLabel,
                              currentTime: _enteredNextServiceDate,
                              minTime: DateTime.now(),
                              maxTime: DateTime(DateTime.now().year + 2,
                                  DateTime.now().month, DateTime.now().day),
                              onConfirm: (date) {
                                setState(() {
                                  _enteredNextServiceDate = date;
                                  Provider.of<CarsDatabase>(context,
                                          listen: false)
                                      .setNextServiceDate(
                                          _enteredNextServiceDate, carIndex);
                                });
                              },
                            ),
                            SizedBox(
                              height: screenHeight(2),
                            ),
                            BigBottomButtonWidget(
                              icon: Icons.add,
                              text: 'Zapisz',
                              onPress: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
