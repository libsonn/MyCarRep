import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:mycar/models/refuel_model.dart';
import 'package:mycar/models/service_model.dart';
import 'package:hive/hive.dart';

part 'car_model.g.dart';

@HiveType(typeId: 0)
class CarModel {
  //Zmienne
  @HiveField(0)
  String _fuelType = 'BRAK';
  @HiveField(1)
  String _brandName = 'BRAK';
  @HiveField(2)
  String _modelName = 'BRAK';
  @HiveField(3)
  String _registrationNumber = 'BRAK';
  @HiveField(4)
  String _vinNumber = 'BRAK';
  @HiveField(5)
  String _oilName = 'BRAK';

  @HiveField(6)
  int _yearOfProduction = 2010;
  @HiveField(7)
  int _fuelIndex = 0;

  @HiveField(8)
  String _photoString;

  Image _carPhoto;

  @HiveField(9)
  double _power = 0;
  @HiveField(10)
  double _engineSize = 0;
  @HiveField(11)
  double _mileage = 0;
  @HiveField(12)
  double _sumOfFuelMoney = 0;
  @HiveField(13)
  double _averageConsumption = 0;
  @HiveField(14)
  double _sumOfFuel = 0;
  @HiveField(15)
  double _sumOfKilometersFuel = 0;
  @HiveField(16)
  double _serviceInterval = 0;
  @HiveField(17)
  double _kilometresToService = 0;

  //Daty
  @HiveField(18)
  DateTime _expOfInsurance = new DateTime(
      DateTime.now().year + 1, DateTime.now().month, DateTime.now().day);
  @HiveField(19)
  DateTime _expOfTechnicalReview = new DateTime(
      DateTime.now().year + 1, DateTime.now().month, DateTime.now().day);
  @HiveField(20)
  DateTime _nextServiceDate = new DateTime(
      DateTime.now().year + 1, DateTime.now().month, DateTime.now().day);

  //Listy
  @HiveField(21)
  List<RefuelModel> _listOfRefuels = List<RefuelModel>();
  @HiveField(22)
  List<ServiceModel> _listOfServices = List<ServiceModel>();

  //Konstruktor
  CarModel(
      {String brandName,
      String modelName,
      int yearOfProduction,
      double mileage,
      String fuelType,
      String registrationNumber,
      DateTime expOfInsurance,
      DateTime expOfTechnicalReview,
      String vinNumber,
      double power,
      double engineSize,
      int fuelIndex}) {
    this._brandName = brandName;
    this._modelName = modelName;
    this._yearOfProduction = yearOfProduction;
    this._mileage = mileage;
    this._fuelType = fuelType;
    this._registrationNumber = registrationNumber;
    this._expOfTechnicalReview = expOfTechnicalReview;
    this._expOfInsurance = expOfInsurance;
    this._vinNumber = vinNumber;
    this._power = power;
    this._engineSize = engineSize;
    this._fuelIndex = fuelIndex;
  }

  //Funkcje
  void setBrandName(String brandName) {
    this._brandName = brandName;
  }

  void setModelName(String modelName) {
    this._modelName = modelName;
  }

  void setYearOfProduction(int yearOfProduction) {
    this._yearOfProduction = yearOfProduction;
  }

  void setFuelType(String fuelType) {
    this._fuelType = fuelType;
  }

  void setFuelIndex(int fuelIndex) {
    this._fuelIndex = fuelIndex;
  }

  void setMileage(double mileage) {
    countKilometersToService(mileage);
    this._mileage = mileage;
  }

  void setRegistrationNumber(String registrationNumber) {
    this._registrationNumber = registrationNumber;
  }

  void setVINNumber(String vinNumber) {
    this._vinNumber = vinNumber;
  }

  void setPower(double power) {
    this._power = power;
  }

  void setEngineSize(double engineSize) {
    this._engineSize = engineSize;
  }

  void setExpOfTechnicalReview(DateTime expOfTechnicalReview) {
    _expOfTechnicalReview = expOfTechnicalReview;
  }

  void setExpOfInsurance(DateTime expOfInsurance) {
    _expOfInsurance = expOfInsurance;
  }

  void setNextServiceDate(DateTime serviceDate) {
    this._nextServiceDate = serviceDate;
  }

  void setOilName(String oilName) {
    this._oilName = oilName;
  }

  void setPhotoString(String photoString) {
    this._photoString = photoString;
  }

  void setCarPhoto(Image carPhoto) {
    _carPhoto = carPhoto;
  }

  void setServiceInterval(double serviceInterval) {
    this._serviceInterval = serviceInterval;
    this._kilometresToService = serviceInterval;
  }

  void countKilometersToService(double value) {
    _kilometresToService = _serviceInterval - value;
  }

  void newRefuel(RefuelModel newRefuel) {
    _listOfRefuels.add(newRefuel);
  }

  void removeRefuel(int refuelIndex) {
    int indexToChange = getNumberOfRefuels() - refuelIndex - 1;

    _sumOfFuelMoney =
        _sumOfFuelMoney - getListOfRefuels()[indexToChange].getCost();

    _sumOfFuel =
        _sumOfFuel - getListOfRefuels()[indexToChange].getAmountOfFuel();

    if (_sumOfFuelMoney < 0) {
      _sumOfFuelMoney = 0;
    }

    if (_sumOfFuel < 0) {
      _sumOfFuel = 0;
    }

    _sumOfKilometersFuel = _sumOfKilometersFuel -
        getListOfRefuels()[indexToChange].getMileageFromRefueling();

    if (_sumOfKilometersFuel != 0 && _sumOfFuel != 0) {
      _averageConsumption = (_sumOfFuel / _sumOfKilometersFuel) * 100;
    } else {
      _averageConsumption = 0;
    }

    _listOfRefuels.removeAt(refuelIndex);
  }

  void newService(ServiceModel newService) {
    _listOfServices.add(newService);
  }

  void removeService(int serviceIndex) {
    _listOfServices.removeAt(serviceIndex);
  }

  double getLastRefuelMileage() {
    if (_listOfRefuels.isNotEmpty) {
      return _listOfRefuels[_listOfRefuels.length - 1].getMileageAtRefueling();
    } else {
      return _mileage;
    }
  }

  double mileageFromRefueling(double newMileage) {
    double mileageFromRefueling = newMileage - getLastRefuelMileage();
    return mileageFromRefueling;
  }

  void addFuelMoney(double fuelMoney) {
    _sumOfFuelMoney += fuelMoney;
  }

  void countAverageConsumption(double amountOfFuelToAdd, double mileageToAdd) {
    _sumOfFuel += amountOfFuelToAdd;
    _sumOfKilometersFuel += mileageToAdd;

    if (_sumOfKilometersFuel != 0 && _sumOfFuel != 0) {
      _averageConsumption = (_sumOfFuel / _sumOfKilometersFuel) * 100;
    } else {
      _averageConsumption = 0;
    }
  }

  //Gettery
  String getBrandName() => _brandName;
  String getModelName() => _modelName;
  String getRegistrationNumber() => _registrationNumber;
  String getFuelType() => _fuelType;
  String getVINNumber() => _vinNumber;
  String getOilName() => _oilName;

  int getYearOfProduction() => _yearOfProduction;
  int getFuelIndex() => _fuelIndex;

  double getAverageConsumption() => _averageConsumption;
  double getMileage() => _mileage;
  double getSumOfFuelMoney() => _sumOfFuelMoney;
  double getSumOfFuel() => _sumOfFuel;
  double getSumOfKilometersFuel() => _sumOfKilometersFuel;
  double getPower() => _power;
  double getEngineSize() => _engineSize;
  double getServiceInterval() => _serviceInterval;
  double getKilometersToService() => _kilometresToService;

  String getPhotoString() => _photoString;

  Image getCarPhoto() => _carPhoto;

  DateTime getExpOfInsurance() => _expOfInsurance;
  DateTime getExpOfTechnicalReview() => _expOfTechnicalReview;
  DateTime getNextServiceDate() => _nextServiceDate;

  List<RefuelModel> getListOfRefuels() =>
      List<RefuelModel>.from(_listOfRefuels.reversed);

  List<ServiceModel> getListOfServices() =>
      List<ServiceModel>.from(_listOfServices.reversed);

  int getNumberOfRefuels() => _listOfRefuels.length;
  int getNumberOfServices() => _listOfServices.length;
}
