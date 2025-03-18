import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  int? carroussel = 1;

  bool onLoad = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getProducts)] action in Home widget.
  ApiCallResponse? apiResult491;
  // Stores action output result for [Backend Call - API (menus)] action in Home widget.
  ApiCallResponse? apiResultcd6;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
