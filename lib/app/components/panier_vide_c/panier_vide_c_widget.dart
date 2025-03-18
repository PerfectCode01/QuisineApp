import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'panier_vide_c_model.dart';
export 'panier_vide_c_model.dart';

class PanierVideCWidget extends StatefulWidget {
  const PanierVideCWidget({super.key});

  @override
  State<PanierVideCWidget> createState() => _PanierVideCWidgetState();
}

class _PanierVideCWidgetState extends State<PanierVideCWidget> {
  late PanierVideCModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PanierVideCModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 50.0, 0.0, 0.0),
      child: Container(
        width: 315.0,
        height: 293.0,
        decoration: BoxDecoration(
          color: Color(0xFFF1F5F8),
        ),
        child: Visibility(
          visible: FFAppState().panier.length == 0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Votre Panier est vide ajoutez \ndes articles pour commencer à \ncommander',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Inter Tight',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
              ),
              Icon(
                Icons.shopping_cart,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 150.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
