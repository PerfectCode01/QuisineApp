import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'echec_commande_model.dart';
export 'echec_commande_model.dart';

class EchecCommandeWidget extends StatefulWidget {
  /// echec de la commande
  const EchecCommandeWidget({super.key});

  @override
  State<EchecCommandeWidget> createState() => _EchecCommandeWidgetState();
}

class _EchecCommandeWidgetState extends State<EchecCommandeWidget> {
  late EchecCommandeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EchecCommandeModel());
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          actions: [
            FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).alternate,
              borderRadius: 12.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              fillColor: FlutterFlowTheme.of(context).primaryBackground,
              icon: Icon(
                Icons.close_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 12.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              1.0,
                            ),
                            spreadRadius: 0.0,
                          )
                        ],
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Container(
                                width: 120.0,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent3,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).accent3,
                                    width: 4.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: Container(
                                    width: 140.0,
                                    height: 140.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).error,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        width: 4.0,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.error_outline,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 64.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Text(
                                'Échec!',
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      font: GoogleFonts.interTight(),
                                      color: FlutterFlowTheme.of(context).error,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Text(
                                'Votre commande n\'a pas pu être traitée',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: GoogleFonts.inter(),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Text(
                                'Veuillez vérifier votre connexion internet et réessayer.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Divider(
                              height: 44.0,
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Réessayer',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 48.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(),
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Retour',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 48.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ].divide(const SizedBox(height: 24.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
