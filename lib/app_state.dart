import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _pharmacyLocations = prefs
              .getStringList('ff_pharmacyLocations')
              ?.map(latLngFromString)
              .withoutNulls ??
          _pharmacyLocations;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _type = '';
  String get type => _type;
  set type(String _value) {
    _type = _value;
  }

  Color _colorCustomer = Color(4279514276);
  Color get colorCustomer => _colorCustomer;
  set colorCustomer(Color _value) {
    _colorCustomer = _value;
  }

  Color _colorRider = Color(4279514276);
  Color get colorRider => _colorRider;
  set colorRider(Color _value) {
    _colorRider = _value;
  }

  Color _colorPharmacy = Color(4279514276);
  Color get colorPharmacy => _colorPharmacy;
  set colorPharmacy(Color _value) {
    _colorPharmacy = _value;
  }

  String _productType = '';
  String get productType => _productType;
  set productType(String _value) {
    _productType = _value;
  }

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool _value) {
    _searchActive = _value;
  }

  String _from = '';
  String get from => _from;
  set from(String _value) {
    _from = _value;
  }

  List<LatLng> _pharmacyLocations = [
    LatLng(10.6411677042254, 122.23434772829475),
    LatLng(10.643972647532555, 122.23938862541912)
  ];
  List<LatLng> get pharmacyLocations => _pharmacyLocations;
  set pharmacyLocations(List<LatLng> _value) {
    _pharmacyLocations = _value;
    prefs.setStringList(
        'ff_pharmacyLocations', _value.map((x) => x.serialize()).toList());
  }

  void addToPharmacyLocations(LatLng _value) {
    _pharmacyLocations.add(_value);
    prefs.setStringList('ff_pharmacyLocations',
        _pharmacyLocations.map((x) => x.serialize()).toList());
  }

  void removeFromPharmacyLocations(LatLng _value) {
    _pharmacyLocations.remove(_value);
    prefs.setStringList('ff_pharmacyLocations',
        _pharmacyLocations.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPharmacyLocations(int _index) {
    _pharmacyLocations.removeAt(_index);
    prefs.setStringList('ff_pharmacyLocations',
        _pharmacyLocations.map((x) => x.serialize()).toList());
  }

  void updatePharmacyLocationsAtIndex(
    int _index,
    LatLng Function(LatLng) updateFn,
  ) {
    _pharmacyLocations[_index] = updateFn(_pharmacyLocations[_index]);
    prefs.setStringList('ff_pharmacyLocations',
        _pharmacyLocations.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPharmacyLocations(int _index, LatLng _value) {
    _pharmacyLocations.insert(_index, _value);
    prefs.setStringList('ff_pharmacyLocations',
        _pharmacyLocations.map((x) => x.serialize()).toList());
  }

  DocumentReference? _pass;
  DocumentReference? get pass => _pass;
  set pass(DocumentReference? _value) {
    _pass = _value;
  }

  ItemsStruct _item = ItemsStruct.fromSerializableMap(jsonDecode('{}'));
  ItemsStruct get item => _item;
  set item(ItemsStruct _value) {
    _item = _value;
  }

  void updateItemStruct(Function(ItemsStruct) updateFn) {
    updateFn(_item);
  }

  double _totalSum = 0.0;
  double get totalSum => _totalSum;
  set totalSum(double _value) {
    _totalSum = _value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
