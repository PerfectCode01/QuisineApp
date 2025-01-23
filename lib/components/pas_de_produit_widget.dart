import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pas_de_produit_model.dart';
export 'pas_de_produit_model.dart';

class PasDeProduitWidget extends StatefulWidget {
  const PasDeProduitWidget({super.key});

  @override
  State<PasDeProduitWidget> createState() => _PasDeProduitWidgetState();
}

class _PasDeProduitWidgetState extends State<PasDeProduitWidget> {
  late PasDeProduitModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PasDeProduitModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/chariot.png',
                width: 300.0,
                height: 300.0,
                fit: BoxFit.contain,
              ),
              Text(
                'Pas de produits disponible',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      font: GoogleFonts.interTight(),
                      letterSpacing: 0.0,
                    ),
              ),
            ].divide(const SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
