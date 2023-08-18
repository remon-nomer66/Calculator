import 'package:math_expressions/math_expressions.dart';

class Calculator {
  static String evaluate(String expression) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      return eval.toStringAsFixed(2);
    } catch (e) {
      return 'Error';
    }
  }
}
