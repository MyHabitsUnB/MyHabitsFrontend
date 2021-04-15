import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui/widgets/ImageBanner.dart';
import 'package:flutter_covid_dashboard_ui/widgets/TextSection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_nav_screen.dart';

class NameUser extends StatefulWidget {
  @override
  _NameUserState createState() => _NameUserState();
}

class _NameUserState extends State<NameUser> {
  String username = "";

  @override
  Widget build(BuildContext context) {
    Future setName(String text) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('nome', text);
      setState(() {
        username = text;
      });
    }

    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: _height * 0.02),
//                ImageBanner(""),
                        Image.asset(
                          "assets/images/undraw_font.png",
                          fit: BoxFit.cover,
                          height: 210.0,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "Comece agora mesmo a\n utilizar o MyHabits",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Text(
                              "\nInsira seu nome\n no campo abaixo e comece\n a usar o MyHabits!",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                //fontWeight: FontWeight.bold,
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ]
                        ),
                        SizedBox(height: _height * 0.04),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextField(
                            onChanged: (text) {
                              setName(text);
                            },
                            decoration: InputDecoration(
                              // border: InputBorder.none,
                              hintText: 'Insira seu nome aqui :)',
                              labelText: "Nome",
                              labelStyle: TextStyle(
                                height: 0,
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ])),
                //SizedBox(height: _height * 0.05),
                        Container(
                          alignment: Alignment(0.0, 0.9),
                          padding: EdgeInsets.all(20.0),
                          child: ButtonTheme(
                            minWidth: 100.0,
                            height: 60.0,
                            child: FloatingActionButton(
                              child: Text('✔',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                              )),
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => BottomNavScreen()));
                        },
                      )),
                ),
              ],
            )))));
  }
}
