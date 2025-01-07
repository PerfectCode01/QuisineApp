// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future decrementQte(
  List<dynamic> panier,
  dynamic panierItem,
) async {
  // Add your function code here!

  // Vérifiez si la liste ou l'élément sont valides
  if (panier.isEmpty || panierItem == null) {
    debugPrint("Liste ou élément invalide !");
    return;
  }
  // Parcourir la liste pour trouver l'élément correspondant
  for (var item in panier) {
    if (item['id'] == panierItem['id'] && item['qte'] > 1) {
      // Incrémente la quantité de cet élément
      item['qte']--;
      debugPrint(
          "Quantité mise à jour pour l'élément ID: ${item['id']}, Nouvelle quantité: ${item['qte']}");

      // Si vous utilisez une variable globale App State, mettez-la à jour
      FFAppState().update(() {
        FFAppState().panier = List.from(panier); // Force la mise à jour
      });
      return; // Fin de la méthode une fois l'élément mis à jour
    }
  }

  // Si aucun élément correspondant n'a été trouvé
  debugPrint("Élément non trouvé dans la liste !");
}
