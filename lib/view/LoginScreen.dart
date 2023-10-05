// LoginScreen.dart
// ignore_for_file: use_build_context_synchronously, prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; // shared_preferences ekledik
import 'package:study/view/view_home.dart';

import '../service/service.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> authenticateUser(BuildContext context) async {
    try {
      final response = await ApiService.loginUser(emailController.text, passwordController.text);

      if (response.containsKey("token")) {
        // Token'i alın ve işlemleri gerçekleştirin
        // Örnek: SharedPreferences'e kaydedebilirsiniz

        // Ana sayfaya yönlendirin
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Hata'),
              content: Text('Giriş başarısız. Lütfen e-posta ve şifreyi kontrol edin.'),
              actions: <Widget>[
                TextButton(
                  child: Text('Kapat'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      // Hata durumunu işle
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Hata'),
            content: Text(error.toString()),
            actions: <Widget>[
              TextButton(
                child: Text('Kapat'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Arka plan resmi
          Image.asset(
            'assets/ana2.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
         

         
          Positioned(
            right: 10,
            left: 10,
            top: 110,
            child: Image.asset(
              'assets/dj.png', 
              width: 200, 
              height: 200,
            ),
          ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Kullanıcı adı ve şifre alanları
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: Colors.white,
                      hintText: 'Kullanıcı Adı Giriniz',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: 'Kullanıcı Adı',
                      labelStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.black87,
                      filled: true,
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      prefixIconColor: Colors.white,
                      hintText: 'Şifre',
                      labelText: 'Şifre',
                      labelStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.black87,
                      filled: true,
                    ),
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                  ),
                ),
                // Giriş düğmesi
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.black87),
                  ),
                 onPressed: () {
                  authenticateUser(context);
  
},
                  child: Text('Giriş Yap'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}

