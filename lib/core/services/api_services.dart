import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_tech/core/services/api_urls.dart';
import 'package:todo_tech/ui/constants/app_strings.dart';

class ApiServices {
  String _url(endpoint, baseUrl) => endpoint.startsWith('https')
      ? endpoint
      : '$baseUrl$endpoint${endpoint.contains('?') ? '' : '/'}';

  final _timeoutDuration = Duration(seconds: 3);

  dynamic get(endpoint, {String token}) async {
    try {
      final http.Response response = await http
          .get(_url(endpoint, base_url),
              headers: await _getHeader(token: token))
          .timeout(_timeoutDuration);
      return _returnResponse(response);
    } on SocketException {
      throw Exception(err_no_internet);
    }
  }

  dynamic post(endpoint, {data, String token}) async {
    try {
      final http.Response response = await http.Client()
          .post(
            _url(endpoint, base_url),
            body: json.encode(data),
            headers: await _getHeader(token: token),
          )
          .timeout(_timeoutDuration);
      return _returnResponse(response);
    } on SocketException {
      throw Exception(err_no_internet);
    }
  }

  dynamic _getHeader({String token}) async {
    final header = {"Content-Type": "application/json"};
    if (token != null) {
      header[HttpHeaders.authorizationHeader] = "Bearer $token";
    }
    return header;
  }

  dynamic _returnResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body.toString());
        break;
      case 400:
        return Exception('Error 400');
        break;
      case 401:
        return Exception('Error 401');
        break;
      case 403:
        return Exception('Error 403');
        break;
      case 500:
      default:
        return Exception('Error 500');
    }
  }
}
