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
// import 'package:intl/intl.dart';

class Notificationss extends StatefulWidget {
  const Notificationss({super.key, this.width, this.height, this.userId});

  final double? width;
  final double? height;
  final int? userId;

  @override
  State<Notificationss> createState() => _NotificationssState();
}

class _NotificationssState extends State<Notificationss> {
  @override
  Widget build(BuildContext context) {
    final Map<String, IconData> statusIcons = {
      "En attente": Icons.hourglass_empty,
      "En préparation": Icons.build,
      "Commande prête": Icons.check_circle,
      "Servie sur place": Icons.restaurant,
      "En cours de livraison": Icons.local_shipping,
      "Livrée": Icons.inventory_2,
      "Achevée": Icons.done_all,
    };

    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection('notifications').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("Pas de nouvelles notifications."));
        }

        // Filtrer les notifications en fonction de userId
        var notifications = snapshot.data!.docs
            .where((notification) =>
                notification['userId'] == FFAppState().userId.toString())
            .toList();

        // Vérifier si FFAppState().notificationCount est différent avant de le mettre à jour
        // if (FFAppState().notificationCount != notifications.length) {
        //   setState(() {
        //     FFAppState().notificationCount = notifications.length;
        //   });
        // }

        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 8, horizontal: 8), // Ajoute un padding global
          child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              var notification = notifications[index];
              IconData icons = Icons.hourglass_empty;

              // Vérification des statuts et attribution des icônes
              icons =
                  statusIcons[notification['status']] ?? Icons.hourglass_empty;

              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 4), // Ajoute un padding entre chaque item
                child: Material(
                  color: Colors.transparent,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                          16), // Applique un padding interne au contenu
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent1,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Icon(
                              icons,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          const SizedBox(
                              width:
                                  16), // Espacement entre l'icône et le texte
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notification['title'].toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Text(
                                  notification['body'].toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                ),
                                Text(
                                  DateFormat('HH:mm').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        (notification['timestamp'] as int) *
                                            1000),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
