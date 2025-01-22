import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/auth/custom_auth/custom_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  QuisineAuthUser? initialUser;
  QuisineAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(QuisineAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const SpScreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const SpScreenWidget(),
        ),
        FFRoute(
          name: 'login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'signUp',
          path: '/signUp',
          builder: (context, params) => const SignUpWidget(),
        ),
        FFRoute(
          name: 'ForgotPassword',
          path: '/forgotPassword',
          builder: (context, params) => const ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'OtpCode',
          path: '/otpCode',
          builder: (context, params) => OtpCodeWidget(
            telephone: params.getParam(
              'telephone',
              ParamType.String,
            ),
            nom: params.getParam(
              'nom',
              ParamType.String,
            ),
            password: params.getParam(
              'password',
              ParamType.String,
            ),
            code: params.getParam(
              'code',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'spScreen',
          path: '/spScreen',
          builder: (context, params) => const SpScreenWidget(),
        ),
        FFRoute(
          name: 'DetailProduit',
          path: '/detailProduit',
          builder: (context, params) => DetailProduitWidget(
            produitId: params.getParam(
              'produitId',
              ParamType.String,
            ),
            produitImg: params.getParam(
              'produitImg',
              ParamType.String,
            ),
            produitNom: params.getParam(
              'produitNom',
              ParamType.String,
            ),
            produitDesc: params.getParam(
              'produitDesc',
              ParamType.String,
            ),
            prodPrix: params.getParam(
              'prodPrix',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'AdresseLiv',
          path: '/adresseLiv',
          builder: (context, params) => const AdresseLivWidget(),
        ),
        FFRoute(
          name: 'OrderHistory',
          path: '/orderHistory',
          builder: (context, params) => const OrderHistoryWidget(),
        ),
        FFRoute(
          name: 'Panier',
          path: '/panier',
          builder: (context, params) => const PanierWidget(),
        ),
        FFRoute(
          name: 'ProdMenuP',
          path: '/prodMenuP',
          builder: (context, params) => ProdMenuPWidget(
            menuName: params.getParam(
              'menuName',
              ParamType.String,
            ),
            menuId: params.getParam(
              'menuId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'Home',
          path: '/home',
          builder: (context, params) =>
              params.isEmpty ? const NavBarPage(initialPage: 'Home') : const HomeWidget(),
        ),
        FFRoute(
          name: 'searchP',
          path: '/searchP',
          builder: (context, params) => const SearchPWidget(),
        ),
        FFRoute(
          name: 'Compte',
          path: '/compte',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Compte')
              : const CompteWidget(),
        ),
        FFRoute(
          name: 'Commande',
          path: '/commande',
          builder: (context, params) => const CommandeWidget(),
        ),
        FFRoute(
          name: 'Catalogs',
          path: '/catalogs',
          builder: (context, params) => const CatalogsWidget(),
        ),
        FFRoute(
          name: 'Facturation',
          path: '/facturation',
          builder: (context, params) => FacturationWidget(
            zoneId: params.getParam(
              'zoneId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'commandeReussie',
          path: '/commandeReussie',
          builder: (context, params) => const CommandeReussieWidget(),
        ),
        FFRoute(
          name: 'SuiviedesCommandes',
          path: '/suiviedesCommandes',
          builder: (context, params) => const SuiviedesCommandesWidget(),
        ),
        FFRoute(
          name: 'ChoixVille',
          path: '/choixVille',
          builder: (context, params) => const ChoixVilleWidget(),
        ),
        FFRoute(
          name: 'Menu',
          path: '/menu',
          builder: (context, params) =>
              params.isEmpty ? const NavBarPage(initialPage: 'Menu') : const MenuWidget(),
        ),
        FFRoute(
          name: 'notifications',
          path: '/notifications',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'notifications')
              : const NotificationsWidget(),
        ),
        FFRoute(
          name: 'spScreen2',
          path: '/spScreen2',
          builder: (context, params) => const SpScreen2Widget(),
        ),
        FFRoute(
          name: 'echecCommande',
          path: '/echecCommande',
          builder: (context, params) => const EchecCommandeWidget(),
        ),
        FFRoute(
          name: 'shimmerComponent',
          path: '/shimmerComponent',
          builder: (context, params) => const ShimmerComponentWidget(),
        ),
        FFRoute(
          name: 'Home2',
          path: '/home2',
          builder: (context, params) => const Home2Widget(),
        ),
        FFRoute(
          name: 'presenteApp',
          path: '/presenteApp',
          builder: (context, params) => PresenteAppWidget(
            tel: params.getParam(
              'tel',
              ParamType.String,
            ),
            password: params.getParam(
              'password',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'OtpCodeForgot',
          path: '/otpCodeForgot',
          builder: (context, params) => OtpCodeForgotWidget(
            telephone: params.getParam(
              'telephone',
              ParamType.String,
            ),
            password: params.getParam(
              'password',
              ParamType.String,
            ),
            code: params.getParam(
              'code',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'HomeCopy',
          path: '/homeCopy',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'HomeCopy')
              : const HomeCopyWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/spScreen';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
