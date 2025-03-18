// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

class InitNotifications extends StatefulWidget {
  const InitNotifications({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  State<InitNotifications> createState() => _InitNotificationsState();
}

class _InitNotificationsState extends State<InitNotifications> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection('notifications').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink(); // Évite une erreur si pas de données
        }

        FFAppState().globalNotifications = snapshot.data!.docs
            .where((notification) =>
                notification['userId'] == FFAppState().userId.toString())
            .toList();

        // Mettre à jour FFAppState en dehors de `build`
        WidgetsBinding.instance.addPostFrameCallback((_) {
          FFAppState().notificationCount =
              FFAppState().globalNotifications.length;
          // FFAppState().globalNotifications = notifications.toList();

          FFAppState().globalNotifications;
          FFAppState().update(() {}); // Force la mise à jour du badge
        });

        return const SizedBox.shrink(); // Widget invisible
      },
    );
  }
}
