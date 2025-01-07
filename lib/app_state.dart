import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _selectedCityId = '';
  String get selectedCityId => _selectedCityId;
  set selectedCityId(String value) {
    _selectedCityId = value;
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
}
