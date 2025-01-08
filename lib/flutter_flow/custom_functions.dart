import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
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
