import 'package:hive/hive.dart';

part 'refuel_model.g.dart';

@HiveType(typeId: 1)
class RefuelModel {
  //Zmienne
  @HiveField(0)
  double _cost;
  @HiveField(1)
  double _amountOfFuel;
  @HiveField(2)
  double _mileageAtRefueling;
  @HiveField(3)
  double _costOfLiter;
  @HiveField(4)
  DateTime _dateOfRefueling;
  @HiveField(5)
  double _mileageFromRefueling;

  //Konstruktor
  RefuelModel(
      {double cost,
      double amountOfFuel,
      double mileageFromRefueling,
      double mileageAtRefueling,
      double costOfLiter,
      DateTime dateOfRefueling}) {
    this._cost = cost;
    this._amountOfFuel = amountOfFuel;
    this._mileageFromRefueling = mileageFromRefueling;
    this._mileageAtRefueling = mileageAtRefueling;
    this._costOfLiter = costOfLiter;
    this._dateOfRefueling = dateOfRefueling;
  }

  //Gettery
  double getCostOfLiter() => _costOfLiter;
  double getMileageAtRefueling() => _mileageAtRefueling;
  double getAmountOfFuel() => _amountOfFuel;
  double getCost() => _cost;
  double getMileageFromRefueling() => _mileageFromRefueling;

  DateTime getDataTankowania() => _dateOfRefueling;
}
