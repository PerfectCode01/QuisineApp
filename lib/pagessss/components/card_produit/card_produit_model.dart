import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'card_produit_widget.dart' show CardProduitWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardProduitModel extends FlutterFlowModel<CardProduitWidget> {
  ///  Local state fields for this component.

  double offsetX = 0.0;

  double? somme = 0.0;

  int? qte = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
