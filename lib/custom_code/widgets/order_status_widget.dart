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

// Extension to capitalize the first letter of a string
extension CapitalizeExtension on String {
  String capitalize() {
    if (this.isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}

class OrderStatusWidget extends StatefulWidget {
  const OrderStatusWidget({
    super.key,
    this.width,
    this.height,
    required this.orderId,
  });

  final double? width;
  final double? height;
  final String orderId;

  @override
  State<OrderStatusWidget> createState() => _OrderStatusWidgetState();
}

class _OrderStatusWidgetState extends State<OrderStatusWidget> {
  String? orderStatus;

  final Map<String, IconData> statusIcons = {
    'en_attente': Icons.hourglass_empty,
    'en_preparation': Icons.kitchen,
    'commande_prete': Icons.check_circle,
    'servie_surplace': Icons.restaurant,
    'en_cours_de_livraison': Icons.delivery_dining,
    'livree': Icons.home,
    'achevee': Icons.done_all,
  };

  @override
  void initState() {
    super.initState();
    listenOrderStatus();
  }

  void listenOrderStatus() {
    FirebaseFirestore.instance
        .collection('orders')
        .where('orderId',
            isEqualTo: int.parse(widget.orderId)) // Filtrer par 'orderId'
        .snapshots()
        .listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final orderDoc = snapshot.docs.first;
        if (orderDoc.exists &&
            orderDoc.data() != null &&
            orderDoc.data()!.containsKey('status')) {
          setState(() {
            orderStatus = orderDoc['status'];
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: statusIcons.keys.map((status) {
          bool isActive = status == orderStatus;
          return Column(
            children: [
              Icon(
                statusIcons[status],
                color: isActive
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).secondaryText,
                size: 24,
              ),
              Text(
                status.replaceAll('_', ' ').capitalize(),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Inter',
                      color: isActive
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
