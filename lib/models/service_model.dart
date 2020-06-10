import 'package:hive/hive.dart';

part 'service_model.g.dart';

@HiveType(typeId: 2)
class ServiceModel {
  //Zmienne
  @HiveField(0)
  bool _oilChange = false;
  @HiveField(1)
  bool _airFilter = false;
  @HiveField(2)
  bool _fuelFilter = false;
  @HiveField(3)
  bool _oilFilter = false;
  @HiveField(4)
  bool _cabinFilter = false;
  @HiveField(5)
  bool _brakeFluid = false;
  @HiveField(6)
  bool _coolant = false;
  @HiveField(7)
  bool _brakePads = false;
  @HiveField(8)
  bool _sparkPlugs = false;
  @HiveField(9)
  bool _timingBelt = false;

  @HiveField(10)
  String _others = 'BRAK';
  @HiveField(11)
  String _oilName = 'BRAK';
  @HiveField(12)
  double _mileageAtService = 0;
  @HiveField(13)
  double _costOfService = 0;

  //Listy
  @HiveField(14)
  List<String> _listOfOptions = [
    'Olej',
    'Filtr powietrza',
    'Filtr paliwa',
    'Filtr oleju',
    'Filtr kabinowy',
    'Płyn hamulcowy',
    'Płyn chłodniczy',
    'Klocki hamulcowe',
    'Świece',
    'Pasek rozrządu',
  ];
  @HiveField(15)
  List<bool> _listOfSelectedOptions = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  //Daty
  @HiveField(16)
  DateTime _serviceDate;
  @HiveField(17)
  DateTime _nextServiceDate;

  ServiceModel();

  //Konstruktor parametryczny
  ServiceModel.parametric({
    bool oilChange,
    bool airFilter,
    bool fuelFilter,
    bool oilFilter,
    bool cabinFilter,
    bool brakeFluid,
    bool coolant,
    bool brakePads,
    bool sparkPlugs,
    bool timingBelt,
    String others,
    String oilName,
    double mileageAtService,
    double costOfService,
    DateTime serviceDate,
    DateTime nextServiceDate,
  }) {
    this._oilChange = oilChange;
    this._airFilter = airFilter;
    this._fuelFilter = fuelFilter;
    this._oilFilter = oilFilter;
    this._cabinFilter = cabinFilter;
    this._brakeFluid = brakeFluid;
    this._coolant = coolant;
    this._brakePads = brakePads;
    this._sparkPlugs = sparkPlugs;
    this._timingBelt = timingBelt;
    this._others = others;
    this._oilName = oilName;

    this._mileageAtService = mileageAtService;
    this._costOfService = costOfService;
    this._serviceDate = serviceDate;
    this._nextServiceDate = nextServiceDate;
  }

  //Gettery
  bool getTimingBelt() => _timingBelt;
  bool getSparkPlugs() => _sparkPlugs;
  bool getBrakePads() => _brakePads;
  bool getCoolant() => _coolant;
  bool getBrakeFluid() => _brakeFluid;
  bool getCabinFilter() => _cabinFilter;
  bool getOilFIlter() => _oilFilter;
  bool getFuelFilter() => _fuelFilter;
  bool getAirFilter() => _airFilter;
  bool getOilChange() => _oilChange;

  String getOilName() => _oilName;
  String getOthers() => _others;

  double getCostOfService() => _costOfService;
  double getMileageAtService() => _mileageAtService;

  List<String> getListOfOptions() => _listOfOptions;
  List<bool> getListOfSelectedOptions() => _listOfSelectedOptions;

  DateTime getServiceDate() => _serviceDate;
  DateTime getNextServiceDate() => _nextServiceDate;
}
