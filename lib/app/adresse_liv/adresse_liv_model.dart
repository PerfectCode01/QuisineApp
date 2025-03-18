import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'adresse_liv_widget.dart' show AdresseLivWidget;
import 'package:flutter/material.dart';

class AdresseLivModel extends FlutterFlowModel<AdresseLivWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Avenue widget.
  FocusNode? avenueFocusNode;
  TextEditingController? avenueTextController;
  String? Function(BuildContext, String?)? avenueTextControllerValidator;
  // State field(s) for Numero widget.
  FocusNode? numeroFocusNode;
  TextEditingController? numeroTextController;
  String? Function(BuildContext, String?)? numeroTextControllerValidator;
  // State field(s) for ReferenceLiv widget.
  FocusNode? referenceLivFocusNode;
  TextEditingController? referenceLivTextController;
  String? Function(BuildContext, String?)? referenceLivTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    avenueFocusNode?.dispose();
    avenueTextController?.dispose();

    numeroFocusNode?.dispose();
    numeroTextController?.dispose();

    referenceLivFocusNode?.dispose();
    referenceLivTextController?.dispose();
  }
}
