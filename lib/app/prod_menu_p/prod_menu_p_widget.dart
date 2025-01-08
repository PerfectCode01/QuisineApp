import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'prod_menu_p_model.dart';
export 'prod_menu_p_model.dart';

class ProdMenuPWidget extends StatefulWidget {
  const ProdMenuPWidget({
    super.key,
    required this.menuName,
    required this.menuId,
  });

  final String? menuName;
  final int? menuId;

  @override
  State<ProdMenuPWidget> createState() => _ProdMenuPWidgetState();
}

class _ProdMenuPWidgetState extends State<ProdMenuPWidget> {
  late ProdMenuPModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProdMenuPModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.safePop();
            },
            child: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
          ),
          title: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 10.0),
            child: Text(
              valueOrDefault<String>(
                widget.menuName,
                'name',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 30.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    'searchP',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.bottomToTop,
                        duration: Duration(milliseconds: 300),
                      ),
                    },
                  );
                },
                child: Icon(
                  Icons.search_sharp,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 28.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 15.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('Panier');
                },
                child: badges.Badge(
                  badgeContent: Text(
                    FFAppState().panier.length.toString(),
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  showBadge: true,
                  shape: badges.BadgeShape.circle,
                  badgeColor: FlutterFlowTheme.of(context).primary,
                  elevation: 4.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  position: badges.BadgePosition.topEnd(),
                  animationType: badges.BadgeAnimationType.scale,
                  toAnimate: true,
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 28.0,
                  ),
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          width: 477.0,
          height: 879.0,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(50.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 89.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 53.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: FutureBuilder<ApiCallResponse>(
                            future: GetcatalogsCall.call(
                              menuId: widget.menuId,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final listViewGetcatalogsResponse =
                                  snapshot.data!;

                              return Builder(
                                builder: (context) {
                                  final catalogs = getJsonField(
                                    listViewGetcatalogsResponse.jsonBody,
                                    r'''$''',
                                  ).toList();

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: catalogs.length,
                                    itemBuilder: (context, catalogsIndex) {
                                      final catalogsItem =
                                          catalogs[catalogsIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            _model.activeTabIndex =
                                                catalogsIndex;
                                            safeSetState(() {});
                                          },
                                          text: getJsonField(
                                            catalogsItem,
                                            r'''$.name''',
                                          ).toString(),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: catalogsIndex ==
                                                    _model.activeTabIndex
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : const Color(0xFFFFA8A8),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter Tight',
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 552.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                    child: FutureBuilder<ApiCallResponse>(
                      future: GetProductsCall.call(
                        cityId: FFAppState().selectedCityId,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        final gridViewGetProductsResponse = snapshot.data!;

                        return Builder(
                          builder: (context) {
                            final produit = GetProductsCall.produits(
                              gridViewGetProductsResponse.jsonBody,
                            ).toList().take(8).toList();

                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 0.72,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: produit.length,
                              itemBuilder: (context, produitIndex) {
                                final produitItem = produit[produitIndex];
                                return Container(
                                  width: 2000.0,
                                  height: 223.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'DetailProduit',
                                            queryParameters: {
                                              'produitId': serializeParam(
                                                getJsonField(
                                                  produitItem,
                                                  r'''$.id''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'produitImg': serializeParam(
                                                getJsonField(
                                                  produitItem,
                                                  r'''$.image''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'produitNom': serializeParam(
                                                getJsonField(
                                                  produitItem,
                                                  r'''$.nom''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'produitDesc': serializeParam(
                                                getJsonField(
                                                  produitItem,
                                                  r'''$.description''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'prodPrix': serializeParam(
                                                getJsonField(
                                                  produitItem,
                                                  r'''$.prix''',
                                                ),
                                                ParamType.double,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            getJsonField(
                                              produitItem,
                                              r'''$.image''',
                                            ).toString(),
                                            width: 200.0,
                                            height: 151.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        getJsonField(
                                          produitItem,
                                          r'''$.nom''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: getJsonField(
                                                      produitItem,
                                                      r'''$.prix''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  const TextSpan(
                                                    text: 'FC',
                                                    style: TextStyle(),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (FFAppState()
                                                        .panier
                                                        .containsMap(
                                                            produitItem) ==
                                                    false)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 8.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    icon: Icon(
                                                      Icons.add,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      FFAppState().addToPanier(
                                                          produitItem);
                                                      FFAppState()
                                                              .cardItemCount =
                                                          FFAppState()
                                                              .panier
                                                              .length;
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                if (FFAppState()
                                                        .panier
                                                        .containsMap(
                                                            produitItem) ==
                                                    true)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 8.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    icon: Icon(
                                                      Icons.remove_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      FFAppState()
                                                          .removeAtIndexFromPanier(
                                                              produitIndex);
                                                      FFAppState()
                                                              .cardItemCount =
                                                          FFAppState()
                                                              .panier
                                                              .length;
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
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
