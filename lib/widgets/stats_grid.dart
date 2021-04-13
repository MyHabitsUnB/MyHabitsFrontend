import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatsGrid extends StatefulWidget {

  @override
  _StatsGridState createState() => _StatsGridState();
}

class _StatsGridState extends State<StatsGrid> {
  SharedPreferences prefs;
  String _exercicio;
  String _meditar;
  String _estudar;


  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _exercicio = (prefs.getInt("exercicio") ?? 0).toString();
      _meditar = (prefs.getInt("meditar") ?? 0).toString();
      _estudar = (prefs.getInt("estudar") ?? 0).toString();
    });
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Exercícios ', _exercicio ?? '0', Colors.green),
                _buildStatCard('Meditações', _meditar ?? '0', Colors.red),
                _buildStatCard('Estudos ', _estudar ?? '0', Colors.deepOrange), //TODO get from database or local Storage
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildStatCard(String title, String count, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
