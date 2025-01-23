import '/backend/api_requests/api_calls.dart';
import '/components/pas_de_produit_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
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

class _ProdMenuPWidgetState extends State<ProdMenuPWidget>
    with TickerProviderStateMixin {
  late ProdMenuPModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProdMenuPModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult8vc = await GetcatalogsCall.call(
        menuId: widget.menuId,
      );

      if ((_model.apiResult8vc?.succeeded ?? true)) {
        _model.catalogId = GetcatalogsCall.firstCatalogId(
          (_model.apiResult8vc?.jsonBody ?? ''),
        );
        safeSetState(() {});
        _model.onLoad = false;
        safeSetState(() {});
      }
    });

    animationsMap.addAll({
      'gridViewOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: const Color(0xFFF5F5F5),
            angle: 0.524,
          ),
        ],
      ),
    });
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
                          font: GoogleFonts.interTight(),
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
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 10.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.menuName,
                    'menu',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(),
                        fontSize: 25.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 122.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
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
                      final listViewGetcatalogsResponse = snapshot.data!;

                      return Builder(
                        builder: (context) {
                          final catalogs = getJsonField(
                            listViewGetcatalogsResponse.jsonBody,
                            r'''$''',
                          ).toList();

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount: catalogs.length,
                            separatorBuilder: (_, __) => const SizedBox(width: 15.0),
                            itemBuilder: (context, catalogsIndex) {
                              final catalogsItem = catalogs[catalogsIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.currentCatalogs = catalogsIndex;
                                  safeSetState(() {});
                                  _model.catalogId = getJsonField(
                                    catalogsItem,
                                    r'''$.id''',
                                  );
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                    border: Border.all(
                                      color: _model.currentCatalogs ==
                                              catalogsIndex
                                          ? FlutterFlowTheme.of(context).primary
                                          : Colors.white,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            getJsonField(
                                              catalogsItem,
                                              r'''$.image''',
                                            ).toString(),
                                            width: 70.0,
                                            height: 70.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          getJsonField(
                                            catalogsItem,
                                            r'''$.name''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 0.0, 10.0),
                child: Text(
                  'Vos plats préférés',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(),
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              if (_model.onLoad == true)
                Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: GridView(
                        padding: EdgeInsets.zero,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.81,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Container(
                            width: 2000.0,
                            height: 223.0,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE0E0E0),
                              boxShadow: [
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
                          ),
                          Container(
                            width: 2000.0,
                            height: 223.0,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE0E0E0),
                              boxShadow: [
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
                          ),
                          Container(
                            width: 2000.0,
                            height: 223.0,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE0E0E0),
                              boxShadow: [
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
                          ),
                          Container(
                            width: 2000.0,
                            height: 223.0,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE0E0E0),
                              boxShadow: [
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
                          ),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['gridViewOnPageLoadAnimation']!),
                    ),
                  ],
                ),
              if (_model.onLoad == false)
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final product = functions
                            .getProductCatalog(_model.catalogId!,
                                FFAppState().products.toList())
                            .toList();
                        if (product.isEmpty) {
                          return const PasDeProduitWidget();
                        }

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
                          itemCount: product.length,
                          itemBuilder: (context, productIndex) {
                            final productItem = product[productIndex];
                            return Visibility(
                              visible: (widget.menuId ==
                                      getJsonField(
                                        productItem,
                                        r'''$.menu_id''',
                                      )) &&
                                  (_model.catalogId ==
                                      getJsonField(
                                        productItem,
                                        r'''$.catalogs_id''',
                                      )),
                              child: Container(
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
                                                productItem,
                                                r'''$.id''',
                                              ).toString(),
                                              ParamType.String,
                                            ),
                                            'produitImg': serializeParam(
                                              getJsonField(
                                                productItem,
                                                r'''$.image''',
                                              ).toString(),
                                              ParamType.String,
                                            ),
                                            'produitNom': serializeParam(
                                              getJsonField(
                                                productItem,
                                                r'''$.nom''',
                                              ).toString(),
                                              ParamType.String,
                                            ),
                                            'produitDesc': serializeParam(
                                              getJsonField(
                                                productItem,
                                                r'''$.description''',
                                              ).toString(),
                                              ParamType.String,
                                            ),
                                            'prodPrix': serializeParam(
                                              getJsonField(
                                                productItem,
                                                r'''$.prix''',
                                              ),
                                              ParamType.double,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Hero(
                                        tag: getJsonField(
                                          productItem,
                                          r'''$.image''',
                                        ).toString(),
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            getJsonField(
                                              productItem,
                                              r'''$.image''',
                                            ).toString(),
                                            width: 200.0,
                                            height: 151.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      getJsonField(
                                        productItem,
                                        r'''$.nom''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(),
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
                                                    productItem,
                                                    r'''$.prix''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.inter(),
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
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (FFAppState()
                                                      .panier
                                                      .containsMap(
                                                          productItem) ==
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    FFAppState().addToPanier(
                                                        productItem);
                                                    FFAppState().cardItemCount =
                                                        FFAppState()
                                                            .panier
                                                            .length;
                                                    safeSetState(() {});
                                                  },
                                                ),
                                              if (FFAppState()
                                                      .panier
                                                      .containsMap(
                                                          productItem) ==
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    FFAppState()
                                                        .removeAtIndexFromPanier(
                                                            productIndex);
                                                    FFAppState().cardItemCount =
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
                              ),
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
    );
  }
}
