import '/backend/api_requests/api_calls.dart';
import '/components/smc_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'produit_menu_widget.dart' show ProduitMenuWidget;
import 'package:flutter/material.dart';

class ProduitMenuModel extends FlutterFlowModel<ProduitMenuWidget> {
  ///  Local state fields for this page.

  bool onload = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getcatalogs)] action in ProduitMenu widget.
  ApiCallResponse? apiResultzsa;
  // Model for SMC component.
  late SmcModel smcModel;

  @override
  void initState(BuildContext context) {
    smcModel = createModel(context, () => SmcModel());
  }

  @override
  void dispose() {
    smcModel.dispose();
  }
}
