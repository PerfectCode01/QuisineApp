import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CitiesCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'cities',
      apiUrl: 'https://test.systematik.tech/api/cities',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? cityId(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? cityName(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? cities(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class MenusCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'menus',
      apiUrl: 'https://quisine.store/api/menus',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? menus(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  static List<String>? nomsMenus(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imgMenus(dynamic response) => (getJsonField(
        response,
        r'''$[:].image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetProductsCall {
  static Future<ApiCallResponse> call({
    String? cityId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getProducts',
      apiUrl: 'https://test.systematik.tech/api/products/${cityId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic produits(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class LoginAPICall {
  static Future<ApiCallResponse> call({
    String? tel = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tel": "${escapeStringForJson(tel)}",
  "password":"${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'loginAPI',
      apiUrl: 'https://test.systematik.tech/api/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
}

class ZonesCall {
  static Future<ApiCallResponse> call({
    int? cityId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'zones',
      apiUrl: 'https://test.systematik.tech/api/zones/${cityId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic zones(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  static dynamic nomZone(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
      );
  static dynamic idZone(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
      );
}

class GetcatalogsCall {
  static Future<ApiCallResponse> call({
    int? menuId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getcatalogs',
      apiUrl: 'https://test.systematik.tech/api/catalogs/${menuId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? catalogs(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  static int? firstCatalogId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[0].id''',
      ));
}

class OrderApiCall {
  static Future<ApiCallResponse> call({
    String? zoneId = '',
    int? usersId,
    String? rue = '',
    int? numero,
    String? referencei = '',
    String? comment = 'je ne l\'ai pas encore fait',
    dynamic propaDataJson,
    String? citieId = '',
  }) async {
    final propaData = _serializeJson(propaDataJson, true);
    final ffApiRequestBody = '''
{
  "zone_id": "${escapeStringForJson(zoneId)}",
  "users_id": "${usersId}",
  "rue": "${escapeStringForJson(rue)}",
  "numero": "${numero}",
  "reference": "${escapeStringForJson(referencei)}",
  "comment": "${escapeStringForJson(comment)}",
  "propaData": ${propaData},
  "citie_id": "${escapeStringForJson(citieId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'orderApi',
      apiUrl: 'https://test.systematik.tech/api/create_order',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic orders(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class SendCodeCall {
  static Future<ApiCallResponse> call({
    String? telephone = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'sendCode',
      apiUrl: 'https://test.systematik.tech/api/sendCode/${telephone}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RegisterApiCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? password = '',
    String? tel = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "password": "${escapeStringForJson(password)}",
  "tel": "${escapeStringForJson(tel)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'registerApi',
      apiUrl: 'https://test.systematik.tech/api/register',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ResetPasswordCall {
  static Future<ApiCallResponse> call({
    String? tel = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tel": "${escapeStringForJson(tel)}",
  "new_password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resetPassword',
      apiUrl: 'https://test.systematik.tech/api/reset_password',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateFcmTokenCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? fcmToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": ${escapeStringForJson(userId)},
  "fcm_token": "${escapeStringForJson(fcmToken)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateFcmToken',
      apiUrl: 'https://test.systematik.tech/api/update-fcm-token',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CommandesCall {
  static Future<ApiCallResponse> call({
    int? userId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'commandes',
      apiUrl: 'https://test.systematik.tech/api/mes_commandes/${userId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FaqCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'faq',
      apiUrl: 'https://quisine.store/api/faq',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NotificationsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'notifications',
      apiUrl:
          'https://firestore.googleapis.com/v1/projects/qusine-61a5f/databases/(default)/documents/notifications',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PayementMobileCall {
  static Future<ApiCallResponse> call({
    double? amount,
    int? userId,
    String? telephone = '',
    String? currency = '',
    String? callbackUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": ${userId},
  "amount": ${amount},
  "telephone": "${escapeStringForJson(telephone)}",
  "currency": "${escapeStringForJson(currency)}",
  "callbackUrl": "${escapeStringForJson(callbackUrl)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'payementMobile',
      apiUrl: 'https://test.systematik.tech/api/sendPaiement',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PayementMobileCopyCall {
  static Future<ApiCallResponse> call({
    double? amount,
    int? userId,
    String? telephone = '',
    String? currency = '',
    String? callbackUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": ${userId},
  "amount": ${amount},
  "telephone": "${escapeStringForJson(telephone)}",
  "currency": "${escapeStringForJson(currency)}",
  "callbackUrl": "${escapeStringForJson(callbackUrl)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'payementMobile Copy',
      apiUrl: 'https://test.systematik.tech/api/sendPaiement',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: true,
      alwaysAllowBody: false,
    );
  }
}

class GetCurrencyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getCurrency',
      apiUrl: 'https://test.systematik.tech/api/currency',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
