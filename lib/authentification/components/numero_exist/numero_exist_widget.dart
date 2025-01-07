import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'numero_exist_model.dart';
export 'numero_exist_model.dart';

class NumeroExistWidget extends StatefulWidget {
  const NumeroExistWidget({super.key});

  @override
  State<NumeroExistWidget> createState() => _NumeroExistWidgetState();
}

class _NumeroExistWidgetState extends State<NumeroExistWidget> {
  late NumeroExistModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NumeroExistModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 309.0,
      height: 86.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).error,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.error,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 36.0,
            ),
            Text(
              'Numero de telephone déjà existant',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
