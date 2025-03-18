// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future addOdersInFireBase(
  int orderId,
  String status,
) async {
  // Add your function code here!
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  await orders
      .add({
        'orderId': orderId,
        'status': status,
      })
      .then((value) => print("Utilisateur ajouté avec l'ID: ${value.id}"))
      .catchError((error) => print("Erreur lors de l'ajout: $error"));
}
