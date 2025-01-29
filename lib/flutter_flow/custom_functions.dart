import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

double total(List<dynamic> panier) {
  double total = 0.0;
  for (var prod in panier) {
    total += prod['qte'] * double.parse(prod['prix']);
  }

  return total;
}

double calculeFraisLiv(
  List<dynamic> zones,
  String id,
) {
  for (var zone in zones) {
    if (zone['id'] == int.parse(id)) {
      return double.parse(zone['delivery_cost']);
    }
  }

  return 0.0;
}

double sommeTotal(
  double tot1,
  double liv,
) {
  return tot1 + liv;
}

dynamic getPropaData(List<dynamic> panier) {
  return panier.map((item) {
    return {
      'qte': item['qte'],
      'product_id': item['id'],
      'unit_price': item['prix'],
    };
  }).toList();
}

List<dynamic> getProductCatalog(
  int catalogId,
  List<dynamic> products,
) {
  var results =
      products.where((product) => product['catalogs_id'] == catalogId).toList();
  return results;
}

List<dynamic> searchProduct(
  String textSearch,
  List<dynamic> products,
) {
  return products.where((product) {
    // Assurez-vous que chaque produit possède une propriété 'name'
    final String productName = product['nom'].toString().toLowerCase();
    return productName.contains(textSearch.toLowerCase());
  }).toList();
}
