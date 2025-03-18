import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'facturation_mobile_widget.dart' show FacturationMobileWidget;
import 'package:flutter/material.dart';

class FacturationMobileModel extends FlutterFlowModel<FacturationMobileWidget> {
  ///  Local state fields for this component.

  String step = 'un';

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (payementMobile)] action in Button widget.
  ApiCallResponse? apiResultxyc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
