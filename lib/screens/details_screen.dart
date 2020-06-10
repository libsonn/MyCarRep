import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycar/constants.dart';
import 'package:mycar/models/cars_database.dart';
import 'package:mycar/widgets/big_bottom_button_widget.dart';
import 'package:intl/intl.dart';
import 'package:mycar/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_screen/responsive_screen.dart';

class CarDetailsScreen extends StatefulWidget {
  CarDetailsScreen({@required this.carIndex});
  final int carIndex;

  @override
  _CarDetailsScreenState createState() =>
      _CarDetailsScreenState(carIndex: carIndex);
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  _CarDetailsScreenState({@required this.carIndex});
  final int carIndex;

  DateFormat _dateFormat = DateFormat.yMd();

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
                  text: 'Szczegóły o samochodzie',
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
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: screenWidth(80),
                          height: screenHeight(100),
                          child: Container(
                            decoration: kBoxDecoration,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ListView(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Center(
                                        child: SizedBox(
                                          width: screenWidth(50),
                                          height: screenHeight(24),
                                          child: Center(
                                            child: Provider.of<CarsDatabase>(
                                                            context,
                                                            listen: false)
                                                        .getListOfCars()[
                                                            carIndex]
                                                        .getCarPhoto() ==
                                                    null
                                                ? Icon(
                                                    Icons.directions_car,
                                                    color: Colors.orange,
                                                    size: screenWidth(50),
                                                  )
                                                : Provider.of<CarsDatabase>(
                                                        context,
                                                        listen: false)
                                                    .getListOfCars()[carIndex]
                                                    .getCarPhoto(),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              SizedBox(
                                                height: screenHeight(1),
                                              ),
                                              TextWidget(
                                                text:
                                                    'Marka:    ${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getBrandName()}',
                                                style: kSmallTextStyleLabel,
                                                percentageW: screenWidth(70),
                                                percentageH: screenHeight(2),
                                              ),
                                              SizedBox(
                                                height: screenHeight(1),
                                              ),
                                              TextWidget(
                                                text:
                                                    'Model:    ${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getModelName()}',
                                                style: kSmallTextStyleLabel,
                                                percentageW: screenWidth(70),
                                                percentageH: screenHeight(2),
                                              ),
                                              SizedBox(
                                                height: screenHeight(1),
                                              ),
                                              TextWidget(
                                                text:
                                                    'Numer rejestracyjny:    ${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getRegistrationNumber()}',
                                                style: kSmallTextStyleLabel,
                                                percentageW: screenWidth(70),
                                                percentageH: screenHeight(2),
                                              ),
                                              SizedBox(
                                                height: screenHeight(1),
                                              ),
                                              TextWidget(
                                                text:
                                                    'Rocznik: ${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getYearOfProduction()}',
                                                style: kSmallTextStyleLabel,
                                                percentageW: screenWidth(70),
                                                percentageH: screenHeight(2),
                                              ),
                                              SizedBox(
                                                height: screenHeight(1),
                                              ),
                                              TextWidget(
                                                text:
                                                    'Typ paliwa: ${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getFuelType()}',
                                                style: kSmallTextStyleLabel,
                                                percentageW: screenWidth(70),
                                                percentageH: screenHeight(2),
                                              ),
                                              SizedBox(
                                                height: screenHeight(1),
                                              ),
                                              TextWidget(
                                                text:
                                                    'Przebieg: ${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getMileage().toStringAsFixed(2)} km',
                                                style: kSmallTextStyleLabel,
                                                percentageW: screenWidth(70),
                                                percentageH: screenHeight(2),
                                              ),
                                              SizedBox(
                                                height: screenHeight(1),
                                              ),
                                              TextWidget(
                                                text:
                                                    'Numer VIN: ${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getVINNumber()}',
                                                style: kSmallTextStyleLabel,
                                                percentageW: screenWidth(70),
                                                percentageH: screenHeight(2),
                                              ),
                                              SizedBox(
                                                height: screenHeight(1),
                                              ),
                                              TextWidget(
                                                text:
                                                    'Moc silnika: ${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getPower().toStringAsFixed(2)} KM',
                                                style: kSmallTextStyleLabel,
                                                percentageW: screenWidth(70),
                                                percentageH: screenHeight(2),
                                              ),
                                              SizedBox(
                                                height: screenHeight(1),
                                              ),
                                              TextWidget(
                                                text:
                                                    'Pojemność silnika: ${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getEngineSize()}',
                                                style: kSmallTextStyleLabel,
                                                percentageW: screenWidth(70),
                                                percentageH: screenHeight(2),
                                              ),
                                              SizedBox(
                                                height: screenHeight(1),
                                              ),
                                              TextWidget(
                                                text:
                                                    'Wykorzystywany olej: ${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getOilName()}',
                                                style: kSmallTextStyleLabel,
                                                percentageW: screenWidth(70),
                                                percentageH: screenHeight(2),
                                              ),
                                              SizedBox(
                                                height: screenHeight(1),
                                              ),
                                              TextWidget(
                                                text:
                                                    'Data wygaśnięcia przeglądu: ${_dateFormat.format(Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getExpOfTechnicalReview())}',
                                                style: kSmallTextStyleLabel,
                                                percentageW: screenWidth(70),
                                                percentageH: screenHeight(2),
                                              ),
                                              SizedBox(
                                                height: screenHeight(1),
                                              ),
                                              TextWidget(
                                                text:
                                                    'Data wygaśnięcia ubezpieczenia: ${_dateFormat.format(Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getExpOfInsurance())}',
                                                style: kSmallTextStyleLabel,
                                                percentageW: screenWidth(70),
                                                percentageH: screenHeight(2),
                                              ),
                                              SizedBox(
                                                height: screenHeight(1),
                                              ),
                                              TextWidget(
                                                text:
                                                    'Data kolejnego serwisu: ${_dateFormat.format(Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getNextServiceDate())}',
                                                style: kSmallTextStyleLabel,
                                                percentageW: screenWidth(70),
                                                percentageH: screenHeight(2),
                                              ),
                                              SizedBox(
                                                height: screenHeight(1),
                                              ),
                                              TextWidget(
                                                text:
                                                    'Kolejny serwis za: ${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getKilometersToService().toStringAsFixed(2)}km',
                                                style: kSmallTextStyleLabel,
                                                percentageW: screenWidth(70),
                                                percentageH: screenHeight(2),
                                              ),
                                              SizedBox(
                                                height: screenHeight(1),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: screenWidth(85),
                          height: screenHeight(100),
                          child: Container(
                            decoration: kBoxDecoration,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ListView(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      TextWidget(
                                        text: 'Informacje o tankowaniach',
                                        style: kHeaderTextStyle,
                                        percentageW: screenWidth(100),
                                        percentageH: screenHeight(3),
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
                                      SizedBox(
                                        height: screenHeight(50),
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: ListView.builder(
                                              itemCount:
                                                  Provider.of<CarsDatabase>(
                                                context,
                                              ).getNumberOfRefuels(carIndex),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return GestureDetector(
                                                  onLongPress: () {
                                                    Provider.of<CarsDatabase>(
                                                            context,
                                                            listen: false)
                                                        .removeRefuel(
                                                            carIndex,
                                                            Provider.of<CarsDatabase>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .getNumberOfRefuels(
                                                                        carIndex) -
                                                                index);
                                                  },
                                                  child: Card(
                                                    color: kButtonColor,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          TextWidget(
                                                            text:
                                                                'Data tankowania: ${_dateFormat.format(Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfRefuels()[index].getDataTankowania())}',
                                                            style:
                                                                kSmallTextStyleLabel,
                                                            percentageW:
                                                                screenWidth(
                                                                    100),
                                                            percentageH:
                                                                screenHeight(2),
                                                          ),
                                                          TextWidget(
                                                            text:
                                                                'Ilość zatankowanego paliwa: ${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfRefuels()[index].getAmountOfFuel().toStringAsFixed(2)} l',
                                                            style:
                                                                kSmallTextStyleLabel,
                                                            percentageW:
                                                                screenWidth(
                                                                    100),
                                                            percentageH:
                                                                screenHeight(2),
                                                          ),
                                                          TextWidget(
                                                            text:
                                                                'Przebieg od poprzedniego tankowania: ${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfRefuels()[index].getMileageFromRefueling().toStringAsFixed(2)}km',
                                                            style:
                                                                kSmallTextStyleLabel,
                                                            percentageW:
                                                                screenWidth(
                                                                    100),
                                                            percentageH:
                                                                screenHeight(2),
                                                          ),
                                                          TextWidget(
                                                            text:
                                                                'Koszt paliwa: ${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfRefuels()[index].getCost().toStringAsFixed(2)} zł',
                                                            style:
                                                                kSmallTextStyleLabel,
                                                            percentageW:
                                                                screenWidth(
                                                                    100),
                                                            percentageH:
                                                                screenHeight(2),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenHeight(1),
                                      ),
                                      TextWidget(
                                        text:
                                            'Średnie spalanie pojazdu: ${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getAverageConsumption().toStringAsFixed(2)} l/100km',
                                        style: kSmallTextStyleLabel,
                                        percentageW: screenWidth(100),
                                        percentageH: screenHeight(2),
                                      ),
                                      SizedBox(
                                        height: screenHeight(1),
                                      ),
                                      TextWidget(
                                        text:
                                            'Suma wydana na paliwo: ${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getSumOfFuelMoney().toStringAsFixed(2)} złotych',
                                        style: kSmallTextStyleLabel,
                                        percentageW: screenWidth(100),
                                        percentageH: screenHeight(2),
                                      ),
                                      SizedBox(
                                        height: screenHeight(1),
                                      ),
                                      TextWidget(
                                        text:
                                            'Suma zatankowanych litrów: ${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getSumOfFuel().toStringAsFixed(2)} litrów',
                                        style: kSmallTextStyleLabel,
                                        percentageW: screenWidth(100),
                                        percentageH: screenHeight(2),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: screenWidth(85),
                          height: screenHeight(100),
                          child: Container(
                            decoration: kBoxDecoration,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  TextWidget(
                                    text: 'Informacje o serwisach',
                                    style: kHeaderTextStyle,
                                    percentageW: screenWidth(100),
                                    percentageH: screenHeight(3),
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
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: Provider.of<CarsDatabase>(
                                                  context)
                                              .getNumberOfServices(carIndex),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return GestureDetector(
                                              onLongPress: () {
                                                Provider.of<CarsDatabase>(
                                                        context,
                                                        listen: false)
                                                    .removeService(
                                                        carIndex,
                                                        Provider.of<CarsDatabase>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .getNumberOfServices(
                                                                    carIndex) -
                                                            index);
                                              },
                                              child: SizedBox(
                                                width: screenWidth(80),
                                                height: screenHeight(100),
                                                child: ListView(
                                                  children: <Widget>[
                                                    Column(
                                                      children: <Widget>[
                                                        SizedBox(
                                                          width:
                                                              screenWidth(75),
                                                          child: Card(
                                                            color: kButtonColor,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: <
                                                                    Widget>[
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: <
                                                                        Widget>[
                                                                      TextWidget(
                                                                        text:
                                                                            '${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getListOfOptions()[0]}',
                                                                        style:
                                                                            kSmallTextStyleLabel,
                                                                        percentageW:
                                                                            screenWidth(40),
                                                                        percentageH:
                                                                            screenHeight(2),
                                                                      ),
                                                                      TextWidget(
                                                                        text:
                                                                            '${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getListOfOptions()[1]}',
                                                                        style:
                                                                            kSmallTextStyleLabel,
                                                                        percentageW:
                                                                            screenWidth(40),
                                                                        percentageH:
                                                                            screenHeight(2),
                                                                      ),
                                                                      TextWidget(
                                                                        text:
                                                                            '${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getListOfOptions()[2]}',
                                                                        style:
                                                                            kSmallTextStyleLabel,
                                                                        percentageW:
                                                                            screenWidth(40),
                                                                        percentageH:
                                                                            screenHeight(2),
                                                                      ),
                                                                      TextWidget(
                                                                        text:
                                                                            '${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getListOfOptions()[3]}',
                                                                        style:
                                                                            kSmallTextStyleLabel,
                                                                        percentageW:
                                                                            screenWidth(40),
                                                                        percentageH:
                                                                            screenHeight(2),
                                                                      ),
                                                                      TextWidget(
                                                                        text:
                                                                            '${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getListOfOptions()[4]}',
                                                                        style:
                                                                            kSmallTextStyleLabel,
                                                                        percentageW:
                                                                            screenWidth(40),
                                                                        percentageH:
                                                                            screenHeight(2),
                                                                      ),
                                                                      TextWidget(
                                                                        text:
                                                                            '${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getListOfOptions()[5]}',
                                                                        style:
                                                                            kSmallTextStyleLabel,
                                                                        percentageW:
                                                                            screenWidth(40),
                                                                        percentageH:
                                                                            screenHeight(2),
                                                                      ),
                                                                      TextWidget(
                                                                        text:
                                                                            '${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getListOfOptions()[6]}',
                                                                        style:
                                                                            kSmallTextStyleLabel,
                                                                        percentageW:
                                                                            screenWidth(40),
                                                                        percentageH:
                                                                            screenHeight(2),
                                                                      ),
                                                                      TextWidget(
                                                                        text:
                                                                            '${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getListOfOptions()[7]}',
                                                                        style:
                                                                            kSmallTextStyleLabel,
                                                                        percentageW:
                                                                            screenWidth(40),
                                                                        percentageH:
                                                                            screenHeight(2),
                                                                      ),
                                                                      TextWidget(
                                                                        text:
                                                                            '${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getListOfOptions()[8]}',
                                                                        style:
                                                                            kSmallTextStyleLabel,
                                                                        percentageW:
                                                                            screenWidth(40),
                                                                        percentageH:
                                                                            screenHeight(2),
                                                                      ),
                                                                      TextWidget(
                                                                        text:
                                                                            '${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getListOfOptions()[9]}',
                                                                        style:
                                                                            kSmallTextStyleLabel,
                                                                        percentageW:
                                                                            screenWidth(50),
                                                                        percentageH:
                                                                            screenHeight(2),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: <
                                                                        Widget>[
                                                                      Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getOilChange() ==
                                                                              true
                                                                          ? TextWidget(
                                                                              text: 'Tak',
                                                                              style: kSmallTextStyleLabel,
                                                                              percentageW: screenWidth(10),
                                                                              percentageH: screenHeight(2),
                                                                            )
                                                                          : TextWidget(
                                                                              text: 'Nie',
                                                                              style: kSmallTextStyleLabel,
                                                                              percentageW: screenWidth(10),
                                                                              percentageH: screenHeight(2),
                                                                            ),
                                                                      Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getAirFilter() ==
                                                                              true
                                                                          ? TextWidget(
                                                                              text: 'Tak',
                                                                              style: kSmallTextStyleLabel,
                                                                              percentageW: screenWidth(10),
                                                                              percentageH: screenHeight(2),
                                                                            )
                                                                          : TextWidget(
                                                                              text: 'Nie',
                                                                              style: kSmallTextStyleLabel,
                                                                              percentageW: screenWidth(10),
                                                                              percentageH: screenHeight(2),
                                                                            ),
                                                                      Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getFuelFilter() ==
                                                                              true
                                                                          ? TextWidget(
                                                                              text: 'Tak',
                                                                              style: kSmallTextStyleLabel,
                                                                              percentageW: screenWidth(10),
                                                                              percentageH: screenHeight(2),
                                                                            )
                                                                          : TextWidget(
                                                                              text: 'Nie',
                                                                              style: kSmallTextStyleLabel,
                                                                              percentageW: screenWidth(10),
                                                                              percentageH: screenHeight(2),
                                                                            ),
                                                                      Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getOilFIlter() ==
                                                                              true
                                                                          ? TextWidget(
                                                                              text: 'Tak',
                                                                              style: kSmallTextStyleLabel,
                                                                              percentageW: screenWidth(10),
                                                                              percentageH: screenHeight(2),
                                                                            )
                                                                          : TextWidget(
                                                                              text: 'Nie',
                                                                              style: kSmallTextStyleLabel,
                                                                              percentageW: screenWidth(10),
                                                                              percentageH: screenHeight(2),
                                                                            ),
                                                                      Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getCabinFilter() ==
                                                                              true
                                                                          ? TextWidget(
                                                                              text: 'Tak',
                                                                              style: kSmallTextStyleLabel,
                                                                              percentageW: screenWidth(10),
                                                                              percentageH: screenHeight(2),
                                                                            )
                                                                          : TextWidget(
                                                                              text: 'Nie',
                                                                              style: kSmallTextStyleLabel,
                                                                              percentageW: screenWidth(10),
                                                                              percentageH: screenHeight(2),
                                                                            ),
                                                                      Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getBrakeFluid() ==
                                                                              true
                                                                          ? TextWidget(
                                                                              text: 'Tak',
                                                                              style: kSmallTextStyleLabel,
                                                                              percentageW: screenWidth(10),
                                                                              percentageH: screenHeight(2),
                                                                            )
                                                                          : TextWidget(
                                                                              text: 'Nie',
                                                                              style: kSmallTextStyleLabel,
                                                                              percentageW: screenWidth(10),
                                                                              percentageH: screenHeight(2),
                                                                            ),
                                                                      Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getCoolant() ==
                                                                              true
                                                                          ? TextWidget(
                                                                              text: 'Tak',
                                                                              style: kSmallTextStyleLabel,
                                                                              percentageW: screenWidth(10),
                                                                              percentageH: screenHeight(2),
                                                                            )
                                                                          : TextWidget(
                                                                              text: 'Nie',
                                                                              style: kSmallTextStyleLabel,
                                                                              percentageW: screenWidth(10),
                                                                              percentageH: screenHeight(2),
                                                                            ),
                                                                      Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getBrakePads() ==
                                                                              true
                                                                          ? TextWidget(
                                                                              text: 'Tak',
                                                                              style: kSmallTextStyleLabel,
                                                                              percentageW: screenWidth(10),
                                                                              percentageH: screenHeight(2),
                                                                            )
                                                                          : TextWidget(
                                                                              text: 'Nie',
                                                                              style: kSmallTextStyleLabel,
                                                                              percentageW: screenWidth(10),
                                                                              percentageH: screenHeight(2),
                                                                            ),
                                                                      Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getSparkPlugs() ==
                                                                              true
                                                                          ? TextWidget(
                                                                              text: 'Tak',
                                                                              style: kSmallTextStyleLabel,
                                                                              percentageW: screenWidth(10),
                                                                              percentageH: screenHeight(2),
                                                                            )
                                                                          : TextWidget(
                                                                              text: 'Nie',
                                                                              style: kSmallTextStyleLabel,
                                                                              percentageW: screenWidth(10),
                                                                              percentageH: screenHeight(2),
                                                                            ),
                                                                      Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getTimingBelt() ==
                                                                              true
                                                                          ? TextWidget(
                                                                              text: 'Tak',
                                                                              style: kSmallTextStyleLabel,
                                                                              percentageW: screenWidth(10),
                                                                              percentageH: screenHeight(2),
                                                                            )
                                                                          : TextWidget(
                                                                              text: 'Nie',
                                                                              style: kSmallTextStyleLabel,
                                                                              percentageW: screenWidth(10),
                                                                              percentageH: screenHeight(2),
                                                                            ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height:
                                                                screenHeight(
                                                                    22),
                                                            width:
                                                                screenWidth(75),
                                                            child: Card(
                                                              color:
                                                                  kButtonColor,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: <
                                                                      Widget>[
                                                                    TextWidget(
                                                                      text:
                                                                          'Inne czynności: ',
                                                                      style:
                                                                          kSmallTextStyleLabel,
                                                                      percentageW:
                                                                          screenWidth(
                                                                              100),
                                                                      percentageH:
                                                                          screenHeight(
                                                                              2),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          screenHeight(
                                                                              1),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          screenHeight(
                                                                              15),
                                                                      child:
                                                                          ListView(
                                                                        children: <
                                                                            Widget>[
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: <Widget>[
                                                                              TextWidget(
                                                                                text: '${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getOthers()}',
                                                                                style: kSmallTextStyleLabel,
                                                                                percentageW: screenWidth(100),
                                                                                percentageH: screenHeight(2),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            TextWidget(
                                                              text:
                                                                  'Data przeprowadzenia serwisu: ${_dateFormat.format(Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getServiceDate())}',
                                                              style:
                                                                  kSmallTextStyleLabel,
                                                              percentageW:
                                                                  screenWidth(
                                                                      76),
                                                              percentageH:
                                                                  screenHeight(
                                                                      2),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  screenHeight(
                                                                      1),
                                                            ),
                                                            TextWidget(
                                                              text:
                                                                  'Data kolejnego serwisu: ${_dateFormat.format(Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getNextServiceDate())}',
                                                              style:
                                                                  kSmallTextStyleLabel,
                                                              percentageW:
                                                                  screenWidth(
                                                                      76),
                                                              percentageH:
                                                                  screenHeight(
                                                                      2),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  screenHeight(
                                                                      1),
                                                            ),
                                                            TextWidget(
                                                              text:
                                                                  'Koszt serwisu: ${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getCostOfService().toStringAsFixed(2)} złotych',
                                                              style:
                                                                  kSmallTextStyleLabel,
                                                              percentageW:
                                                                  screenWidth(
                                                                      76),
                                                              percentageH:
                                                                  screenHeight(
                                                                      2),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  screenHeight(
                                                                      1),
                                                            ),
                                                            TextWidget(
                                                              text:
                                                                  'Interwał kilometrów: ${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getServiceInterval().toStringAsFixed(2)} km',
                                                              style:
                                                                  kSmallTextStyleLabel,
                                                              percentageW:
                                                                  screenWidth(
                                                                      76),
                                                              percentageH:
                                                                  screenHeight(
                                                                      2),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  screenHeight(
                                                                      1),
                                                            ),
                                                            TextWidget(
                                                              text:
                                                                  'Wykorzystany olej: ${Provider.of<CarsDatabase>(context, listen: false).getListOfCars()[carIndex].getListOfServices()[index].getOilName()}',
                                                              style:
                                                                  kSmallTextStyleLabel,
                                                              percentageW:
                                                                  screenWidth(
                                                                      76),
                                                              percentageH:
                                                                  screenHeight(
                                                                      2),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  screenHeight(
                                                                      1),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BigBottomButtonWidget(
                  icon: Icons.arrow_back,
                  text: 'Wróć',
                  onPress: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
