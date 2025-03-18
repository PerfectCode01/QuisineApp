import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'otp_code_widget.dart' show OtpCodeWidget;
import 'package:flutter/material.dart';

class OtpCodeModel extends FlutterFlowModel<OtpCodeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for otp1 widget.
  FocusNode? otp1FocusNode;
  TextEditingController? otp1TextController;
  String? Function(BuildContext, String?)? otp1TextControllerValidator;
  // State field(s) for otp2 widget.
  FocusNode? otp2FocusNode;
  TextEditingController? otp2TextController;
  String? Function(BuildContext, String?)? otp2TextControllerValidator;
  // State field(s) for otp3 widget.
  FocusNode? otp3FocusNode;
  TextEditingController? otp3TextController;
  String? Function(BuildContext, String?)? otp3TextControllerValidator;
  // State field(s) for otp4 widget.
  FocusNode? otp4FocusNode;
  TextEditingController? otp4TextController;
  String? Function(BuildContext, String?)? otp4TextControllerValidator;
  // State field(s) for otp5 widget.
  FocusNode? otp5FocusNode;
  TextEditingController? otp5TextController;
  String? Function(BuildContext, String?)? otp5TextControllerValidator;
  // State field(s) for otp6 widget.
  FocusNode? otp6FocusNode;
  TextEditingController? otp6TextController;
  String? Function(BuildContext, String?)? otp6TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    otp1FocusNode?.dispose();
    otp1TextController?.dispose();

    otp2FocusNode?.dispose();
    otp2TextController?.dispose();

    otp3FocusNode?.dispose();
    otp3TextController?.dispose();

    otp4FocusNode?.dispose();
    otp4TextController?.dispose();

    otp5FocusNode?.dispose();
    otp5TextController?.dispose();

    otp6FocusNode?.dispose();
    otp6TextController?.dispose();
  }
}
