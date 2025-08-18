import 'package:flutter/material.dart';
import 'package:calculator_app/widgets/calculator_button.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _expression = '0';
  String _result = '0';

  void _onButtonPressed(String buttonText) {
    setState(() {
      try {
        if (buttonText == 'AC') {
          // All Clear
          _expression = '0';
          _result = '0';
        } else if (buttonText == 'C') {
          // Clear last character
          if (_expression.length > 1) {
            _expression = _expression.substring(0, _expression.length - 1);
          } else {
            _expression = '0';
          }
        } else if (buttonText == '=') {
          // Calculate result
          _calculateResult();
        } else {
          // Handle all other inputs (numbers, operators, decimal)
          if (_expression == '0' && buttonText != '.') {
            _expression = buttonText;
          } else {
            _expression += buttonText;
          }
        }
      } catch (e) {
        _result = 'Error';
      }
    });
  }

  void _calculateResult() {
    try {
      // Convert symbols to math expression format
      String mathExpression = _expression
          .replaceAll('×', '*')
          .replaceAll('÷', '/');

      // Parse and evaluate the expression
      ExpressionParser p = GrammarParser();
      Expression exp = p.parse(mathExpression);
      ContextModel cm = ContextModel();
      var evaluator = RealEvaluator(cm);
      num eval = evaluator.evaluate(exp);

      // Handle division by zero or invalid results
      if (eval.isInfinite || eval.isNaN) {
        _result = 'Error';
      } else {
        // Simple result formatting
        _result = eval.toString();
      }
    } catch (e) {
      // Handle any calculation errors
      _result = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Display Section
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Expression TextField
                      TextField(
                        controller: TextEditingController(text: _expression),
                        readOnly: true,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 24,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '0',
                          hintStyle: TextStyle(color: Colors.white38),
                        ),
                      ),
                      const Divider(color: Colors.white24),
                      // Result TextField
                      TextField(
                        controller: TextEditingController(text: _result),
                        readOnly: true,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '0',
                          hintStyle: TextStyle(color: Colors.white38),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Button Section
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Row 1: 7, 8, 9, C, AC
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CalculatorButton(
                            text: '7',
                            onPressed: () => _onButtonPressed('7'),
                          ),
                          CalculatorButton(
                            text: '8',
                            onPressed: () => _onButtonPressed('8'),
                          ),
                          CalculatorButton(
                            text: '9',
                            onPressed: () => _onButtonPressed('9'),
                          ),
                          CalculatorButton(
                            text: 'C',
                            isSpecial: true,
                            onPressed: () => _onButtonPressed('C'),
                          ),
                          CalculatorButton(
                            text: 'AC',
                            isSpecial: true,
                            onPressed: () => _onButtonPressed('AC'),
                          ),
                        ],
                      ),
                    ),

                    // Row 2: 4, 5, 6, +, -
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CalculatorButton(
                            text: '4',
                            onPressed: () => _onButtonPressed('4'),
                          ),
                          CalculatorButton(
                            text: '5',
                            onPressed: () => _onButtonPressed('5'),
                          ),
                          CalculatorButton(
                            text: '6',
                            onPressed: () => _onButtonPressed('6'),
                          ),
                          CalculatorButton(
                            text: '+',
                            isOperator: true,
                            onPressed: () => _onButtonPressed('+'),
                          ),
                          CalculatorButton(
                            text: '-',
                            isOperator: true,
                            onPressed: () => _onButtonPressed('-'),
                          ),
                        ],
                      ),
                    ),

                    // Row 3: 1, 2, 3, *, /
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CalculatorButton(
                            text: '1',
                            onPressed: () => _onButtonPressed('1'),
                          ),
                          CalculatorButton(
                            text: '2',
                            onPressed: () => _onButtonPressed('2'),
                          ),
                          CalculatorButton(
                            text: '3',
                            onPressed: () => _onButtonPressed('3'),
                          ),
                          CalculatorButton(
                            text: '×',
                            isOperator: true,
                            onPressed: () => _onButtonPressed('×'),
                          ),
                          CalculatorButton(
                            text: '÷',
                            isOperator: true,
                            onPressed: () => _onButtonPressed('÷'),
                          ),
                        ],
                      ),
                    ),

                    // Row 4: 0, 00, ., =
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CalculatorButton(
                            text: '0',
                            onPressed: () => _onButtonPressed('0'),
                          ),
                          CalculatorButton(
                            text: '.',
                            onPressed: () => _onButtonPressed('.'),
                          ),
                          CalculatorButton(
                            text: '00',
                            onPressed: () => _onButtonPressed('00'),
                          ),
                          CalculatorButton(
                            text: '=',
                            isSpecial: true,
                            flex: 2,
                            onPressed: () => _onButtonPressed('='),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
