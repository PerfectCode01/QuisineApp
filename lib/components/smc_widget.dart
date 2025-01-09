import '/components/menus_widget.dart';
import '/components/produit_loader_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'smc_model.dart';
export 'smc_model.dart';

class SmcWidget extends StatefulWidget {
  const SmcWidget({super.key});

  @override
  State<SmcWidget> createState() => _SmcWidgetState();
}

class _SmcWidgetState extends State<SmcWidget> with TickerProviderStateMixin {
  late SmcModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmcModel());

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0xFFF5F5F5),
            angle: 1.571,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15.0, 25.0, 15.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 50.0,
            decoration: const BoxDecoration(
              color: Color(0xFFE0E0E0),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 45.0,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  width: 1.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
            child: Container(
              width: double.infinity,
              height: 120.0,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          wrapWithModel(
            model: _model.menusModel,
            updateCallback: () => safeSetState(() {}),
            child: const MenusWidget(),
          ),
          Expanded(
            child: wrapWithModel(
              model: _model.produitLoaderModel,
              updateCallback: () => safeSetState(() {}),
              child: const ProduitLoaderWidget(),
            ),
          ),
        ],
      ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
    );
  }
}
