import 'package:bankapp/pages/Register.dart';
import 'package:bankapp/pages/login.dart';
import 'package:bankapp/styles/colors.dart';
import 'package:bankapp/styles/text.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: splashColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
                top: 50,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 40, 0, 30),
                  child: Text(
                    'InfoData.',
                    style: logoBrand,
                  ),
                )),
            Positioned(
                top: 100,
                child: Image.asset(
                  'assets/cards.png',
                  height: 500,
                  width: 500,
                )),
            Positioned(
              bottom: 170,
              left: 20,
              child: Text(
                'Track All your Expenses',
                style: brand,
              ),
            ),
            Positioned(
                bottom: 30,
                left: 20,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: primaryColor, padding: EdgeInsets.all(25)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      'Register',
                      style: buttonText2,
                    ))),
            Positioned(
                bottom: 30,
                left: 150,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: whiteColor, padding: EdgeInsets.all(25)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      'Log In',
                      style: buttonText,
                    )))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
