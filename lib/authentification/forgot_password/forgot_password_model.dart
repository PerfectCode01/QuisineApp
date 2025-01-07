import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'forgot_password_widget.dart' show ForgotPasswordWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPasswordModel extends FlutterFlowModel<ForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for numeroResetP widget.
  FocusNode? numeroResetPFocusNode;
  TextEditingController? numeroResetPTextController;
  String? Function(BuildContext, String?)? numeroResetPTextControllerValidator;
  // State field(s) for MotDePasseResetP widget.
  FocusNode? motDePasseResetPFocusNode;
  TextEditingController? motDePasseResetPTextController;
  String? Function(BuildContext, String?)?
      motDePasseResetPTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    numeroResetPFocusNode?.dispose();
    numeroResetPTextController?.dispose();

    motDePasseResetPFocusNode?.dispose();
    motDePasseResetPTextController?.dispose();
  }
}
