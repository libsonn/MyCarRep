import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mycar/constants.dart';
import 'dart:io';

import 'package:mycar/models/car_model.dart';
import 'package:mycar/models/service_model.dart';
import 'package:mycar/models/refuel_model.dart';

import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class CarsDatabase extends ChangeNotifier {
  List<CarModel> _listOfCars = [];
  Box<CarModel> carsModel;

  void savePhotoToDatabase(int carIndex, File imageFile) async {
    String photoString = base64Encode(imageFile.readAsBytesSync());

    carsModel = await Hive.openBox<CarModel>(DBFileName);
    CarModel carModel = carsModel.values.toList()[carIndex];
    carModel.setPhotoString(photoString);
    carsModel.putAt(carIndex, carModel);
  }

  void getImageFromMemory(int carIndex) {
    Image carImage =
        Image.memory(base64Decode(_listOfCars[carIndex].getPhotoString()));
    _listOfCars[carIndex].setCarPhoto(carImage);

    notifyListeners();
  }

  void getDataFromMemory() async {
    carsModel = await Hive.openBox<CarModel>(DBFileName);

    List<int> keys = carsModel.keys.cast<int>().toList();

    for (int key in keys) {
      _listOfCars.add(carsModel.get(key));
      for (CarModel car in _listOfCars) {
        if (car.getPhotoString() != null) {
          getImageFromMemory(_listOfCars.indexOf(car));
        }
      }
    }

    notifyListeners();
  }

  void cleanData() async {
    await Hive.deleteBoxFromDisk(DBFileName);
  }

  void addCar(CarModel car) async {
    _listOfCars.add(car);

    carsModel = await Hive.openBox<CarModel>(DBFileName);
    carsModel.add(car);

    notifyListeners();
  }

  void deleteCar(int carIndex) async {
    carsModel = await Hive.openBox<CarModel>(DBFileName);

    carsModel.deleteAt(carIndex);
    _listOfCars.removeAt(carIndex);

    notifyListeners();
  }

  void setPhoto(int carIndex) async {
    File _imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (_imageFile != null) {
      Image _image = Image.file(_imageFile);
      savePhotoToDatabase(carIndex, _imageFile);
      _listOfCars[carIndex].setCarPhoto(_image);
    }

    notifyListeners();
  }

  void setBrandName(String brandName, int carIndex) async {
    carsModel = await Hive.openBox<CarModel>(DBFileName);
    CarModel carModel = carsModel.values.toList()[carIndex];
    carModel.setBrandName(brandName);
    carsModel.putAt(carIndex, carModel);

    notifyListeners();
  }

  void setModelName(String modelName, int carIndex) async {
    carsModel = await Hive.openBox<CarModel>(DBFileName);
    CarModel carModel = carsModel.values.toList()[carIndex];
    carModel.setModelName(modelName);
    carsModel.putAt(carIndex, carModel);

    notifyListeners();
  }

  void setRegistrationNumber(String registrationNumber, int carIndex) async {
    carsModel = await Hive.openBox<CarModel>(DBFileName);
    CarModel carModel = carsModel.values.toList()[carIndex];
    carModel.setRegistrationNumber(registrationNumber);
    carsModel.putAt(carIndex, carModel);

    notifyListeners();
  }

  void setMileage(double mileage, int carIndex) async {
    carsModel = await Hive.openBox<CarModel>(DBFileName);
    CarModel carModel = carsModel.values.toList()[carIndex];
    carModel.setMileage(mileage);
    carsModel.putAt(carIndex, carModel);

    notifyListeners();
  }

  void steYearOfProduction(int yearOfProduction, int carIndex) async {
    carsModel = await Hive.openBox<CarModel>(DBFileName);
    CarModel carModel = carsModel.values.toList()[carIndex];
    carModel.setYearOfProduction(yearOfProduction);
    carsModel.putAt(carIndex, carModel);

    notifyListeners();
  }

  void setFuel(String fuelType, int fuelIndex, int carIndex) async {
    carsModel = await Hive.openBox<CarModel>(DBFileName);
    CarModel carModel = carsModel.values.toList()[carIndex];
    carModel.setFuelType(fuelType);
    carModel.setFuelIndex(fuelIndex);
    carsModel.putAt(carIndex, carModel);

    notifyListeners();
  }

  void setVINNumber(String vinNumber, int carIndex) async {
    carsModel = await Hive.openBox<CarModel>(DBFileName);
    CarModel carModel = carsModel.values.toList()[carIndex];
    carModel.setVINNumber(vinNumber);
    carsModel.putAt(carIndex, carModel);

    notifyListeners();
  }

  void setPower(double power, int carIndex) async {
    carsModel = await Hive.openBox<CarModel>(DBFileName);
    CarModel carModel = carsModel.values.toList()[carIndex];
    carModel.setPower(power);
    carsModel.putAt(carIndex, carModel);

    notifyListeners();
  }

  void setEngineSize(double engineSize, int carIndex) async {
    carsModel = await Hive.openBox<CarModel>(DBFileName);
    CarModel carModel = carsModel.values.toList()[carIndex];
    carModel.setEngineSize(engineSize);
    carsModel.putAt(carIndex, carModel);

    notifyListeners();
  }

  void setOilName(String oilName, int carIndex) async {
    carsModel = await Hive.openBox<CarModel>(DBFileName);
    CarModel carModel = carsModel.values.toList()[carIndex];
    carModel.setOilName(oilName);
    carsModel.putAt(carIndex, carModel);

    notifyListeners();
  }

  void setServiceInterval(double serviceInterval, int carIndex) async {
    carsModel = await Hive.openBox<CarModel>(DBFileName);
    CarModel carModel = carsModel.values.toList()[carIndex];
    carModel.setServiceInterval(serviceInterval);
    carsModel.putAt(carIndex, carModel);

    notifyListeners();
  }

  void setExpOfInsurance(DateTime expOfInsurance, int carIndex) async {
    carsModel = await Hive.openBox<CarModel>(DBFileName);
    CarModel carModel = carsModel.values.toList()[carIndex];
    carModel.setExpOfInsurance(expOfInsurance);
    carsModel.putAt(carIndex, carModel);

    notifyListeners();
  }

  void setExpOfTechnicalReview(
      DateTime expOfTechnicalReview, int carIndex) async {
    carsModel = await Hive.openBox<CarModel>(DBFileName);
    CarModel carModel = carsModel.values.toList()[carIndex];
    carModel.setExpOfTechnicalReview(expOfTechnicalReview);
    carsModel.putAt(carIndex, carModel);

    notifyListeners();
  }

  void setNextServiceDate(DateTime nextServiceDate, int carIndex) async {
    carsModel = await Hive.openBox<CarModel>(DBFileName);
    CarModel carModel = carsModel.values.toList()[carIndex];
    carModel.setNextServiceDate(nextServiceDate);
    carsModel.putAt(carIndex, carModel);

    notifyListeners();
  }

  void newRefuel(int carIndex, RefuelModel newRefuel) async {
    _listOfCars[carIndex].newRefuel(newRefuel);

    notifyListeners();
  }

  void removeRefuel(int carIndex, int refuelIndex) async {
    _listOfCars[carIndex].removeRefuel(refuelIndex - 1);

    carsModel = await Hive.openBox<CarModel>(DBFileName);
    CarModel carModel = carsModel.values.toList()[carIndex];
    carsModel.putAt(carIndex, carModel);

    notifyListeners();
  }

  void newService(ServiceModel newService, int carIndex) {
    _listOfCars[carIndex].newService(newService);

    notifyListeners();
  }

  void removeService(int carIndex, int serviceIndex) async {
    _listOfCars[carIndex].removeService(serviceIndex - 1);

    carsModel = await Hive.openBox<CarModel>(DBFileName);
    CarModel carModel = carsModel.values.toList()[carIndex];
    carsModel.putAt(carIndex, carModel);

    notifyListeners();
  }

  void countKilometersToService(int carIndex, double mileage) {
    _listOfCars[carIndex].countKilometersToService(mileage);
    notifyListeners();
  }

  void countAverageConsumption(
      int carIndex, double amountOfFuelToAdd, double mileageToAdd) {
    _listOfCars[carIndex]
        .countAverageConsumption(amountOfFuelToAdd, mileageToAdd);
    notifyListeners();
  }

  void addFuelMoney(int carIndex, double fuelMoneyToAdd) {
    _listOfCars[carIndex].addFuelMoney(fuelMoneyToAdd);

    notifyListeners();
  }

  List<CarModel> getListOfCars() => _listOfCars;

  int getNumberOfCars() => _listOfCars.length;

  int getNumberOfRefuels(int carIndex) =>
      _listOfCars[carIndex].getNumberOfRefuels();

  int getNumberOfServices(int carIndex) =>
      _listOfCars[carIndex].getNumberOfServices();

  double countAverageConsumptionFromRefuel(
          int carIndex, double amountOfFuel, double mileage) =>
      amountOfFuel / mileage * 100;

  double getMileageFromRefueling(int carIndex, double newMileage) =>
      _listOfCars[carIndex].mileageFromRefueling(newMileage);
}
