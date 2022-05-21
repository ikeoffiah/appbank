import 'package:bankapp/models/user_model.dart';
import 'package:bankapp/pages/login.dart';
import 'package:bankapp/styles/colors.dart';
import 'package:bankapp/styles/text.dart';
import 'package:bankapp/utils/toast.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

bool _emailValidate = false;
bool _nameValidate = false;
bool _passwordValidate = false;
bool _password2Validate = false;

Future<bool> createUser(
    String email, String name, String password, String password2) async {
  final String url = "http://10.0.2.2:8000/register";
  final response = await http.post(Uri.parse(url), body: {
    "email": email,
    "name": name,
    "password": password,
    "password2": password2
  });
  Map res = jsonDecode(response.body);
  if (response.statusCode == 200) {
    return true;
  } else {
    ShowToast().show_toast(res['errors'][0], Colors.red);

    return false;
  }
  ;
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController password2Controller = TextEditingController();

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                        'Create Account',
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
                        onChanged: (value) {
                          setState(() {
                            _nameValidate = false;
                          });
                        },
                        controller: nameController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: whiteColor)),
                            labelText: 'Name',
                            errorText: _nameValidate
                                ? "Name Field cannot be empty"
                                : null,
                            labelStyle: TextStyle(color: whiteColor)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _emailValidate = false;
                          });
                        },
                        controller: emailController,
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
                        onChanged: (value) {
                          setState(() {
                            _passwordValidate = false;
                          });
                        },
                        obscureText: true,
                        controller: passwordController,
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
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _password2Validate = false;
                          });
                        },
                        controller: password2Controller,
                        obscureText: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: whiteColor),
                          ),
                          labelText: 'Confirm Password',
                          errorText: _password2Validate
                              ? "Confirm Password Field cannot be empty"
                              : null,
                          labelStyle: TextStyle(color: whiteColor),
                        ),
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
                            'Register Now',
                            style: textNormal,
                          ),
                        ),
                        onPressed: () async {
                          final String email = emailController.text;
                          final String name = nameController.text;
                          final String password = passwordController.text;
                          final String password2 = password2Controller.text;

                          if (email.isEmpty) {
                            setState(() {
                              _emailValidate = true;
                            });
                          } else if (name.isEmpty) {
                            setState(() {
                              _nameValidate = true;
                            });
                          } else if (password.isEmpty) {
                            setState(() {
                              _passwordValidate = true;
                            });
                          } else if (password2.isEmpty) {
                            setState(() {
                              _password2Validate = true;
                            });
                          } else {
                            bool response = await createUser(
                                email, name, password, password2);

                            if (response == true) {
                              ShowToast().show_toast(
                                  "Account created successfully", Colors.green);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            }
                            ;
                          }
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
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: Text(
                              'Login Now',
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
      ),
    );
  }
}
