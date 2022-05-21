import 'package:bankapp/styles/colors.dart';
import 'package:bankapp/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      color: primaryColor,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 50, left: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/prog.png',
                    height: 70,
                    width: 70,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Hi Pius',
                      style: brand,
                    ),
                  )
                ],
              )),
          Container(
            padding: EdgeInsets.only(top: 50, left: 20),
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.4,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'Total Balance',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          '₦ 80000',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.4,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'Expenses',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          '₦ 5000',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 90,
            margin: EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.blue,
                      gradPink,
                    ]),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: const Text('Test hdhdhb',
                  style: TextStyle(color: whiteColor, fontSize: 16)),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          LineGraph(
            features: [
              Feature(
                title: "Flutter",
                color: Colors.blue,
                data: [0.3, 0.6, 0.8, 0.9, 1, 1.2],
              )
            ],
            size: Size(MediaQuery.of(context).size.width, 300),
            labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5'],
            labelY: ['20%', '40%', '60%', '80%', '100%'],
            showDescription: true,
            graphColor: whiteColor,
            graphOpacity: 0.2,
            verticalFeatureDirection: true,
            descriptionHeight: 10,
          )
        ],
      ),
    )));
  }
}
