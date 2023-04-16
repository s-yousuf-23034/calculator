import 'package:assignment3/provider/calculator.dart';
import 'package:assignment3/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final calculatorProvider = Provider.of<CalculatorProvider>(context);

    var clear = calculatorProvider.clear;
    var toggleSign = calculatorProvider.toggleSign;
    var percentage = calculatorProvider.calculatePercentage;

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        Provider.of<CalculatorProvider>(context).operator,
                        style: TextStyle(fontSize: 24, color: Colors.grey),
                      ),
                      Text(
                        Provider.of<CalculatorProvider>(context).inputValue,
                        // Provider.of<CalculatorProvider>(context).operator,
                        style: TextStyle(fontSize: 24, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 0,
                    child: CalculatorButton(
                      text: 'AC',
                      backgroundColor: Colors.white54,
                      textColor: Colors.black,
                      onTap: clear,
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: CalculatorButton(
                      text: '+/-',
                      backgroundColor: Colors.white54,
                      textColor: Colors.black,
                      onTap: toggleSign,
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: CalculatorButton(
                        text: '%',
                        backgroundColor: Colors.white54,
                        textColor: Colors.black,
                        onTap: percentage),
                  ),
                  Expanded(
                    flex: 0,
                    child: CalculatorButton(
                        text: '÷',
                        backgroundColor: Colors.amber,
                        textColor: Colors.white,
                        onTap: () => calculatorProvider.setOperator('÷')),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 0,
                    child: CalculatorButton(
                        text: '7',
                        backgroundColor: Colors.white10,
                        textColor: Colors.white,
                        onTap: () => calculatorProvider.updateValue('7')),
                  ),
                  Expanded(
                    flex: 0,
                    child: CalculatorButton(
                        text: '8',
                        backgroundColor: Colors.white10,
                        textColor: Colors.white,
                        onTap: () => calculatorProvider.updateValue('8')),
                  ),
                  Expanded(
                    flex: 0,
                    child: CalculatorButton(
                        text: '9',
                        backgroundColor: Colors.white10,
                        textColor: Colors.white,
                        onTap: () => calculatorProvider.updateValue('9')),
                  ),
                  Expanded(
                    flex: 0,
                    child: CalculatorButton(
                        text: '×',
                        backgroundColor: Colors.amber,
                        textColor: Colors.white,
                        onTap: () => calculatorProvider.setOperator('x')),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 0,
                    child: CalculatorButton(
                        text: '4',
                        backgroundColor: Colors.white10,
                        textColor: Colors.white,
                        onTap: () => calculatorProvider.updateValue('4')),
                  ),
                  Expanded(
                    flex: 0,
                    child: CalculatorButton(
                        text: '5',
                        backgroundColor: Colors.white10,
                        textColor: Colors.white,
                        onTap: () => calculatorProvider.updateValue('5')),
                  ),
                  Expanded(
                    flex: 0,
                    child: CalculatorButton(
                        text: '6',
                        backgroundColor: Colors.white10,
                        textColor: Colors.white,
                        onTap: () => calculatorProvider.updateValue('6')),
                  ),
                  Expanded(
                    flex: 0,
                    child: CalculatorButton(
                        text: '−',
                        backgroundColor: Colors.amber,
                        textColor: Colors.white,
                        onTap: () => calculatorProvider.setOperator('-')),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 0,
                    child: CalculatorButton(
                        text: '1',
                        backgroundColor: Colors.white10,
                        textColor: Colors.white,
                        onTap: () => calculatorProvider.updateValue('1')),
                  ),
                  Expanded(
                    flex: 0,
                    child: CalculatorButton(
                        text: '2',
                        backgroundColor: Colors.white10,
                        textColor: Colors.white,
                        onTap: () => calculatorProvider.updateValue('2')),
                  ),
                  Expanded(
                    flex: 0,
                    child: CalculatorButton(
                        text: '3',
                        backgroundColor: Colors.white10,
                        textColor: Colors.white,
                        onTap: () => calculatorProvider.updateValue('3')),
                  ),
                  Expanded(
                    flex: 0,
                    child: CalculatorButton(
                        text: '+',
                        backgroundColor: Colors.amber,
                        textColor: Colors.white,
                        onTap: () => calculatorProvider.setOperator('+')),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 2,
                    child: CalculatorButton(
                        text: '0',
                        backgroundColor: Colors.white10,
                        textColor: Colors.white,
                        onTap: () => calculatorProvider.updateValue('0')),
                  ),
                  Expanded(
                    flex: 0,
                    child: CalculatorButton(
                        text: ',',
                        backgroundColor: Colors.white10,
                        textColor: Colors.white,
                        onTap: () => calculatorProvider.updateValue('.')),
                  ),
                  Expanded(
                    flex: 0,
                    child: CalculatorButton(
                        text: '=',
                        backgroundColor: Colors.amber,
                        textColor: Colors.white,
                        onTap: () => calculatorProvider.calculate()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
