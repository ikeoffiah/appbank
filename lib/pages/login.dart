import 'package:bankapp/pages/register.dart';
import 'package:bankapp/styles/colors.dart';
import 'package:bankapp/styles/text.dart';
import 'package:bankapp/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:bankapp/models/user_model.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:bankapp/database/app_database.dart';
import 'package:bankapp/database/db_operation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool _emailValidate = false;
bool _passwordValidate = false;

Future<bool> login_user(String email, String password) async {
  final String url = "http://10.0.2.2:8000/login";

  final response = await http
      .post(Uri.parse(url), body: {'email': email, 'password': password});
  Map res = jsonDecode(response.body);

  if (response.statusCode == 200) {
    WidgetsFlutterBinding.ensureInitialized();
    final db = await AppDatabase().initDatabase();
    DBOperations(db).insert_item(
        email, res["name"], res["token"]["access"], res["token"]["refresh"]);
    print(await DBOperations(db).user());

    return true;
  } else {
    ShowToast().show_toast(res['errors'][0], Colors.red);
    return false;
  }
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: splashColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Log In',
                      style: brand,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: emailController,
                      onChanged: (value) {
                        setState(() {
                          _emailValidate = false;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: whiteColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Email',
                        errorText: _emailValidate
                            ? "Email Field cannot be empty"
                            : null,
                        labelStyle: TextStyle(
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: passwordController,
                      onChanged: (value) {
                        setState(() {
                          _passwordValidate = false;
                        });
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: whiteColor),
                          ),
                          labelText: 'Password',
                          errorText: _passwordValidate
                              ? "Password Field cannot be empty"
                              : null,
                          labelStyle: TextStyle(color: whiteColor)),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          'Log In',
                          style: textNormal,
                        ),
                      ),
                      onPressed: () async {
                        String email = emailController.text;
                        String password = passwordController.text;

                        if (email.isEmpty) {
                          setState(() {
                            _emailValidate = true;
                          });
                        } else if (password.isEmpty) {
                          setState(() {
                            _passwordValidate = true;
                          });
                        } else {
                          bool logged_in = await login_user(email, password);
                        }
                        ;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Have you registered? ',
                          style: textNormal,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()),
                            );
                          },
                          child: Text(
                            'Register Now',
                            style: highlightText,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
