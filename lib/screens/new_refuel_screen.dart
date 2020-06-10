import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mycar/models/refuel_model.dart';
import 'package:mycar/models/cars_database.dart';

import 'package:mycar/constants.dart';
import 'package:mycar/widgets/big_bottom_button_widget.dart';
import 'package:mycar/widgets/date_picker_widget.dart';
import 'package:mycar/widgets/text_field_widget.dart';
import 'package:mycar/widgets/text_widget.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_screen/responsive_screen.dart';

class NewRefuelScreen extends StatefulWidget {
  NewRefuelScreen({@required this.carIndex});

  final int carIndex;
  @override
  _NewRefuelScreenState createState() =>
      _NewRefuelScreenState(carIndex: carIndex);
}

class _NewRefuelScreenState extends State<NewRefuelScreen> {
  _NewRefuelScreenState({@required this.carIndex});

  final int carIndex;

  DateTime _dateOfRefueling = DateTime.now();
  double _amountOfFuel = 0;
  double _costOfLiter = 0;
  double _cost = 0;
  double mileageAtRefueling = 0;
  double _consumptionFromRefueling = 0;
  double mileageFromRefueling = 0;

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
                  text: 'Nowe tankowanie',
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
                          DatePickerWidget(
                            text: 'Data tankowania: ',
                            perWText: screenWidth(100),
                            perHText: screenHeight(2.5),
                            perHCard: screenHeight(5.5),
                            perWCard: screenWidth(100),
                            style: kSmallTextStyleLabel,
                            currentTime: _dateOfRefueling,
                            minTime: DateTime(2010, 1, 1),
                            maxTime: DateTime.now(),
                            onConfirm: (date) {
                              setState(() {
                                _dateOfRefueling = date;
                              });
                            },
                          ),
                          SizedBox(
                            height: screenHeight(1),
                          ),
                          TextFieldWidget(
                            textInputAction: TextInputAction.next,
                            maxLines: 1,
                            text: 'Cena za litr',
                            icon: FontAwesomeIcons.dollarSign,
                            onChange: (cena) {
                              setState(() {
                                _costOfLiter = double.parse(cena);
                                if (_cost > 0 && _costOfLiter > 0) {
                                  _amountOfFuel = _cost / _costOfLiter;

                                  _consumptionFromRefueling =
                                      Provider.of<CarsDatabase>(context,
                                              listen: false)
                                          .countAverageConsumptionFromRefuel(
                                              carIndex,
                                              _amountOfFuel,
                                              Provider.of<CarsDatabase>(context,
                                                      listen: false)
                                                  .getMileageFromRefueling(
                                                      carIndex,
                                                      mileageAtRefueling));
                                } else {
                                  _amountOfFuel = 0;
                                }
                              });
                            },
                            textInputType: TextInputType.number,
                            onEditingComplete: () =>
                                FocusScope.of(context).nextFocus(),
                          ),
                          SizedBox(
                            height: screenHeight(1),
                          ),
                          TextFieldWidget(
                            textInputAction: TextInputAction.next,
                            maxLines: 1,
                            text: 'Koszt tankowania',
                            icon: FontAwesomeIcons.dollarSign,
                            onChange: (kwota) {
                              setState(() {
                                _cost = double.parse(kwota);
                                if (_cost > 0 && _costOfLiter > 0) {
                                  _amountOfFuel = _cost / _costOfLiter;
                                  if (Provider.of<CarsDatabase>(context,
                                              listen: false)
                                          .countAverageConsumptionFromRefuel(
                                              carIndex,
                                              _amountOfFuel,
                                              Provider.of<CarsDatabase>(context,
                                                      listen: false)
                                                  .getMileageFromRefueling(
                                                      carIndex,
                                                      mileageAtRefueling)) >
                                      0) {
                                    _consumptionFromRefueling =
                                        Provider.of<CarsDatabase>(context,
                                                listen: false)
                                            .countAverageConsumptionFromRefuel(
                                                carIndex,
                                                _amountOfFuel,
                                                Provider.of<CarsDatabase>(
                                                        context,
                                                        listen: false)
                                                    .getMileageFromRefueling(
                                                        carIndex,
                                                        mileageAtRefueling));
                                  }
                                } else {
                                  _amountOfFuel = 0;
                                }
                              });
                            },
                            textInputType: TextInputType.number,
                            onEditingComplete: () =>
                                FocusScope.of(context).nextFocus(),
                          ),
                          SizedBox(
                            height: screenHeight(1),
                          ),
                          TextFieldWidget(
                            textInputAction: TextInputAction.done,
                            maxLines: 1,
                            text: 'Aktualny przebieg',
                            icon: FontAwesomeIcons.tachometerAlt,
                            onChange: (aktualnyPrzebieg) {
                              setState(() {
                                mileageAtRefueling =
                                    double.parse(aktualnyPrzebieg);

                                if (Provider.of<CarsDatabase>(context,
                                            listen: false)
                                        .countAverageConsumptionFromRefuel(
                                            carIndex,
                                            _amountOfFuel,
                                            Provider.of<CarsDatabase>(context,
                                                    listen: false)
                                                .getMileageFromRefueling(
                                                    carIndex,
                                                    mileageAtRefueling)) >
                                    0) {
                                  _consumptionFromRefueling =
                                      Provider.of<CarsDatabase>(context,
                                              listen: false)
                                          .countAverageConsumptionFromRefuel(
                                              carIndex,
                                              _amountOfFuel,
                                              Provider.of<CarsDatabase>(context,
                                                      listen: false)
                                                  .getMileageFromRefueling(
                                                      carIndex,
                                                      mileageAtRefueling));
                                }

                                mileageFromRefueling =
                                    Provider.of<CarsDatabase>(context,
                                            listen: false)
                                        .getMileageFromRefueling(
                                            carIndex, mileageAtRefueling);
                              });
                            },
                            textInputType: TextInputType.number,
                            onEditingComplete: () =>
                                FocusScope.of(context).unfocus(),
                          ),
                          SizedBox(
                            height: screenHeight(1),
                          ),
                          TextWidget(
                            text:
                                'Zatankowano litrów: ${_amountOfFuel.toStringAsFixed(2)} l',
                            style: kSmallTextStyleLabel,
                            percentageW: screenWidth(100),
                            percentageH: screenHeight(2),
                          ),
                          SizedBox(
                            height: screenHeight(1),
                          ),
                          _consumptionFromRefueling.isFinite
                              ? TextWidget(
                                  text:
                                      'Średnie spalanie pojazdu:  ${_consumptionFromRefueling.toStringAsFixed(2)} l/100km',
                                  style: kSmallTextStyleLabel,
                                  percentageW: screenWidth(100),
                                  percentageH: screenHeight(2),
                                )
                              : TextWidget(
                                  text: 'Średnie spalanie pojazdu:  0 l/100km',
                                  style: kSmallTextStyleLabel,
                                  percentageW: screenWidth(100),
                                  percentageH: screenHeight(2),
                                ),
                          SizedBox(
                            height: screenHeight(1),
                          ),
                          TextWidget(
                            text:
                                'Przebieg od poprzedniego tankowania:  ${mileageFromRefueling.toStringAsFixed(2)} km',
                            style: kSmallTextStyleLabel,
                            percentageW: screenWidth(100),
                            percentageH: screenHeight(2),
                          ),
                          SizedBox(
                            height: screenHeight(1),
                          ),
                          BigBottomButtonWidget(
                            text: 'Zapisz',
                            onPress: () {
                              Provider.of<CarsDatabase>(context, listen: false)
                                  .newRefuel(
                                carIndex,
                                new RefuelModel(
                                  cost: _cost,
                                  amountOfFuel: _amountOfFuel,
                                  mileageFromRefueling: mileageFromRefueling,
                                  mileageAtRefueling: mileageAtRefueling,
                                  costOfLiter: _costOfLiter,
                                  dateOfRefueling: _dateOfRefueling,
                                ),
                              );

                              Provider.of<CarsDatabase>(
                                context,
                                listen: false,
                              ).countAverageConsumption(carIndex, _amountOfFuel,
                                  mileageFromRefueling);

                              Provider.of<CarsDatabase>(context, listen: false)
                                  .addFuelMoney(carIndex, _cost);

                              if (mileageAtRefueling >
                                  Provider.of<CarsDatabase>(context,
                                          listen: false)
                                      .getListOfCars()[carIndex]
                                      .getMileage()) {
                                Provider.of<CarsDatabase>(context,
                                        listen: false)
                                    .setMileage(mileageAtRefueling, carIndex);
                              }

                              Navigator.pop(context);
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
