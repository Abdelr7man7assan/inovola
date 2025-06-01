import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'response_error.dart';

class ServicesHandler {



  static Future<dynamic> postService(
      {required String url,
        required dynamic requestBody,
        bool sendBodyAsMap = false,
        String? newToken}) async {
    try {
      Uri uri = Uri.parse(url);

      final response = await http.post(uri,
          // headers: headers,
          body: sendBodyAsMap ? requestBody : json.encode(requestBody));

      return await buildResponse(
          response: response,
          retryAfterRefreshToken: (newToken) async {
            await postService(
                url: url,
                requestBody: requestBody,
                newToken: newToken,
                sendBodyAsMap: sendBodyAsMap);
          },url: url);
    } on SocketException catch (error) {
    }
  }

  static Future<dynamic> putService(
      {required String urlSuffix,
        required dynamic requestBody,
        String? token,
        bool sendBodyAsMap = false}) async {
    try {
      Uri uri = Uri.parse( urlSuffix);

      final response = await http.put(uri,
          // headers: headers,
          body: sendBodyAsMap ? requestBody : json.encode(requestBody));

      return await buildResponse(
          response: response,
          retryAfterRefreshToken: (newToken) async {
            await putService(
                urlSuffix: urlSuffix,
                requestBody: requestBody,
                sendBodyAsMap: sendBodyAsMap,
                token: newToken);
          },url: urlSuffix);
    }catch (e){
      rethrow;
    }
  }

  static Future getServices({required String urlSuffix, String? token}) async {
    try {
      Uri uri = Uri.parse( urlSuffix);
      http.Response response =
      await http.get(uri, headers: {}).timeout(Duration(seconds: 60));
      return await buildResponse(
          response: response,
          retryAfterRefreshToken: (newToken) async {
            await getServices(urlSuffix: urlSuffix, token: newToken);
          },url:  urlSuffix);
    } on SocketException catch (error) {
    } catch (err) {
      throw err;
    }
  }

  Future<dynamic> delete({required String urlSuffix, String? token}) async {
    try {
      Uri uri = Uri.parse( urlSuffix);
      // print("delet request url $uri") ;
      final response = await http.delete(
        uri,
        // headers: headers,
      );

      return await buildResponse(
          response: response,
          retryAfterRefreshToken: (newToken) async {
            await delete(urlSuffix: urlSuffix, token: newToken);
          },url:  urlSuffix);
    } on SocketException catch (error) {
    }
  }



/*
    ------------------------------ build response -------------------------------
 */

  static Future<dynamic> buildResponse(
      {dynamic response, Function? retryAfterRefreshToken,String? url}) async {
    if (response.statusCode >= 200 && response.statusCode < 400) {
      try {
        var responseJson = json.decode(response.body);
        return responseJson;
      } catch (e) {
        return response.body;
      }
    }

    else if (response.statusCode == 400) {
      var responseJson = json.decode(response.body);
      String message = responseJson["Message"];
      throw Exception(message);
    }
    else {
      ResponseError error =
      ResponseError(code: response.statusCode, message: response.body);
      throw Exception(error.message);
    }
  }
}
