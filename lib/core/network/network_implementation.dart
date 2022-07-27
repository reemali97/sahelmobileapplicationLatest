import 'dart:convert';
import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import '../../config/app_env.dart';
import '../core.export.dart';


abstract class NetworkInterface {

  Future<ApiResponse<T>> get<T>(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        String? userToken,
      });

  Future<ApiResponse<T>> post<T>(
      String url, {
        String? data,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        String? userToken,
      });

  Future<ApiResponse<T>> delete<T>(
      String url, {
        String? data,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        String? userToken,
      });

  Future<ApiResponse<T>> put<T>(
      String url, {
        String? data,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        String? userToken,
      });

  Future<ApiResponse<T>> patch<T>(
      String url, {
        String? data,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        String? userToken,
      });
}
class NetworkInterfaceImpl implements NetworkInterface {

   Dio? _dio;
  //final AppEnvironment _appEnvironment;
  final bool enableLog;

  final Map<String, dynamic> _headers = {};

   NetworkInterfaceImpl({this.enableLog = false}) {
    _dio = Dio();
    //_dio!.options.baseUrl = ChoseEnv.getConfiguration();
    // switch (env) {
    //   case AppEnvironment.PRODUCTION:
    //     _dio!.options.baseUrl = 'http://saheldev.ai-elements.com:81/Admin';
    //     _dio!.options.headers = _headers;
    //     break;
    //   case AppEnvironment.STAGING:
    //     _dio!.options.baseUrl = 'http://saheldev.ai-elements.com:81/Admin';
    //     //_dio!.options.headers = _headers;
    //     break;
    // }
  }

  @override
  Future<ApiResponse<T>> get<T>(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        String? userToken,
      }) async {
    ApiResponse<T> _apiResponse = ApiResponse<T>();
    try {
      _handleBaseUrl();
      _requestHandler(headers, queryParameters, userToken);

      final Future<Response> getMethod = _dio!.get(
        url,
        options: Options(headers: _headers),
        queryParameters: queryParameters,
      );

      _apiResponse = await _networkMethods(method: getMethod);
      return _apiResponse;
    }



    on DioError catch (e) {
      _apiResponse.statusCode = e.response!.statusCode;
      _apiResponse.data = e.response!.data;
      _apiResponse = await _responseHandler(_apiResponse);
      throw _apiResponse;
    }
  }

  @override
  Future<ApiResponse<T>> post<T>(
      String url, {
        String? data,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        String? userToken,
      }) async {
    ApiResponse<T> _apiResponse = ApiResponse<T>();
    try {
      _handleBaseUrl();
      _requestHandler(headers, queryParameters, userToken, data: data);
      final Future<Response> postMethod = _dio!.post(
        url,
        data: data,
        options: Options(headers: _headers),
        queryParameters: queryParameters,
      );

      _apiResponse = await _networkMethods(method: postMethod);
      return _apiResponse;
    } on DioError catch (e) {
      _apiResponse.statusCode = e.response!.statusCode;
      _apiResponse.data = e.response!.data;
      _apiResponse = await _responseHandler(_apiResponse);
      throw _apiResponse;
    }
  }


  @override
  Future<ApiResponse<T>> delete<T>(
      String url, {
        String? data,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        String? userToken,
      }) async {
    ApiResponse<T> _apiResponse = ApiResponse<T>();
    try {
      _handleBaseUrl();
      _requestHandler(headers, queryParameters, userToken, data: data);

      final Future<Response> postMethod = _dio!.delete(
        url,
        data: data,
        options: Options(headers: _headers),
        queryParameters: queryParameters,
      );

      _apiResponse = await _networkMethods(method: postMethod);
      return _apiResponse;
    } on DioError catch (e) {
      _apiResponse.statusCode = e.response!.statusCode;
      _apiResponse.data = e.response!.data;
      _apiResponse = await _responseHandler(_apiResponse);
      throw _apiResponse;
    }
  }

  /// [put] Method of Network.
  ///
  /// The data and status code returned from Response saved to [ApiResponse].
  ///
  /// [put] method have 2 status:
  ///
  /// 1.Successful State:
  /// If the response is returned successfully, the [put] method will return
  /// [ApiResponse] model with needed data, statusCode of response.
  ///
  /// 2.Error State:
  /// If the response have a Network Error, the [put] method will return [ApiResponse]
  /// with (Null) data and statusCode of Response, And will throw an [Exception] also.
  ///
  @override
  Future<ApiResponse<T>> put<T>(
      String url, {
        String? data,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        String? userToken,
      }) async {
    ApiResponse<T> _apiResponse = ApiResponse<T>();
    try {
      _handleBaseUrl();
      _requestHandler(headers, queryParameters, userToken, data: data);
      final Future<Response> putMethod = _dio!.put(
        url,
        data: data,
        options: Options(headers: _headers),
        queryParameters: queryParameters,
      );

      _apiResponse = await _networkMethods(method: putMethod);
      return _apiResponse;
    } on DioError catch (e) {
      _apiResponse.statusCode = e.response!.statusCode;
      _apiResponse.data = e.response!.data;
      _apiResponse = await _responseHandler(_apiResponse);
      throw _apiResponse;
    }
  }

  /// [patch] Method of Network.
  ///
  /// The data and status code returned from Response saved to [ApiResponse].
  ///
  /// [patch] method have 2 status:
  ///
  /// 1.Successful State:
  /// If the response is returned successfully, the [patch] method will return
  /// [ApiResponse] model with needed data, statusCode of response.
  ///
  /// 2.Error State:
  /// If the response have a Network Error, the [patch] method will return [ApiResponse]
  /// with (Null) data and statusCode of Response, And will throw an [Exception] also.
  ///
  @override
  Future<ApiResponse<T>> patch<T>(
      String url, {
        String? data,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        String? userToken,
      }) async {
    ApiResponse<T> _apiResponse = ApiResponse<T>();
    try {
      _handleBaseUrl();
      _requestHandler(headers, queryParameters, userToken, data: data);
      final Future<Response> patchMethod = _dio!.patch(
        url,
        data: data,
        options: Options(headers: _headers),
        queryParameters: queryParameters,
      );

      _apiResponse = await _networkMethods(method: patchMethod);
      return _apiResponse;
    } on DioError catch (e) {
      _apiResponse.statusCode = e.response!.statusCode;
      _apiResponse.data = e.response!.data;
      _apiResponse = await _responseHandler(_apiResponse);
      throw _apiResponse;
    }
  }

  /// Generic Method of Network used for [get, post, put, delete, patch] Methods
  ///
  /// The data and status code returned from Response saved to [ApiResponse].
  ///
  /// [_networkMethods] method have 2 status:
  ///
  /// 1.Successful State:
  /// If the response is returned successfully, the [get] method will return
  /// [ApiResponse] model with needed data, statusCode of response.
  ///
  /// 2.Error State:
  /// If the response have a Network Error, the [get] method will return [ApiResponse]
  /// with (Null) data and statusCode of Response, And will throw an [Exception] also.
  ///
  Future<ApiResponse<T>> _networkMethods<T>({
    required Future<Response> method,
  }) async {
    ApiResponse<T> _apiResponse = ApiResponse<T>();
    try {
      // set the response of method [get, post, put, patch, delete] to response.
      final response = await method;
      _apiResponse.statusCode = response.statusCode;
      _apiResponse.data = response.data;
      _apiResponse = await _responseHandler(_apiResponse);

      if (enableLog) _networkLog(response);

      return _apiResponse;
    } on DioError catch (e) {
      _traceError(e);
      _apiResponse.statusCode = e.response!.statusCode;
      _apiResponse.data = e.response!.data;
      _apiResponse = await _responseHandler(_apiResponse);
      developer.log('GUBA :: DioError :: $e');
      developer.log('GUBA :: DioError :: ${e.type}');
      throw _apiResponse;
    }
  }

  Future<ApiResponse<T>> _responseHandler<T>(ApiResponse<T> response) async {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 204:
        return response;
      case 400:
        final String _errorHandler = response.data == null
            ? 'BadRequestException'
            : await _errorMessageHandler(response);
        throw Exception('unAuth');
      case 404:
        final String _error = response.data == null
            ? 'NotFoundException'
            : response.data['message_key'] == null
            ? 'NotFoundException'
            : await _errorMessageHandler(response);
        throw Exception();

      case 406:
        final String _error = response.data == null
            ? 'NotFoundException'
            : await _errorMessageHandler(response);
        throw Exception();

      case 422:
        String _error = '' ;

        if(response.data is String || response.data == null){
          _error = 'BadRequestException' ;
          throw Exception();

        }else{
          _error = await _errorMessageHandler(response) ;
          throw Exception();

        }


      case 401:
        throw 'unssssAuth';
      case 403:
        final String _error = response.data == null
            ? 'UnAuthorizationException'
            : await _errorMessageHandler(response);
        throw Exception('unAuth');
      case 500:
        throw Exception('unAuth');
      case 502:
        throw Exception('unAuth');
      default:
        final String _error = response.data == null
            ? 'SocketException'
            : await _errorMessageHandler(response);
        throw Exception('unAuth');
    }
  }

  void _requestHandler(
      Map<String, dynamic>? headers,
      Map? params,
      String? userToken, {
        String? data,
      }) {
    if (data == null) data = "";
    if (headers != null) _headers.addAll(headers);
    if (params == null) params = {"": ""};
    if (userToken != null) _headers.addAll({"x-access-token": userToken});
  }

  Future<String> _errorMessageHandler(ApiResponse response) async {
    var currentLang ='';
    final errorMessages =
    await rootBundle.loadString('assets/json/api_messages.json');
    final data = json.decode(errorMessages) as Map<String, dynamic>;
    final messageKey = response.data['message_key'];
    final message = data[messageKey][currentLang];
    return message!;
  }

  void _handleBaseUrl() {
    switch (env) {
      case AppEnvironment.PRODUCTION:
        _dio!.options.baseUrl = 'http://saheldev.ai-elements.com:81/Admin';
        break;
      case AppEnvironment.STAGING:
        _dio!.options.baseUrl = 'http://saheldev.ai-elements.com:81/Admin';
        break;
    }
  }


  void _traceError(DioError e) =>
      developer.log('________________________________________ \n'
          '- Dio [ERROR] info ==> \n'
          '- ENVIROMENT: $env\n'
          '- BASE_URL: ${e.requestOptions.baseUrl}\n'
          '- PATH: ${e.requestOptions.path}\n'
          '- Method: ${e.requestOptions.method}\n'
          '- Params: ${e.requestOptions.queryParameters}\n'
          '- Body: ${e.requestOptions.data}\n'
          '- Header: ${e.requestOptions.headers}\n'
          '- statusCode: ${e.response!.statusCode}\n'
          '- RESPONSE: ${e.response!.data} \n'
          '- stackTrace: ${e.stackTrace} \n'
          '- [END] ________________________________________');

  void _networkLog(Response response) =>
      developer.log('________________________________________\n'
          '- Dio [RESPONSE] info ==> \n'
          '- ENVIROMENT: $env\n'
          '- BASE_URL: ${response.requestOptions.baseUrl}\n'
          '- PATH: ${response.requestOptions.path}\n'
          '- Method: ${response.requestOptions.method}\n'
          '- Params: ${response.requestOptions.queryParameters}\n'
          '- Body: ${response.requestOptions.data}\n'
          '- Header: ${response.requestOptions.headers}\n'
          '- statusCode: ${response.statusCode}\n'
          '- RESPONSE: ${response.data} \n'
          '- [END] ________________________________________');



}
