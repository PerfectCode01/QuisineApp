// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<NotificationStruct>> getNotificationsFromFirestore(
    int userId) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('notifications')
        // .where('userId', isEqualTo: userId) // Décommente si nécessaire
        // .orderBy('timestamp', descending: true) // Décommente si nécessaire
        .get();

    return querySnapshot.docs.map((doc) {
      return NotificationStruct.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();
  } catch (e) {
    print('Erreur lors de la récupération des notifications: $e');
    return [];
  }
}
