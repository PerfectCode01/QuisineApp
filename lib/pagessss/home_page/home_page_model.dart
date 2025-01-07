import '/flutter_flow/flutter_flow_util.dart';
import '/pagessss/components/headers/headers_widget.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Headers component.
  late HeadersModel headersModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    headersModel = createModel(context, () => HeadersModel());
  }

  @override
  void dispose() {
    headersModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
