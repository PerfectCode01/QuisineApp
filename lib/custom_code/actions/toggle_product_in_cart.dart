// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future toggleProductInCart(
  List<dynamic>? panier,
  dynamic prod,
) async {
  // Add your function code here!
  // Si panier est null, on initialise une liste vide
  panier ??= [];

  int index = panier.indexWhere((item) => item['id'] == prod['id']);

  if (index != -1) {
    panier.removeAt(index); // Retire le produit s'il est déjà dans le panier
  } else {
    panier.add(prod); // Ajoute le produit s'il n'est pas encore dedans
  }

  FFAppState().panier = List.from(panier); // ✅ Met à jour App State
}
