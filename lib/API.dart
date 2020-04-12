import 'dart:async';
import 'package:http/http.dart' as http;

//foi usado o ip do meu computador para rodar, substituir pelo da maquina onde será rodado
const baseUrl = "http://####:5000/";


class API {
  static Future getUsers() {
    return http.get(baseUrl);
  }
}
