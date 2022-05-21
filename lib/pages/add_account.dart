import 'dart:convert';
import 'package:bankapp/pages/account_page.dart';
import 'package:bankapp/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:mono_flutter/mono_flutter.dart';

class AddAccount extends StatelessWidget {
  const AddAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/connect.png'),
          Container(
              child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: secondaryColor,
                  ),
                  child: Text(
                    'Link bank account',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    MonoFlutter().launch(
                      context,
                      'test_pk_avscWDSjMLdSyLRV7oBp',
                      // authCode: 'code_sGjE1Zh48lFR8vr3FkrD',
                      reference: "hdfdg",
                      config: {
                        "selectedInstitution": {
                          "id": "5f2d08bf60b92e2888287703",
                          "auth_method": "internet_banking"
                        }
                      },
                      onEvent: (event, data) {
                        print('event: $event, data: $data');
                      },
                      onClosed: () {
                        print('Modal closed');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountPage()),
                        );
                      },
                      onLoad: () {
                        print('Mono loaded successfully');
                      },
                      onSuccess: (code) {
                        print('Mono Success $code');
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccountPage()));
                      },
                    );
                  }),
            ),
          ))
        ],
      ),
    );
  }
}
