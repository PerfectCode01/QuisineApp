import '/components/smc_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'shimmer_component_model.dart';
export 'shimmer_component_model.dart';

class ShimmerComponentWidget extends StatefulWidget {
  const ShimmerComponentWidget({super.key});

  @override
  State<ShimmerComponentWidget> createState() => _ShimmerComponentWidgetState();
}

class _ShimmerComponentWidgetState extends State<ShimmerComponentWidget> {
  late ShimmerComponentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShimmerComponentModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.smcModel,
            updateCallback: () => safeSetState(() {}),
            child: const SmcWidget(),
          ),
        ),
      ),
    );
  }
}
