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
    if (prod.containsKey('prix_promo')) {
      total += prod['qte'] * prod['prix_promo'];
    } else {
      total += prod['qte'] * double.parse(prod['prix']);
    }
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
      'prix_promo': item['prix_promo'] ?? 0
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

String getCityName(
  List<dynamic> cities,
  String cityId,
) {
  for (var city in cities) {
    if (city['id'] == int.tryParse(cityId)) {
      return city['name'];
    }
  }
  return '';
}

dynamic btnText(
  List<dynamic> panier,
  dynamic prod,
) {
  for (var i in panier) {
    if (i['id'] == prod['id']) {
      return "Retirer du panier";
    }
  }
  return "Ajouter au panier";
}

dynamic addRemove(
  List<dynamic> panier,
  dynamic prod,
) {
  int index = panier.indexWhere((item) => item['id'] == prod['id']);

  if (index == -1) {
    panier.add(prod);
  } else {
    panier.removeAt(index);
  }
  return prod;
}

double? convertInInteger(String prixpromo) {
  // convert the value on parameter in integer and return this
  try {
    double value = double.parse(prixpromo);
    return value;
  } catch (e) {
    return null;
  }
}
