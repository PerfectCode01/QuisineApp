import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'reussi_model.dart';
export 'reussi_model.dart';

class ReussiWidget extends StatefulWidget {
  const ReussiWidget({
    super.key,
    required this.paimentId,
  });

  final String? paimentId;

  @override
  State<ReussiWidget> createState() => _ReussiWidgetState();
}

class _ReussiWidgetState extends State<ReussiWidget> {
  late ReussiModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReussiModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultoai = await OrderApiCall.call(
        zoneId: FFAppState().zoneId,
        usersId: FFAppState().userId,
        rue: FFAppState().rue,
        numero: FFAppState().numero,
        referencei: FFAppState().referenceLiv,
        comment: 'merci',
        propaDataJson: functions.getPropaData(FFAppState().panier.toList()),
        citieId: FFAppState().selectedCityId,
      );

      if ((_model.apiResultoai?.succeeded ?? true)) {
        context.goNamed(
          CommandeReussieWidget.routeName,
          queryParameters: {
            'orderId': serializeParam(
              getJsonField(
                (_model.apiResultoai?.jsonBody ?? ''),
                r'''$.Order.id''',
              ),
              ParamType.int,
            ),
            'statut': serializeParam(
              getJsonField(
                (_model.apiResultoai?.jsonBody ?? ''),
                r'''$.Order.status''',
              ).toString().toString(),
              ParamType.String,
            ),
            'products': serializeParam(
              getJsonField(
                (_model.apiResultoai?.jsonBody ?? ''),
                r'''$.propa''',
                true,
              ),
              ParamType.JSON,
              isList: true,
            ),
          }.withoutNulls,
        );

        FFAppState().panier = [];
        safeSetState(() {});
        await actions.updatePaiementOnFirebase(
          widget.paimentId!,
        );
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Suivie de la transaction',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Lato',
                  fontSize: 25.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          RichText(
            textScaler: MediaQuery.of(context).textScaler,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Commande passé avec succès',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                )
              ],
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Lottie.asset(
            'assets/jsons/Animation_-_1742215406552.json',
            width: 200.0,
            height: 200.0,
            fit: BoxFit.contain,
            animate: true,
          ),
        ],
      ),
    );
  }
}
