import 'package:bankapp/pages/add_account.dart';
import 'package:bankapp/styles/colors.dart';
import 'package:bankapp/styles/text.dart';
import 'package:flutter/material.dart';

class AccountDetail extends StatefulWidget {
  const AccountDetail({Key? key}) : super(key: key);

  @override
  State<AccountDetail> createState() => _AccountDetailState();
}

bool _accountNumber = false;

TextEditingController accountController = TextEditingController();

class _AccountDetailState extends State<AccountDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/connect.png'),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 30),
              child: TextField(
                controller: accountController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey, width: 2)),
                    labelText: "Account Number"),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 10, right: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: secondaryColor,
                  ),
                  onPressed: () {
                    String acc = accountController.text;
                    if (acc.isEmpty) {
                      _accountNumber = true;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddAccount()),
                    );
                  },
                  child: Text('Submit', style: textNormal),
                ))
          ],
        ),
      ),
    );
  }
}
