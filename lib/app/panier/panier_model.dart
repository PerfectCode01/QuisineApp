import '/flutter_flow/flutter_flow_util.dart';
import '/pagessss/components/card_produit/card_produit_widget.dart';
import 'panier_widget.dart' show PanierWidget;
import 'package:flutter/material.dart';

class PanierModel extends FlutterFlowModel<PanierWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for cardProduit dynamic component.
  late FlutterFlowDynamicModels<CardProduitModel> cardProduitModels;

  @override
  void initState(BuildContext context) {
    cardProduitModels = FlutterFlowDynamicModels(() => CardProduitModel());
  }

  @override
  void dispose() {
    cardProduitModels.dispose();
  }
}
