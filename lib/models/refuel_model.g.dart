// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refuel_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RefuelModelAdapter extends TypeAdapter<RefuelModel> {
  @override
  final typeId = 1;

  @override
  RefuelModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RefuelModel()
      .._cost = fields[0] as double
      .._amountOfFuel = fields[1] as double
      .._mileageAtRefueling = fields[2] as double
      .._costOfLiter = fields[3] as double
      .._dateOfRefueling = fields[4] as DateTime
      .._mileageFromRefueling = fields[5] as double;
  }

  @override
  void write(BinaryWriter writer, RefuelModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj._cost)
      ..writeByte(1)
      ..write(obj._amountOfFuel)
      ..writeByte(2)
      ..write(obj._mileageAtRefueling)
      ..writeByte(3)
      ..write(obj._costOfLiter)
      ..writeByte(4)
      ..write(obj._dateOfRefueling)
      ..writeByte(5)
      ..write(obj._mileageFromRefueling);
  }
}
