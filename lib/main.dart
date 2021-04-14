import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              child: Text(
                "$mem",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
              ),
            )),
            Expanded(
                child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              child: Text(
                text,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
              ),
            )),
            Row(
              children: <Widget>[
                customOutlineButton("7"),
                customOutlineButton("8"),
                customOutlineButton("9"),
                customOutlineButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlineButton("4"),
                customOutlineButton("5"),
                customOutlineButton("6"),
                customOutlineButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlineButton("1"),
                customOutlineButton("2"),
                customOutlineButton("3"),
                customOutlineButton("*"),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlineButton("C"),
                customOutlineButton("0"),
                customOutlineButton("="),
                customOutlineButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ignore: deprecated_member_use
  Widget customOutlineButton(String val) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(15),
        child: Text(
          val,
          style: TextStyle(fontSize: 40, fontStyle: FontStyle.italic),
        ),
        onPressed: () => btnclick(val),
      ),
    );
  }

  // String text1 = "";
  String mem = " ";
  String text = "";
  String res, opp;
  int first, second;
  String result = "";
  btnclick(String btntext) {
    if (btntext == "C") {
      result = "";
      res = "";
      first = 0;
      second = 0;
    } else if (btntext == "+" ||
        btntext == "-" ||
        btntext == "*" ||
        btntext == "/") {
      first = int.parse(text);
      opp = btntext;
      res = "";
      result = text + btntext;
    } else if (btntext == "=") {
      result = result + text;
      // result = text ;
      second = int.parse(text);
      if (opp == "+") {
        res = (first + second).toString();
      } else if (opp == "-") {
        res = (first - second).toString();
      } else if (opp == "*") {
        res = (first * second).toString();
      } else if (opp == "/") {
        res = (first / second).toInt().toString();
      }
    } else {
      res = text + btntext;
    }

    setState(() {
      // text1 = res1;
      text = res;
      mem = result;
    });
  }
}
