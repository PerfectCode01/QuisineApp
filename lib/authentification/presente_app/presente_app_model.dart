import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'presente_app_widget.dart' show PresenteAppWidget;
import 'package:flutter/material.dart';

class PresenteAppModel extends FlutterFlowModel<PresenteAppWidget> {
  ///  Local state fields for this page.

  int? pageIndex = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - API (loginAPI)] action in IconButton widget.
  ApiCallResponse? apiResult80i;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
