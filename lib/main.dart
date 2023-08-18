import 'package:flutter/material.dart';
import 'calculator.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = '';
  String output = '0';

  void onDigitPress(String digit) {
    setState(() {
      input = input + digit;
      output = input;
    });
  }

  void onClear() {
    setState(() {
      input = '';
      output = '0';
    });
  }

  void onEvaluate() {
    setState(() {
      output = Calculator.evaluate(input);
      input = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end, // これを追加
        children: <Widget>[
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(16),
            child: Text(
              output,
              style: TextStyle(fontSize: 48),
            ),
          ),
          SizedBox(height: 20.0),
          ...buildButtons(),
        ],
      ),
    );
  }

  List<Widget> buildButtons() {
    const List<String> buttonLabels = [
      '7', '8', '9', '÷',
      '4', '5', '6', '×',
      '1', '2', '3', '-',
      'C', '0', '=', '+',
    ];

    List<Widget> buttons = [];
    for (int i = 0; i < buttonLabels.length; i += 4) {
      List<Widget> rowButtons = [];
      for (int j = i; j < i + 4; j++) {
        rowButtons.add(buildButton(buttonLabels[j]));
      }
      buttons.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: rowButtons));
    }
    return buttons;
  }

  Widget buildButton(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => onButtonPress(label),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }

  void onButtonPress(String label) {
    if (label == 'C') {
      onClear();
    } else if (label == '=') {
      onEvaluate();
    } else {
      onDigitPress(label);
    }
  }
}
