import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pagessss/components/card_produit/card_produit_widget.dart';
import '/pagessss/components/panier_vide_c/panier_vide_c_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'panier_widget.dart' show PanierWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
