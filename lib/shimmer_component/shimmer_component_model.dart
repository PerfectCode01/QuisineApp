import '/components/smc_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'shimmer_component_widget.dart' show ShimmerComponentWidget;
import 'package:flutter/material.dart';

class ShimmerComponentModel extends FlutterFlowModel<ShimmerComponentWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SMC component.
  late SmcModel smcModel;

  @override
  void initState(BuildContext context) {
    smcModel = createModel(context, () => SmcModel());
  }

  @override
  void dispose() {
    smcModel.dispose();
  }
}
