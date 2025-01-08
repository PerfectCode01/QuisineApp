import '/components/menus_widget.dart';
import '/components/produits_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'smc_widget.dart' show SmcWidget;
import 'package:flutter/material.dart';

class SmcModel extends FlutterFlowModel<SmcWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for menus component.
  late MenusModel menusModel;
  // Model for produits component.
  late ProduitsModel produitsModel;

  @override
  void initState(BuildContext context) {
    menusModel = createModel(context, () => MenusModel());
    produitsModel = createModel(context, () => ProduitsModel());
  }

  @override
  void dispose() {
    menusModel.dispose();
    produitsModel.dispose();
  }
}
