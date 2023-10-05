import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:study/Models/login_model.dart';
import 'package:study/Models/user_model.dart';
import 'package:http/http.dart' as http;


class Service {
  static Future<UserModel> fetch() async {
    var url = Uri.parse("https://reqres.in/api/users?page=2");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      
      throw Exception('Veri alınamadı: ${response.statusCode}');
    
    }
  }
  

}
class ApiService {
  static Future<Map<String, dynamic>> loginUser(String email, String password) async {
    final apiUrl = Uri.parse('https://reqres.in/api/login');
    final response = await http.post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      return responseBody;
    } else {
      throw Exception('Giriş başarısız. Lütfen e-posta ve şifreyi kontrol edin.');
    }
  }
}

