import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
