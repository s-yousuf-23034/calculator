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
}
