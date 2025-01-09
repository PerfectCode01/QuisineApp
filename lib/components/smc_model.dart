import '/components/menus_widget.dart';
import '/components/produit_loader_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'smc_widget.dart' show SmcWidget;
import 'package:flutter/material.dart';

class SmcModel extends FlutterFlowModel<SmcWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for menus component.
  late MenusModel menusModel;
  // Model for produitLoader component.
  late ProduitLoaderModel produitLoaderModel;

  @override
  void initState(BuildContext context) {
    menusModel = createModel(context, () => MenusModel());
    produitLoaderModel = createModel(context, () => ProduitLoaderModel());
  }

  @override
  void dispose() {
    menusModel.dispose();
    produitLoaderModel.dispose();
  }
}
