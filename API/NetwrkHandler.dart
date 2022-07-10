import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  String baseurl = "https://car-e-wallet.herokuapp.com/";
  var log = Logger();

  Future<dynamic> get(String url) async {
    url = Formater(url);
    var response = await http.get(Uri.parse(url));
    log.i(response.body);
    log.i(response.statusCode);
  }

  String Formater(String url) {
    return baseurl + url;
  }
}
