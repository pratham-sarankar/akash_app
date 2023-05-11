import 'dart:io';

import 'package:akash/app/data/repositories/auth_repository.dart';
import 'package:akash/app/data/services/auth_service.dart';
import 'package:akash/app/data/services/toast_service.dart';
import 'package:akash/app/interfaces/custom_exception/api_exception.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

abstract class Provider<T> extends GetConnect {
  final String path;

  Provider({required this.path});

  @override
  void onInit() {
    var host = dotenv.env['HOST'];
    httpClient.baseUrl = "$host$path";
    httpClient.maxAuthRetries = 1;
    httpClient.addRequestModifier<Object?>((request) async {
      Request updatedRequest = await authenticator(request);
      return updatedRequest;
    });
    httpClient.addAuthenticator<Object?>((request) async {
      return await _verifyToken(await authenticator(request));
    });
    super.onInit();
  }

  Future<Request> authenticator(Request request);

  Future insert(T value);

  Future<List<T>> fetch({
    int limit = 100,
    int offset = 0,
    Map<String, dynamic> queries = const {},
  });

  Future<T> fetchOne(int id);

  Future update(T value);

  Future destroy(T value);

  Future destroyMany(List<int> ids);

  @override
  Future<Response<T>> get<T>(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query,
      Decoder<T>? decoder}) async {
    Response<T> response = await super.get<T>(url,
        headers: headers,
        query: query,
        decoder: decoder,
        contentType: contentType);
    await _verifyStatus(response, [HttpStatus.ok]);
    return response;
  }

  @override
  Future<Response<T>> post<T>(String? url, body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) async {
    Response<T> response = await super.post(
      url,
      body,
      contentType: contentType,
      headers: headers,
      query: query,
      decoder: decoder,
      uploadProgress: uploadProgress,
    );
    await _verifyStatus(response, [HttpStatus.ok, HttpStatus.created]);
    return response;
  }

  @override
  Future<Response<T>> put<T>(String url, body,
      {String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress}) async {
    Response<T> response = await super.put(url, body,
        contentType: contentType,
        headers: headers,
        query: query,
        decoder: decoder,
        uploadProgress: uploadProgress);
    await _verifyStatus(response, [HttpStatus.ok]);
    return response;
  }

  @override
  Future<Response<T>> delete<T>(String url,
      {Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query,
      Decoder<T>? decoder}) async {
    Response<T> response = await super.delete(url,
        headers: headers,
        contentType: contentType,
        query: query,
        decoder: decoder);
    await _verifyStatus(response, [HttpStatus.ok, HttpStatus.accepted]);
    return response;
  }

  Future _verifyStatus(Response response, List<int> allowedStatuses) async {
    print("${response.statusCode} - ${response.body}");
    var code = response.body?['data']?['code'];
    if (code=="invalid_token"||code=="expired_token") {
      await Get.find<AuthService>().logout();
      return;
    }
    if (!allowedStatuses.contains(response.statusCode)) {
      final message = (response.body as Map)["message"];
      Get.find<ToastService>().showErrorMessage(message);
      throw ApiException(
        status: response.statusCode ?? HttpStatus.internalServerError,
        message: message,
      );
    }
  }

  Future<Request> _verifyToken(Request request) async {
    final headers = request.headers;
    //If headers is null or empty, return the request
    if (!headers.containsKey('Authorization') &&
        !headers.containsKey('authorization')) {
      return request;
    }

    //Check is the token is expired
    if (!_isTokenExpired(headers)) {
      return request;
    }
    final accessToken = await Get.find<AuthRepository>().refreshAccessToken();
    if (accessToken == null) {
      return request;
    }
    final newHeaders = Map<String, String>.from(headers)
      ..remove('authorization')
      ..remove('Authorization')
      ..['Authorization'] = accessToken;
    return request.copyWith(headers: newHeaders);
  }

  bool _isTokenExpired(Map<String, String> headers) {
    // Extract the Authorization header from headers
    final String? authHeader =
        headers['Authorization'] ?? headers['authorization'];

    // Check if the Authorization header is present and starts with 'Bearer'
    if (authHeader == null || !authHeader.startsWith('Bearer ')) {
      return true;
    }

    // Extract the token from the Authorization header
    final String token = authHeader.substring(7);

    try {
      // Decode the token using jwt_decoder package
      final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      // Check if the token has expired
      if (decodedToken['exp'] != null &&
          DateTime.fromMillisecondsSinceEpoch(decodedToken['exp'] * 1000)
              .isBefore(DateTime.now())) {
        return true;
      }

      // Token is not expired
      return false;
    } catch (e) {
      // Token is invalid
      return true;
    }
  }
}
