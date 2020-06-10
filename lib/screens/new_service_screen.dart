import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mycar/constants.dart';
import 'package:mycar/models/cars_database.dart';
import 'package:mycar/models/service_model.dart';
import 'package:mycar/widgets/date_picker_widget.dart';
import 'package:mycar/widgets/text_widget.dart';

import 'package:mycar/widgets/service_option_widget.dart';
import 'package:mycar/widgets/text_field_widget.dart';
import 'package:mycar/widgets/big_bottom_button_widget.dart';

import 'package:provider/provider.dart';
import 'package:responsive_screen/responsive_screen.dart';

class NewServiceScreen extends StatefulWidget {
  NewServiceScreen({@required this.carIndex});

  final int carIndex;

  @override
  _NewServiceScreenState createState() =>
      _NewServiceScreenState(carIndex: carIndex);
}

class _NewServiceScreenState extends State<NewServiceScreen> {
  _NewServiceScreenState({@required this.carIndex});

  final ScrollController _scrollController = ScrollController();
  final int carIndex;

  ServiceModel _service = new ServiceModel();

  double _costOfService = 0;
  double _mileageAtService = 0;
  double _serviceInterval = 0;

  String _others = 'BRAK';
  String _oilName = 'BRAK';
  DateTime _serviceDate = DateTime.now();
  DateTime _nextServiceDate = DateTime.now().add(Duration(days: 365));

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
                    text: 'Nowy serwis',
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            DatePickerWidget(
                              text: 'Data wykonania serwisu: ',
                              perWText: screenWidth(100),
                              perHText: screenHeight(2.5),
                              perHCard: screenHeight(5.5),
                              perWCard: screenWidth(100),
                              style: kSmallTextStyleLabel,
                              currentTime: _serviceDate,
                              minTime: DateTime(2010, 1, 1),
                              maxTime: DateTime.now(),
                              onConfirm: (date) {
                                setState(() {
                                  _serviceDate = date;
                                });
                              },
                            ),
                            SizedBox(
                              height: screenHeight(1),
                            ),
                            TextWidget(
                              text: 'Wykonane czynności: ',
                              style: kSmallTextStyleLabel,
                              percentageW: screenWidth(100),
                              percentageH: screenHeight(2.5),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            SizedBox(
                              height: screenHeight(33),
                              width: screenWidth(100),
                              child: CupertinoScrollbar(
                                controller: _scrollController,
                                child: ListView.builder(
                                  controller: _scrollController,
                                  itemCount: 10,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: <Widget>[
                                        ServiceOptionWidget(
                                            onTap: () {
                                              setState(() {
                                                _service.getListOfSelectedOptions()[
                                                            index] ==
                                                        true
                                                    ? _service
                                                            .getListOfSelectedOptions()[
                                                        index] = false
                                                    : _service
                                                            .getListOfSelectedOptions()[
                                                        index] = true;
                                              });
                                            },
                                            iconData:
                                                _service.getListOfSelectedOptions()[
                                                            index] ==
                                                        true
                                                    ? FontAwesomeIcons
                                                        .plusSquare
                                                    : FontAwesomeIcons
                                                        .minusSquare,
                                            text:
                                                '${_service.getListOfOptions()[index]}'),
                                        SizedBox(height: screenHeight(1)),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: screenHeight(1),
                                ),
                                TextFieldWidget(
                                  icon: FontAwesomeIcons.oilCan,
                                  text: 'Wykorzystany olej',
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.text,
                                  maxLines: 1,
                                  onEditingComplete: () =>
                                      FocusScope.of(context).nextFocus(),
                                  onChange: (value) {
                                    _oilName = value;
                                  },
                                ),
                                TextFieldWidget(
                                  textInputAction: TextInputAction.next,
                                  text: 'Inne czynności',
                                  icon: FontAwesomeIcons.listOl,
                                  onEditingComplete: () =>
                                      FocusScope.of(context).nextFocus(),
                                  onChange: (value) {
                                    _others = value;
                                  },
                                  textInputType: TextInputType.text,
                                  maxLines: 5,
                                ),
                                TextFieldWidget(
                                  textInputAction: TextInputAction.next,
                                  text: 'Przebieg',
                                  icon: FontAwesomeIcons.tachometerAlt,
                                  onEditingComplete: () =>
                                      FocusScope.of(context).nextFocus(),
                                  maxLines: 1,
                                  onChange: (value) {
                                    if (double.parse(value) >
                                        Provider.of<CarsDatabase>(context,
                                                listen: false)
                                            .getListOfCars()[carIndex]
                                            .getMileage()) {
                                      this._mileageAtService =
                                          double.parse(value);
                                    }
                                  },
                                  textInputType: TextInputType.number,
                                ),
                                TextFieldWidget(
                                  textInputAction: TextInputAction.done,
                                  text: 'Koszt serwisu',
                                  icon: FontAwesomeIcons.dollarSign,
                                  onEditingComplete: () =>
                                      FocusScope.of(context).unfocus(),
                                  maxLines: 1,
                                  onChange: (value) {
                                    _costOfService = double.parse(value);
                                  },
                                  textInputType: TextInputType.number,
                                ),
                                DatePickerWidget(
                                  text: 'Data kolejnego serwisu: ',
                                  perWText: screenWidth(100),
                                  perHText: screenHeight(2.5),
                                  perHCard: screenHeight(5.5),
                                  perWCard: screenWidth(100),
                                  style: kSmallTextStyleLabel,
                                  minTime: DateTime.now(),
                                  maxTime: DateTime(DateTime.now().year + 2,
                                      DateTime.now().month, DateTime.now().day),
                                  onConfirm: (date) {
                                    _nextServiceDate = date;
                                  },
                                  currentTime: _nextServiceDate,
                                ),
                                SizedBox(
                                  height: screenHeight(1),
                                ),
                                TextWidget(
                                  text: 'Interwał serwisowy: ',
                                  style: kSmallTextStyleLabel,
                                  percentageW: screenWidth(100),
                                  percentageH: screenHeight(2.5),
                                ),
                                TextFieldWidget(
                                  text: 'Interwał serwisowy (w km)',
                                  icon: FontAwesomeIcons.tachometerAlt,
                                  onEditingComplete: () =>
                                      FocusScope.of(context).unfocus(),
                                  maxLines: 1,
                                  onChange: (value) {
                                    if (value != null) {
                                      _serviceInterval = double.parse(value);
                                    }
                                  },
                                  textInputType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight(1)),
                            BigBottomButtonWidget(
                              icon: Icons.add,
                              onPress: () {
                                Provider.of<CarsDatabase>(context,
                                        listen: false)
                                    .newService(
                                        new ServiceModel.parametric(
                                          oilChange: _service
                                              .getListOfSelectedOptions()[0],
                                          airFilter: _service
                                              .getListOfSelectedOptions()[1],
                                          fuelFilter: _service
                                              .getListOfSelectedOptions()[2],
                                          oilFilter: _service
                                              .getListOfSelectedOptions()[3],
                                          cabinFilter: _service
                                              .getListOfSelectedOptions()[4],
                                          brakeFluid: _service
                                              .getListOfSelectedOptions()[5],
                                          coolant: _service
                                              .getListOfSelectedOptions()[6],
                                          brakePads: _service
                                              .getListOfSelectedOptions()[7],
                                          sparkPlugs: _service
                                              .getListOfSelectedOptions()[8],
                                          timingBelt: _service
                                              .getListOfSelectedOptions()[9],
                                          oilName: _oilName,
                                          others: _others,
                                          mileageAtService: _mileageAtService,
                                          costOfService: _costOfService,
                                          serviceDate: _serviceDate,
                                          nextServiceDate: _nextServiceDate,
                                        ),
                                        carIndex);

                                if (_mileageAtService >
                                    Provider.of<CarsDatabase>(context,
                                            listen: false)
                                        .getListOfCars()[carIndex]
                                        .getMileage()) {
                                  Provider.of<CarsDatabase>(context,
                                          listen: false)
                                      .setMileage(_mileageAtService, carIndex);
                                }

                                Provider.of<CarsDatabase>(context,
                                        listen: false)
                                    .setNextServiceDate(
                                        _nextServiceDate, carIndex);
                                Provider.of<CarsDatabase>(context,
                                        listen: false)
                                    .setOilName(_oilName, carIndex);
                                Provider.of<CarsDatabase>(context,
                                        listen: false)
                                    .setServiceInterval(
                                        _serviceInterval, carIndex);
                                Navigator.pop(context);
                              },
                              text: 'Zapisz',
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
        ));
  }
}
