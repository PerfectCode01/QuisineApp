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

class Paiementwidget extends StatefulWidget {
  const Paiementwidget({
    super.key,
    this.width,
    this.height,
    required this.attente,
    required this.reussi,
    required this.echec,
  });

  final double? width;
  final double? height;
  final Widget Function() attente;
  final Widget Function(String paiementId) reussi;
  final Widget Function(String paiementId) echec;

  @override
  State<Paiementwidget> createState() => _PaiementwidgetState();
}

class _PaiementwidgetState extends State<Paiementwidget> {
  Future<void> updatePaiementStatus(String docId) async {
    await FirebaseFirestore.instance
        .collection('paiement')
        .doc(docId)
        .update({'validated': false});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('paiement')
          .where('validated', isEqualTo: true)
          .where('userId', isEqualTo: FFAppState().userId)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return widget.attente();
        }

        if (snapshot.hasError) {
          FFAppState().update(() {
            FFAppState().stepPaiement = 'deux';
          });
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return widget.attente();
        }

        var paiements = snapshot.data!.docs;

        if (paiements[0]['message'] == '1') {
          return widget.echec(paiements[0].id);
        }

        if (paiements[0]['message'] == '0') {
          return widget.reussi(paiements[0].id);
        }

        return Text('fdd');
      },
    );
  }
}
