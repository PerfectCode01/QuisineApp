import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'menus_model.dart';
export 'menus_model.dart';

class MenusWidget extends StatefulWidget {
  const MenusWidget({super.key});

  @override
  State<MenusWidget> createState() => _MenusWidgetState();
}

class _MenusWidgetState extends State<MenusWidget>
    with TickerProviderStateMixin {
  late MenusModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenusModel());

    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
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
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
        ].divide(const SizedBox(width: 5.0)),
      ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
    );
  }
}
