import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  int? carroussel = 1;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getFCMToken] action in Home widget.
  String? tokenFcm;
  // Stores action output result for [Backend Call - API (getProducts)] action in Home widget.
  ApiCallResponse? apiResult491;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
