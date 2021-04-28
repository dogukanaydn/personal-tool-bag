import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double number1 = 0, number2 = 0, result = 0;

  String firstNumber = '';
  String secondNumber = '';

  final myFirstController = TextEditingController();
  final mySecondController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myFirstController.dispose();
    mySecondController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // myFirstController.addListener(_printLatestValue);
  }

  // _printLatestValue() {
  //   print('Second text field: ${myFirstController.text}');
  // }

  void showResult(String operand) {
    firstNumber = myFirstController.text;
    secondNumber = mySecondController.text;
    number1 = double.parse(firstNumber);
    number2 = double.parse(secondNumber);

    if (operand == 'add') {
      setState(() {
        result = number1 + number2;
      });
    } else if (operand == 'remove') {
      setState(() {
        result = number1 - number2;
      });
    } else if (operand == 'divide') {
      setState(() {
        result = number1 / number2;
      });
    } else {
      setState(() {
        result = number1 * number2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                TextField(
                  controller: myFirstController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Number',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: mySecondController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Second Number',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () => showResult('add'),
                        child: Icon(Icons.add),
                      ),
                      ElevatedButton(
                        onPressed: () => showResult('remove'),
                        child: Icon(Icons.remove),
                      ),
                      ElevatedButton(
                        onPressed: () => showResult('divide'),
                        child: Text('/'),
                      ),
                      ElevatedButton(
                        onPressed: () => showResult('multiply'),
                        child: Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('$result'),
                    onPressed: null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
