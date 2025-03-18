import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'prod_menu_p_widget.dart' show ProdMenuPWidget;
import 'package:flutter/material.dart';

class ProdMenuPModel extends FlutterFlowModel<ProdMenuPWidget> {
  ///  Local state fields for this page.

  int? currentCatalogs = 0;

  int? catalogId;

  bool onLoad = true;

  String voirheader = 'non';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getcatalogs)] action in ProdMenuP widget.
  ApiCallResponse? apiResult8vc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
