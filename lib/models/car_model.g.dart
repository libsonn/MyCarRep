// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarModelAdapter extends TypeAdapter<CarModel> {
  @override
  final typeId = 0;

  @override
  CarModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CarModel()
      .._fuelType = fields[0] as String
      .._brandName = fields[1] as String
      .._modelName = fields[2] as String
      .._registrationNumber = fields[3] as String
      .._vinNumber = fields[4] as String
      .._oilName = fields[5] as String
      .._yearOfProduction = fields[6] as int
      .._fuelIndex = fields[7] as int
      .._photoString = fields[8] as String
      .._power = fields[9] as double
      .._engineSize = fields[10] as double
      .._mileage = fields[11] as double
      .._sumOfFuelMoney = fields[12] as double
      .._averageConsumption = fields[13] as double
      .._sumOfFuel = fields[14] as double
      .._sumOfKilometersFuel = fields[15] as double
      .._serviceInterval = fields[16] as double
      .._kilometresToService = fields[17] as double
      .._expOfInsurance = fields[18] as DateTime
      .._expOfTechnicalReview = fields[19] as DateTime
      .._nextServiceDate = fields[20] as DateTime
      .._listOfRefuels = (fields[21] as List)?.cast<RefuelModel>()
      .._listOfServices = (fields[22] as List)?.cast<ServiceModel>();
  }

  @override
  void write(BinaryWriter writer, CarModel obj) {
    writer
      ..writeByte(23)
      ..writeByte(0)
      ..write(obj._fuelType)
      ..writeByte(1)
      ..write(obj._brandName)
      ..writeByte(2)
      ..write(obj._modelName)
      ..writeByte(3)
      ..write(obj._registrationNumber)
      ..writeByte(4)
      ..write(obj._vinNumber)
      ..writeByte(5)
      ..write(obj._oilName)
      ..writeByte(6)
      ..write(obj._yearOfProduction)
      ..writeByte(7)
      ..write(obj._fuelIndex)
      ..writeByte(8)
      ..write(obj._photoString)
      ..writeByte(9)
      ..write(obj._power)
      ..writeByte(10)
      ..write(obj._engineSize)
      ..writeByte(11)
      ..write(obj._mileage)
      ..writeByte(12)
      ..write(obj._sumOfFuelMoney)
      ..writeByte(13)
      ..write(obj._averageConsumption)
      ..writeByte(14)
      ..write(obj._sumOfFuel)
      ..writeByte(15)
      ..write(obj._sumOfKilometersFuel)
      ..writeByte(16)
      ..write(obj._serviceInterval)
      ..writeByte(17)
      ..write(obj._kilometresToService)
      ..writeByte(18)
      ..write(obj._expOfInsurance)
      ..writeByte(19)
      ..write(obj._expOfTechnicalReview)
      ..writeByte(20)
      ..write(obj._nextServiceDate)
      ..writeByte(21)
      ..write(obj._listOfRefuels)
      ..writeByte(22)
      ..write(obj._listOfServices);
  }
}
