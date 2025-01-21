import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for nameSignUp widget.
  FocusNode? nameSignUpFocusNode;
  TextEditingController? nameSignUpTextController;
  String? Function(BuildContext, String?)? nameSignUpTextControllerValidator;
  // State field(s) for numerosignUp widget.
  FocusNode? numerosignUpFocusNode;
  TextEditingController? numerosignUpTextController;
  String? Function(BuildContext, String?)? numerosignUpTextControllerValidator;
  // State field(s) for passwordSignUp widget.
  FocusNode? passwordSignUpFocusNode;
  TextEditingController? passwordSignUpTextController;
  late bool passwordSignUpVisibility;
  String? Function(BuildContext, String?)?
      passwordSignUpTextControllerValidator;
  // Stores action output result for [Backend Call - API (sendCode)] action in ButtonInscription widget.
  ApiCallResponse? apiResult6zx;

  @override
  void initState(BuildContext context) {
    passwordSignUpVisibility = false;
  }

  @override
  void dispose() {
    nameSignUpFocusNode?.dispose();
    nameSignUpTextController?.dispose();

    numerosignUpFocusNode?.dispose();
    numerosignUpTextController?.dispose();

    passwordSignUpFocusNode?.dispose();
    passwordSignUpTextController?.dispose();
  }
}
