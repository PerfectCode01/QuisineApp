import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';

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
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _selectedCityId =
          await secureStorage.getString('ff_selectedCityId') ?? _selectedCityId;
    });
    await _safeInitAsync(() async {
      _userId = await secureStorage.getInt('ff_userId') ?? _userId;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _selectedCityId = '';
  String get selectedCityId => _selectedCityId;
  set selectedCityId(String value) {
    _selectedCityId = value;
    secureStorage.setString('ff_selectedCityId', value);
  }

  void deleteSelectedCityId() {
    secureStorage.delete(key: 'ff_selectedCityId');
  }

  List<dynamic> _panier = [];
  List<dynamic> get panier => _panier;
  set panier(List<dynamic> value) {
    _panier = value;
  }

  void addToPanier(dynamic value) {
    panier.add(value);
  }

  void removeFromPanier(dynamic value) {
    panier.remove(value);
  }

  void removeAtIndexFromPanier(int index) {
    panier.removeAt(index);
  }

  void updatePanierAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    panier[index] = updateFn(_panier[index]);
  }

  void insertAtIndexInPanier(int index, dynamic value) {
    panier.insert(index, value);
  }

  double _PrixTotalPanier = 0.0;
  double get PrixTotalPanier => _PrixTotalPanier;
  set PrixTotalPanier(double value) {
    _PrixTotalPanier = value;
  }

  int _cardItemCount = 0;
  int get cardItemCount => _cardItemCount;
  set cardItemCount(int value) {
    _cardItemCount = value;
  }

  int _cityId = 0;
  int get cityId => _cityId;
  set cityId(int value) {
    _cityId = value;
  }

  List<dynamic> _zones = [];
  List<dynamic> get zones => _zones;
  set zones(List<dynamic> value) {
    _zones = value;
  }

  void addToZones(dynamic value) {
    zones.add(value);
  }

  void removeFromZones(dynamic value) {
    zones.remove(value);
  }

  void removeAtIndexFromZones(int index) {
    zones.removeAt(index);
  }

  void updateZonesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    zones[index] = updateFn(_zones[index]);
  }

  void insertAtIndexInZones(int index, dynamic value) {
    zones.insert(index, value);
  }

  int _userId = 0;
  int get userId => _userId;
  set userId(int value) {
    _userId = value;
    secureStorage.setInt('ff_userId', value);
  }

  void deleteUserId() {
    secureStorage.delete(key: 'ff_userId');
  }

  String _rue = '';
  String get rue => _rue;
  set rue(String value) {
    _rue = value;
  }

  int _numero = 0;
  int get numero => _numero;
  set numero(int value) {
    _numero = value;
  }

  String _referenceLiv = '';
  String get referenceLiv => _referenceLiv;
  set referenceLiv(String value) {
    _referenceLiv = value;
  }

  List<dynamic> _propa = [];
  List<dynamic> get propa => _propa;
  set propa(List<dynamic> value) {
    _propa = value;
  }

  void addToPropa(dynamic value) {
    propa.add(value);
  }

  void removeFromPropa(dynamic value) {
    propa.remove(value);
  }

  void removeAtIndexFromPropa(int index) {
    propa.removeAt(index);
  }

  void updatePropaAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    propa[index] = updateFn(_propa[index]);
  }

  void insertAtIndexInPropa(int index, dynamic value) {
    propa.insert(index, value);
  }

  List<dynamic> _products = [];
  List<dynamic> get products => _products;
  set products(List<dynamic> value) {
    _products = value;
  }

  void addToProducts(dynamic value) {
    products.add(value);
  }

  void removeFromProducts(dynamic value) {
    products.remove(value);
  }

  void removeAtIndexFromProducts(int index) {
    products.removeAt(index);
  }

  void updateProductsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    products[index] = updateFn(_products[index]);
  }

  void insertAtIndexInProducts(int index, dynamic value) {
    products.insert(index, value);
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
