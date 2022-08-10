import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  String baseurl = "https://car-e-wallet.herokuapp.com/";
  var log = Logger();

  Future get(String url) async {
    url = Formater(url);
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return json.decode(response.body);
    }
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<http.Response> post(String url, Map<String, String> body) async {
    url = Formater(url);
    var response = await http.post(Uri.parse(url),
        headers: {"Content-type": "application/json"}, body: json.encode(body));

    return response;
  }

  String Formater(String url) {
    return baseurl + url;
  }
}
