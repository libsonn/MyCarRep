import 'package:flutter/material.dart';

import 'package:mycar/constants.dart';
import 'package:mycar/models/car_model.dart';
import 'package:mycar/models/cars_database.dart';
import 'package:mycar/widgets/text_widget.dart';
import 'package:mycar/widgets/big_bottom_button_widget.dart';
import 'package:mycar/widgets/blue_button_widget.dart';

import 'package:mycar/screens/details_screen.dart';
import 'package:mycar/screens/technical_review_screen.dart';
import 'package:mycar/screens/new_refuel_screen.dart';
import 'package:mycar/screens/new_car_screen.dart';
import 'package:mycar/screens/new_service_screen.dart';
import 'package:mycar/screens/edit_car_screen.dart';
import 'package:mycar/screens/confirm_deleting_bottom_sheet.dart';

import 'package:responsive_screen/responsive_screen.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChooseCarScreen extends StatefulWidget {
  @override
  _ChooseCarScreenState createState() => _ChooseCarScreenState();
}

class _ChooseCarScreenState extends State<ChooseCarScreen> {
  Widget buildBottonSheet(BuildContext context) {
    return ConfirmDeletingScreen(
      carIndex: carToDeleteIndex,
    );
  }

  int carToDeleteIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CarsDatabase>(context, listen: false).getDataFromMemory();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = Screen(context).wp;
    final screenHeight = Screen(context).hp;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.directions_car,
                  color: Colors.orange,
                  size: screenWidth(10),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: screenHeight(1),
                    ),
                    TextWidget(
                      text: 'MyCar',
                      percentageH: screenHeight(3),
                      percentageW: screenWidth(60),
                      style: kNormalTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Provider.of<CarsDatabase>(context).getNumberOfCars(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: SizedBox(
                    width: screenWidth(90),
                    height: screenHeight(100),
                    child: Container(
                      decoration: kBoxDecoration,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return EditCarScreen(
                                          carIndex: index,
                                        );
                                      }));
                                    });
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.cog,
                                    color: kIconColor,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    carToDeleteIndex = index;
                                    bool usun = await showModalBottomSheet(
                                        context: context,
                                        builder: buildBottonSheet);

                                    if (usun == true) {
                                      await Future.delayed(
                                          const Duration(milliseconds: 300));
                                      Provider.of<CarsDatabase>(context,
                                              listen: false)
                                          .deleteCar(index);
                                    }
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.trash,
                                    color: kIconColor,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onLongPress: () {
                                setState(() {
                                  Provider.of<CarsDatabase>(context,
                                          listen: false)
                                      .setPhoto(index);
                                });
                              },
                              child: Center(
                                child: SizedBox(
                                  width: screenWidth(70),
                                  height: screenHeight(20),
                                  child: Center(
                                    child: Provider.of<CarsDatabase>(context)
                                                .getListOfCars()[index]
                                                .getCarPhoto() ==
                                            null
                                        ? Icon(
                                            Icons.directions_car,
                                            color: Colors.orange,
                                            size: screenWidth(40),
                                          )
                                        : (Provider.of<CarsDatabase>(
                                            context,
                                          )
                                            .getListOfCars()[index]
                                            .getCarPhoto()),
                                  ),
                                ),
                              ),
                            ),
                            TextWidget(
                              text:
                                  '${Provider.of<CarsDatabase>(context).getListOfCars()[index].getBrandName()} ${Provider.of<CarsDatabase>(context).getListOfCars()[index].getModelName()}',
                              percentageH: screenHeight(3),
                              percentageW: screenWidth(100),
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
                              height: screenHeight(1),
                            ),
                            TextWidget(
                              text:
                                  'Numer rejestracyjny: ${Provider.of<CarsDatabase>(context).getListOfCars()[index].getRegistrationNumber()}',
                              percentageH: screenHeight(2),
                              percentageW: screenWidth(100),
                              style: kSmallTextStyleLabel,
                            ),
                            SizedBox(
                              height: screenHeight(1.5),
                            ),
                            TextWidget(
                              text:
                                  'Rocznik: ${Provider.of<CarsDatabase>(context).getListOfCars()[index].getYearOfProduction()} ',
                              percentageH: screenHeight(2),
                              percentageW: screenWidth(100),
                              style: kSmallTextStyleLabel,
                            ),
                            SizedBox(
                              height: screenHeight(1.5),
                            ),
                            TextWidget(
                              text:
                                  'Przebieg: ${Provider.of<CarsDatabase>(context).getListOfCars()[index].getMileage().toStringAsFixed(2)} km',
                              percentageH: screenHeight(2),
                              percentageW: screenWidth(100),
                              style: kSmallTextStyleLabel,
                            ),
                            SizedBox(
                              height: screenHeight(1.5),
                            ),
                            TextWidget(
                              text:
                                  'Rodzaj paliwa: ${Provider.of<CarsDatabase>(context).getListOfCars()[index].getFuelType()}',
                              percentageH: screenHeight(2),
                              percentageW: screenWidth(100),
                              style: kSmallTextStyleLabel,
                            ),
                            SizedBox(
                              height: screenHeight(1.5),
                            ),
                            BlueButtonWidget(
                              text: 'Tankowanie',
                              percentageHNapis: screenHeight(2),
                              percentageWNapis: screenWidth(60),
                              percentageWSizedBox: screenWidth(5),
                              percentageWCard: screenWidth(100),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return NewRefuelScreen(
                                        carIndex: index,
                                      );
                                    },
                                  ),
                                );
                              },
                              icon: FontAwesomeIcons.gasPump,
                            ),
                            SizedBox(
                              height: screenHeight(1),
                            ),
                            BlueButtonWidget(
                              text: 'Serwis',
                              percentageHNapis: screenHeight(2),
                              percentageWNapis: screenWidth(60),
                              percentageWSizedBox: screenWidth(5),
                              percentageWCard: screenWidth(100),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return NewServiceScreen(carIndex: index);
                                    },
                                  ),
                                );
                              },
                              icon: FontAwesomeIcons.wrench,
                            ),
                            SizedBox(
                              height: screenHeight(1),
                            ),
                            BlueButtonWidget(
                              text: 'Szczegóły o samochodzie',
                              percentageHNapis: screenHeight(2),
                              percentageWNapis: screenWidth(60),
                              percentageWSizedBox: screenWidth(5),
                              percentageWCard: screenWidth(100),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return CarDetailsScreen(
                                    carIndex: index,
                                  );
                                }));
                              },
                              icon: FontAwesomeIcons.info,
                            ),
                            SizedBox(
                              height: screenHeight(1),
                            ),
                            BlueButtonWidget(
                              text: 'Przegląd i ubezpieczenie',
                              percentageHNapis: screenHeight(2),
                              percentageWNapis: screenWidth(60),
                              percentageWSizedBox: screenWidth(5),
                              percentageWCard: screenWidth(100),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return TechnicalReviewScreen(
                                          carIndex: index);
                                    },
                                  ),
                                );
                              },
                              icon: FontAwesomeIcons.info,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: BigBottomButtonWidget(
              text: 'Dodaj samochód',
              icon: Icons.add,
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NewCarScreen();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
