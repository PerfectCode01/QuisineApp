import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sp_screen_model.dart';
export 'sp_screen_model.dart';

class SpScreenWidget extends StatefulWidget {
  const SpScreenWidget({super.key});

  @override
  State<SpScreenWidget> createState() => _SpScreenWidgetState();
}

class _SpScreenWidgetState extends State<SpScreenWidget> {
  late SpScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 3000));

      context.pushNamed(
        'spScreen2',
        extra: <String, dynamic>{
          kTransitionInfoKey: const TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.rightToLeft,
          ),
        },
      );
    });
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
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'QUISINE',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.poppins(),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      fontSize: 45.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
