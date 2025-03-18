import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _selectedCityId =
          await secureStorage.getString('ff_selectedCityId') ?? _selectedCityId;
    });
    await _safeInitAsync(() async {
      _userId = await secureStorage.getInt('ff_userId') ?? _userId;
    });
    await _safeInitAsync(() async {
      _menus = (await secureStorage.getStringList('ff_menus'))?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _menus;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_user') != null) {
        try {
          _user = jsonDecode(await secureStorage.getString('ff_user') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _cities = (await secureStorage.getStringList('ff_cities'))?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _cities;
    });
    await _safeInitAsync(() async {
      _notificationCount = await secureStorage.getInt('ff_notificationCount') ??
          _notificationCount;
    });
    await _safeInitAsync(() async {
      _avenue = await secureStorage.getString('ff_avenue') ?? _avenue;
    });
    await _safeInitAsync(() async {
      _numeroAd = await secureStorage.getString('ff_numeroAd') ?? _numeroAd;
    });
    await _safeInitAsync(() async {
      _referenceAd =
          await secureStorage.getString('ff_referenceAd') ?? _referenceAd;
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

  String _tokenLogin = '';
  String get tokenLogin => _tokenLogin;
  set tokenLogin(String value) {
    _tokenLogin = value;
  }

  List<dynamic> _menus = [];
  List<dynamic> get menus => _menus;
  set menus(List<dynamic> value) {
    _menus = value;
    secureStorage.setStringList(
        'ff_menus', value.map((x) => jsonEncode(x)).toList());
  }

  void deleteMenus() {
    secureStorage.delete(key: 'ff_menus');
  }

  void addToMenus(dynamic value) {
    menus.add(value);
    secureStorage.setStringList(
        'ff_menus', _menus.map((x) => jsonEncode(x)).toList());
  }

  void removeFromMenus(dynamic value) {
    menus.remove(value);
    secureStorage.setStringList(
        'ff_menus', _menus.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromMenus(int index) {
    menus.removeAt(index);
    secureStorage.setStringList(
        'ff_menus', _menus.map((x) => jsonEncode(x)).toList());
  }

  void updateMenusAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    menus[index] = updateFn(_menus[index]);
    secureStorage.setStringList(
        'ff_menus', _menus.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInMenus(int index, dynamic value) {
    menus.insert(index, value);
    secureStorage.setStringList(
        'ff_menus', _menus.map((x) => jsonEncode(x)).toList());
  }

  dynamic _user;
  dynamic get user => _user;
  set user(dynamic value) {
    _user = value;
    secureStorage.setString('ff_user', jsonEncode(value));
  }

  void deleteUser() {
    secureStorage.delete(key: 'ff_user');
  }

  List<dynamic> _cities = [];
  List<dynamic> get cities => _cities;
  set cities(List<dynamic> value) {
    _cities = value;
    secureStorage.setStringList(
        'ff_cities', value.map((x) => jsonEncode(x)).toList());
  }

  void deleteCities() {
    secureStorage.delete(key: 'ff_cities');
  }

  void addToCities(dynamic value) {
    cities.add(value);
    secureStorage.setStringList(
        'ff_cities', _cities.map((x) => jsonEncode(x)).toList());
  }

  void removeFromCities(dynamic value) {
    cities.remove(value);
    secureStorage.setStringList(
        'ff_cities', _cities.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromCities(int index) {
    cities.removeAt(index);
    secureStorage.setStringList(
        'ff_cities', _cities.map((x) => jsonEncode(x)).toList());
  }

  void updateCitiesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    cities[index] = updateFn(_cities[index]);
    secureStorage.setStringList(
        'ff_cities', _cities.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInCities(int index, dynamic value) {
    cities.insert(index, value);
    secureStorage.setStringList(
        'ff_cities', _cities.map((x) => jsonEncode(x)).toList());
  }

  bool _fcmTokenRefresh = false;
  bool get fcmTokenRefresh => _fcmTokenRefresh;
  set fcmTokenRefresh(bool value) {
    _fcmTokenRefresh = value;
  }

  String _texte = 'Ajouter au Panier';
  String get texte => _texte;
  set texte(String value) {
    _texte = value;
  }

  int _notificationCount = 0;
  int get notificationCount => _notificationCount;
  set notificationCount(int value) {
    _notificationCount = value;
    secureStorage.setInt('ff_notificationCount', value);
  }

  void deleteNotificationCount() {
    secureStorage.delete(key: 'ff_notificationCount');
  }

  List<dynamic> _test = [];
  List<dynamic> get test => _test;
  set test(List<dynamic> value) {
    _test = value;
  }

  void addToTest(dynamic value) {
    test.add(value);
  }

  void removeFromTest(dynamic value) {
    test.remove(value);
  }

  void removeAtIndexFromTest(int index) {
    test.removeAt(index);
  }

  void updateTestAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    test[index] = updateFn(_test[index]);
  }

  void insertAtIndexInTest(int index, dynamic value) {
    test.insert(index, value);
  }

  List<dynamic> _globalNotifications = [];
  List<dynamic> get globalNotifications => _globalNotifications;
  set globalNotifications(List<dynamic> value) {
    _globalNotifications = value;
  }

  void addToGlobalNotifications(dynamic value) {
    globalNotifications.add(value);
  }

  void removeFromGlobalNotifications(dynamic value) {
    globalNotifications.remove(value);
  }

  void removeAtIndexFromGlobalNotifications(int index) {
    globalNotifications.removeAt(index);
  }

  void updateGlobalNotificationsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    globalNotifications[index] = updateFn(_globalNotifications[index]);
  }

  void insertAtIndexInGlobalNotifications(int index, dynamic value) {
    globalNotifications.insert(index, value);
  }

  String _message = '';
  String get message => _message;
  set message(String value) {
    _message = value;
  }

  bool _loadPage = true;
  bool get loadPage => _loadPage;
  set loadPage(bool value) {
    _loadPage = value;
  }

  String _avenue = '';
  String get avenue => _avenue;
  set avenue(String value) {
    _avenue = value;
    secureStorage.setString('ff_avenue', value);
  }

  void deleteAvenue() {
    secureStorage.delete(key: 'ff_avenue');
  }

  String _numeroAd = '';
  String get numeroAd => _numeroAd;
  set numeroAd(String value) {
    _numeroAd = value;
    secureStorage.setString('ff_numeroAd', value);
  }

  void deleteNumeroAd() {
    secureStorage.delete(key: 'ff_numeroAd');
  }

  String _referenceAd = '';
  String get referenceAd => _referenceAd;
  set referenceAd(String value) {
    _referenceAd = value;
    secureStorage.setString('ff_referenceAd', value);
  }

  void deleteReferenceAd() {
    secureStorage.delete(key: 'ff_referenceAd');
  }

  String _stepPaiement = 'un';
  String get stepPaiement => _stepPaiement;
  set stepPaiement(String value) {
    _stepPaiement = value;
  }

  String _zoneId = '';
  String get zoneId => _zoneId;
  set zoneId(String value) {
    _zoneId = value;
  }

  /// je l'utilise pour mettre le paiment a false dans la bdd firestore
  ///
  String _paiementId = '';
  String get paiementId => _paiementId;
  set paiementId(String value) {
    _paiementId = value;
  }

  String _payement = 'livraison';
  String get payement => _payement;
  set payement(String value) {
    _payement = value;
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
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
