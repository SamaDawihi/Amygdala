import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class RequestImageIdCall {
  static Future<ApiCallResponse> call({
    String? prompt =
        'Capture a realistic portrayal of a 21-year-old Arabian woman with medium-toned skin, black hair, and dark eyes. Depict her looking directly at the camera. Her expression should convey genuine sadness, with eyes appearing downturned and lips slightly downturned at the corners. Aim for a lifelike photo resembling a photograph, evoking authentic emotions from viewers. Emphasize natural lighting to enhance realism, with subdued colors to evoke a somber mood. Frame the subject centrally to draw focus and intensity',
    String? token = 'Token r8_P6zE7tUbMcDT8NkdhwLdZQaWtC747e71cTc1t',
  }) async {
    final ffApiRequestBody = '''
{
  "version": "39ed52f2a78e934b3ba6e2a89f5b1c712de7dfea535525255b1aa35c5565e08b",
  "input": {
    "prompt": "$prompt"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Request Image Id',
      apiUrl: 'https://api.replicate.com/v1/predictions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '$token',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class GetImagePathUsingIdCall {
  static Future<ApiCallResponse> call({
    String? token = 'Token r8_P6zE7tUbMcDT8NkdhwLdZQaWtC747e71cTc1t',
    String? id = '5wcqqgr3gdrgg0cf6k3bm70q4c',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get image path using id',
      apiUrl: 'https://api.replicate.com/v1/predictions/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '$token',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetImagePathCORSCall {
  static Future<ApiCallResponse> call({
    String? token = 'Token r8_P6zE7tUbMcDT8NkdhwLdZQaWtC747e71cTc1t',
    String? id = 'esynjddbvm7oodj7toq7cggim4',
  }) async {
    final ffApiRequestBody = '''
{
  "url": "https://api.replicate.com/v1/predictions/$id",
  "method": "GET",
  "headers": {
    "Authorization": "$token",
    "Content-Type": "application/json"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get image path CORS',
      apiUrl: 'https://cors-proxy1.p.rapidapi.com/v1',
      callType: ApiCallType.POST,
      headers: {
        'X-RapidAPI-Key': '138ea865e7mshfd34e8b2517e942p1185a4jsn63e427736190',
        'X-RapidAPI-Host': 'cors-proxy1.p.rapidapi.com',
        'content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? imagePath(dynamic response) => (getJsonField(
        response,
        r'''$.payload.output''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RequestImageIdCorsCall {
  static Future<ApiCallResponse> call({
    String? token = 'Token r8_P6zE7tUbMcDT8NkdhwLdZQaWtC747e71cTc1t',
    String? prompt = 'Girl',
  }) async {
    final ffApiRequestBody = '''
{
  "url": "https://api.replicate.com/v1/predictions",
  "method": "POST",
  "params": {},
  "data": {},
  "json_data": {
    "version": "39ed52f2a78e934b3ba6e2a89f5b1c712de7dfea535525255b1aa35c5565e08b",
    "input": {
      "prompt": "$prompt"
    }
  },
  "headers": {
    "Authorization": "$token",
    "Content-Type": "application/json"
  },
  "cookies": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Request image id Cors',
      apiUrl: 'https://cors-proxy1.p.rapidapi.com/v1',
      callType: ApiCallType.POST,
      headers: {
        'X-RapidAPI-Key': '138ea865e7mshfd34e8b2517e942p1185a4jsn63e427736190',
        'X-RapidAPI-Host': 'cors-proxy1.p.rapidapi.com',
        'content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.payload.id''',
      ));
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
