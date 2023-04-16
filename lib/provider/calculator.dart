import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
  String _inputValue = '0';
  String _firstNum = '';
  String _secondNum = '';
  String _operator = '';
  String _result = '';
  bool _shouldClear = false;

  String get inputValue => _inputValue;
  String get operator => _operator;
  String get result => _result;

  void updateValue(String value) {
    if (_shouldClear) {
      _inputValue = '';
      _shouldClear = false;
    }
    if (value == '.' && _inputValue.contains('.')) return;
    if (_inputValue == '0' && value != '.') {
      _inputValue = value;
    } else {
      _inputValue += value;
    }
    notifyListeners();
  }

  void setOperator(String operator) {
    if (_operator.isNotEmpty) {
      calculate();
    }
    _firstNum = _inputValue;
    _operator = operator;
    _inputValue = '';
    notifyListeners();
  }

  void calculate() {
    if (_inputValue.isNotEmpty) {
      _secondNum = _inputValue;
    }
    double val1 = double.parse(_firstNum);
    double val2 = double.parse(_secondNum);
    switch (_operator) {
      case '+':
        _result = (val1 + val2).toString();
        break;
      case '-':
        _result = (val1 - val2).toString();
        break;
      case 'x':
        _result = (val1 * val2).toString();
        break;
      case '÷':
        if (val2 == 0) {
          _result = 'Error';
        } else {
          _result = (val1 / val2).toString();
        }
        break;
      case '%':
        _result = (val1 % val2).toString();
        break;
      default:
        return;
    }
    _inputValue = _result;
    _operator = '';
    _shouldClear = true;
    notifyListeners();
  }

  void clear() {
    _inputValue = '0';
    _firstNum = '';
    _secondNum = '';
    _operator = '';
    _result = '';
    _shouldClear = false;
    notifyListeners();
  }

  void toggleSign() {
    if (_inputValue.startsWith('-')) {
      _inputValue = _inputValue.substring(1);
    } else {
      _inputValue = '-' + _inputValue;
    }
    notifyListeners();
  }

  void calculatePercentage() {
    if (_firstNum.isNotEmpty && _secondNum.isEmpty) {
      double firstValue = double.parse(_firstNum);
      _result = (firstValue * 0.01).toStringAsFixed(3);
      _inputValue = _result;
      _shouldClear = true;
      notifyListeners();
    }
  }

  void calculateModulous() {
    if (_firstNum.isNotEmpty && _secondNum.isNotEmpty) {
      double firstValue = double.parse(_firstNum);
      double secondValue = double.parse(_secondNum);
      _result = (firstValue % secondValue).toString();
      _inputValue = _result;
      _shouldClear = true;
      notifyListeners();
    }
  }

  // int get firstNum => _firstNum;
  // set firstNum(int N1) {
  //   _firstNum = N1;
  //   notifyListeners();
  // }

  // int get secondNum => _secondNum;
  // set secondNum(int N2) {
  //   _secondNum = N2;
  //   notifyListeners();
  // }

  // String get history => _history;
  // set history(String history) {
  //   _history = history;
  //   notifyListeners();
  // }

  // String get textToDisplay => _textToDisplay;
  // set textToDisplay(String textToDisplay) {
  //   _textToDisplay = textToDisplay;
  //   notifyListeners();
  // }

  // String get res => _res;
  // set res(String res) {
  //   _res = res;
  //   notifyListeners();
  // }

  // String get operation => _operation;
  // set operation(String operation) {
  //   _operation = operation;
  //   notifyListeners();
  // }

  // bool _shouldCalculate = false;
  // bool get shouldCalculate => _shouldCalculate;
  // set shouldCalculate(bool shouldCalculate) {
  //   _shouldCalculate = shouldCalculate;
  //   notifyListeners();
  // }

  // void btnOnClick(String operation) {
  //   if (_operation == 'AC') {
  //     _firstNum = 0;
  //     _secondNum = 0;
  //     _history = "";
  //     _textToDisplay = "";
  //     _res = "";
  //   } else if (_operation == '+/-') {
  //     if (_textToDisplay[0] != '-') {
  //       _res = '-' + _textToDisplay;
  //     } else {
  //       _res = _textToDisplay.substring(1);
  //     }
  //   } else if (_operation == '+' ||
  //       _operation == '-' ||
  //       _operation == 'X' ||
  //       _operation == '÷' ||
  //       _operation == '%') {
  //     _firstNum = int.parse(_textToDisplay);
  //     _res = "";
  //     _operation = _operation;
  //   } else if (_operation == '=') {
  //     _secondNum = int.parse(_textToDisplay);
  //     if (_operation == '+') {
  //       _res = (_firstNum + _secondNum).toString();
  //       _history = _firstNum.toString() +
  //           _operation.toString() +
  //           _secondNum.toString();
  //     }
  //     if (_operation == '-') {
  //       _res = (_firstNum - _secondNum).toString();
  //       _history = _firstNum.toString() +
  //           _operation.toString() +
  //           _secondNum.toString();
  //     }
  //     if (_operation == 'X') {
  //       _res = (_firstNum * _secondNum).toString();
  //       _history = _firstNum.toString() +
  //           _operation.toString() +
  //           _secondNum.toString();
  //     }
  //     if (_operation == '÷') {
  //       _res = (_firstNum / _secondNum).toString();
  //       _history = _firstNum.toString() +
  //           _operation.toString() +
  //           _secondNum.toString();
  //     }
  //     if (_operation == '%') {
  //       _res = (_firstNum / 100).toString();
  //       _history = _firstNum.toString() + _operation.toString();
  //     }
  //   } else {
  //     _res = int.parse(_textToDisplay + _operation).toString();
  //   }
  //   notifyListeners();
  // }
}
