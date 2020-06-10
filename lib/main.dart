import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycar/constants.dart';
import 'package:mycar/models/refuel_model.dart';
import 'package:mycar/models/cars_database.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mycar/screens/choose_car_screen.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'models/car_model.dart';
import 'models/service_model.dart';
import 'models/refuel_model.dart';

void main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('googleFonts/0FL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();

  Hive.init(directory.path);
  Hive.registerAdapter(CarModelAdapter());
  Hive.registerAdapter(RefuelModelAdapter());
  Hive.registerAdapter(ServiceModelAdapter());

  runApp(MyCarApp());
}

class MyCarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'pl_PL';
    initializeDateFormatting('pl_PL');
    return ChangeNotifierProvider(
      create: (context) {
        return CarsDatabase();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: kBackgroundColor,
          cupertinoOverrideTheme: CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
              dateTimePickerTextStyle:
                  TextStyle(color: kTextColor, fontSize: 16),
              pickerTextStyle: TextStyle(color: kTextColor, fontSize: 20),
            ),
          ),
        ),
        home: ChooseCarScreen(),
      ),
    );
  }
}
