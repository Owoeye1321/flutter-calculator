import 'package:flutter/material.dart';

class magicCalc extends StatefulWidget {
  const magicCalc({super.key});

  @override
  State<magicCalc> createState() => _magicCalcState();
}

class _magicCalcState extends State<magicCalc> {
  String output = "0";
  String _output = "0";
  double num_one = 0;
  double num_two = 0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      output = "0";
      num_one = 0;
      num_two = 0;
      operand = "";
      print(output);
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "x") {
      operand = buttonText;
      num_one = double.parse(_output);
      _output = "0";
      output = "0";
    } else if (buttonText == ".") {
      if (!_output.contains(".")) {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num_two = double.parse(_output);
      if (operand == "+") _output = (num_one + num_two).toString();
      if (operand == "/") _output = (num_one / num_two).toString();
      if (operand == "x") _output = (num_one * num_two).toString();
      if (operand == "-") _output = (num_one - num_two).toString();
      num_one = 0;
      num_two = 0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(0);
    });
  }

  Widget buildButton(String buttonText) {
    return (Expanded(
      child: SizedBox(
        height: 70,
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: OutlinedButton(
            child: Text(
              buttonText,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            onPressed: () {
              buttonPressed(buttonText);
            },
          ),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Calculator"),
          backgroundColor: Colors.black,
        ),
        body: Container(
          child: Column(children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                output,
                style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: Colors.black,
              ),
            ),
            new Column(
              children: [
                new Row(
                  children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("x"),
                  ],
                ),
                new Row(
                  children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("-"),
                  ],
                ),
                new Row(
                  children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("+"),
                  ],
                ),
                new Row(
                  children: [
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("/"),
                  ],
                ),
                new Row(
                  children: [buildButton("CLEAR"), buildButton("=")],
                )
              ],
            )
          ]),
        ));
  }
}
