import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'produits_model.dart';
export 'produits_model.dart';

class ProduitsWidget extends StatefulWidget {
  const ProduitsWidget({super.key});

  @override
  State<ProduitsWidget> createState() => _ProduitsWidgetState();
}

class _ProduitsWidgetState extends State<ProduitsWidget>
    with TickerProviderStateMixin {
  late ProduitsModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProduitsModel());

    animationsMap.addAll({
      'gridViewOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            color: const Color(0xFFF5F5F5),
            angle: 0.524,
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
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
      child: GridView(
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.72,
        ),
        scrollDirection: Axis.vertical,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0xFFE3DBDB),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0xFFE3DBDB),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0xFFE3DBDB),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0xFFE3DBDB),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ],
      ).animateOnPageLoad(animationsMap['gridViewOnPageLoadAnimation']!),
    );
  }
}
