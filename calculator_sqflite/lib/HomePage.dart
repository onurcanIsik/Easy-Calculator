import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String denklem = "";
  String sonuc = "0";
  String ifade = "";
  bool kontrol = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  sonuc,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w100),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  denklem,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  child: Buttonlar("C", 1, Colors.red, Colors.white),
                ),
                SizedBox(width: 20),
                Container(
                  width: 80,
                  height: 80,
                  child: Buttonlar("<", 1, Colors.grey, Colors.black),
                ),
                SizedBox(width: 20),
                Container(
                  width: 80,
                  height: 80,
                  child: Buttonlar("/", 1, Colors.amberAccent, Colors.black),
                ),
                SizedBox(width: 20),
                Container(
                  width: 80,
                  height: 80,
                  child: Buttonlar("*", 1, Colors.amberAccent, Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: Buttonlar("7", 1, Colors.blueGrey, Colors.white),
                ),
                SizedBox(width: 20),
                Container(
                  width: 80,
                  height: 80,
                  child: Buttonlar("8", 1, Colors.blueGrey, Colors.white),
                ),
                SizedBox(width: 20),
                Container(
                  width: 80,
                  height: 80,
                  child: Buttonlar("9", 1, Colors.blueGrey, Colors.white),
                ),
                SizedBox(width: 20),
                Container(
                  width: 80,
                  height: 80,
                  child: Buttonlar("+", 1, Colors.amberAccent, Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: Buttonlar("4", 1, Colors.blueGrey, Colors.white),
                ),
                SizedBox(width: 20),
                Container(
                  width: 80,
                  height: 80,
                  child: Buttonlar("5", 1, Colors.blueGrey, Colors.white),
                ),
                SizedBox(width: 20),
                Container(
                  width: 80,
                  height: 80,
                  child: Buttonlar("6", 1, Colors.blueGrey, Colors.white),
                ),
                SizedBox(width: 20),
                Container(
                  width: 80,
                  height: 80,
                  child: Buttonlar("-", 1, Colors.amberAccent, Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: Buttonlar("1", 1, Colors.blueGrey, Colors.white),
                ),
                SizedBox(width: 20),
                Container(
                  width: 80,
                  height: 80,
                  child: Buttonlar("2", 1, Colors.blueGrey, Colors.white),
                ),
                SizedBox(width: 20),
                Container(
                  width: 80,
                  height: 80,
                  child: Buttonlar("3", 1, Colors.blueGrey, Colors.white),
                ),
                SizedBox(width: 20),
                Container(
                  width: 80,
                  height: 80,
                  child: Buttonlar("=", 2, Colors.red, Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: Buttonlar(".", 1, Colors.blueGrey, Colors.white),
                ),
                SizedBox(width: 20),
                Container(
                  width: 80,
                  height: 80,
                  child: Buttonlar("0", 1, Colors.blueGrey, Colors.white),
                ),
                SizedBox(width: 20),
                Container(
                  width: 80,
                  height: 80,
                  child: Buttonlar("00", 1, Colors.blueGrey, Colors.white),
                ),
                SizedBox(width: 20),
                Container(
                  width: 80,
                  height: 80,
                  child: Buttonlar("000", 1, Colors.blueGrey, Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  buttonPress(buttonIcerik) {
    setState(() {
      if (buttonIcerik == "C") {
        denklem = "0";
        sonuc = "0";
      } else if (buttonIcerik == "<") {
        denklem = denklem.substring(0, denklem.length - 1);
        if (denklem == "") {
          denklem = "0";
        }
      } else if (buttonIcerik == "=") {
        ifade = denklem;

        try {
          Parser p = Parser();
          Expression exp = p.parse(ifade);
          ContextModel Cm = ContextModel();
          sonuc = "${exp.evaluate(EvaluationType.REAL, Cm)}";
        } catch (e) {
          sonuc = "Hata";
        }
      } else {
        if (denklem == "0") {
          denklem = buttonIcerik;
        } else {
          denklem = denklem + buttonIcerik;
        }
      }
    });
  }

  Widget Buttonlar(String buttonIcerik, double buttonYukseklik,
      Color buttonRenk, Color textColor) {
    return Container(
      margin: EdgeInsets.only(top: 1),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      height: MediaQuery.of(context).size.height * 0.1 * buttonYukseklik,
      //color: buttonRenk,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonRenk,
          shape: CircleBorder(),
        ),
        onPressed: () => buttonPress(buttonIcerik),
        child: Text(
          buttonIcerik,
          style: TextStyle(
              fontSize: 27.0, fontWeight: FontWeight.normal, color: textColor),
        ),
      ),
    );
  }
}
