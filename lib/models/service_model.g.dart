// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServiceModelAdapter extends TypeAdapter<ServiceModel> {
  @override
  final typeId = 2;

  @override
  ServiceModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServiceModel()
      .._oilChange = fields[0] as bool
      .._airFilter = fields[1] as bool
      .._fuelFilter = fields[2] as bool
      .._oilFilter = fields[3] as bool
      .._cabinFilter = fields[4] as bool
      .._brakeFluid = fields[5] as bool
      .._coolant = fields[6] as bool
      .._brakePads = fields[7] as bool
      .._sparkPlugs = fields[8] as bool
      .._timingBelt = fields[9] as bool
      .._others = fields[10] as String
      .._oilName = fields[11] as String
      .._mileageAtService = fields[12] as double
      .._costOfService = fields[13] as double
      .._listOfOptions = (fields[14] as List)?.cast<String>()
      .._listOfSelectedOptions = (fields[15] as List)?.cast<bool>()
      .._serviceDate = fields[16] as DateTime
      .._nextServiceDate = fields[17] as DateTime;
  }

  @override
  void write(BinaryWriter writer, ServiceModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj._oilChange)
      ..writeByte(1)
      ..write(obj._airFilter)
      ..writeByte(2)
      ..write(obj._fuelFilter)
      ..writeByte(3)
      ..write(obj._oilFilter)
      ..writeByte(4)
      ..write(obj._cabinFilter)
      ..writeByte(5)
      ..write(obj._brakeFluid)
      ..writeByte(6)
      ..write(obj._coolant)
      ..writeByte(7)
      ..write(obj._brakePads)
      ..writeByte(8)
      ..write(obj._sparkPlugs)
      ..writeByte(9)
      ..write(obj._timingBelt)
      ..writeByte(10)
      ..write(obj._others)
      ..writeByte(11)
      ..write(obj._oilName)
      ..writeByte(12)
      ..write(obj._mileageAtService)
      ..writeByte(13)
      ..write(obj._costOfService)
      ..writeByte(14)
      ..write(obj._listOfOptions)
      ..writeByte(15)
      ..write(obj._listOfSelectedOptions)
      ..writeByte(16)
      ..write(obj._serviceDate)
      ..writeByte(17)
      ..write(obj._nextServiceDate);
  }
}
