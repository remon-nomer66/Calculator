import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyTextField(),
            Keyboard(),
          ],
        ),
      ),
    );
  }
}

// 表示
class MyTextField extends StatefulWidget {
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  String _expression = '1+1';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(
          _expression,
          style: TextStyle(
            fontSize: 64.0,
          ),
        ),
      ),
    );
  }
}

class Keyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Center(
        child: Container(
          color: const Color(0xff87cefa),
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 3.0,
            crossAxisSpacing: 3.0,
            children: [
              '7', '8', '9', '/',
              '4', '5', '6', '*',
              '1', '2', '3', '-',
              '0', '.', '=', '+',
            ].map((key) {
              return GridTile(
                child: Button(key),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

// ボタン
class Button extends StatelessWidget {
  final String _key;
  Button(this._key, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // ここでボタンが押されたときの処理を実装します。
      },
      child: Center(
        child: Text(
          _key,
          style: TextStyle(fontSize: 46.0),
        ),
      ),
    );
  }
}
