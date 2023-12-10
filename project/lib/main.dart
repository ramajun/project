import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _currentInput = "";
  double _result = 0.0;

  void _onDigitPressed(String digit) {
    setState(() {
      if (_currentInput == "0") {
        _currentInput = digit;
      } else {
        _currentInput += digit;
      }
    });
  }

  void _onOperatorPressed(String operator) {
    setState(() {
      _result = double.parse(_currentInput);
      _currentInput = "";
    });
  }

  void _onEqualsPressed() {
    setState(() {
      double currentInput = double.parse(_currentInput);
      switch (_currentOperator) {
        case '+':
          _result += currentInput;
          break;
        case '-':
          _result -= currentInput;
          break;
        case '*':
          _result *= currentInput;
          break;
        case '/':
          _result /= currentInput;
          break;
      }
      _output = _result.toString();
      _currentInput = _output;
    });
  }

  String _currentOperator = "";

  void _onClearPressed() {
    setState(() {
      _output = "0";
      _currentInput = "";
      _result = 0.0;
      _currentOperator = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _output,
              style: TextStyle(fontSize: 36),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton("7"),
              _buildButton("8"),
              _buildButton("9"),
              _buildButton("/"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton("4"),
              _buildButton("5"),
              _buildButton("6"),
              _buildButton("*"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton("1"),
              _buildButton("2"),
              _buildButton("3"),
              _buildButton("-"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton("0"),
              _buildButton("C"),
              _buildButton("="),
              _buildButton("+"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      onPressed: () {
        if (text == "C") {
          _onClearPressed();
        } else if (text == "=") {
          _onEqualsPressed();
        } else if (text == "+" || text == "-" || text == "*" || text == "/") {
          _onOperatorPressed(text);
          _currentOperator = text;
        } else {
          _onDigitPressed(text);
        }
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
