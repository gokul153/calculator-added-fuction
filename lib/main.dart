import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic displaytxt = 20;
  //Button Widget
  void _showPopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            Container(
              child: AlertDialog(
                title: Text('Enter the value '),
                actions: <Widget>[
                  FlatButton(
                    child: Text('*'),
                    onPressed: () {
                      // Handle '*' option press here
                      dupResult = text;
                      check = 1;
                      print(
                          "result is fixed as $dupResult and check is $check");
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text('+'),
                    onPressed: () {
                       // Handle '*' option press here
                      dupResult = text;
                      check = 1;
                      print(
                          "result is fixed as $dupResult and check is $check");
                      //Navigator.of(context).pop();
                      // Handle '+' option press here
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          //to add functpm
          calculation(btntxt);
        },
        child: Text(
          btntxt,
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: btncolor,
          shape: CircleBorder(),
          padding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Calculator
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Calculator display
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '$text',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('A', Colors.grey, Colors.black),
                calcbutton('-', Colors.grey, Colors.black),
                calcbutton('%', Colors.grey, Colors.black),
                calcbutton('/', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('7', Colors.grey, Colors.white),
                calcbutton('8', Colors.grey, Colors.white),
                calcbutton('9', Colors.grey, Colors.white),
                calcbutton('x', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('4', Colors.grey, Colors.white),
                calcbutton('5', Colors.grey, Colors.white),
                calcbutton('6', Colors.grey, Colors.white),
                calcbutton('-', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('1', Colors.grey, Colors.white),
                calcbutton('2', Colors.grey, Colors.white),
                calcbutton('3', Colors.grey, Colors.white),
                calcbutton('+', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //this is button Zero
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                  onPressed: () {
                    calculation('0');
                  },
                  shape: StadiumBorder(),
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                  color: Colors.grey,
                ),
                calcbutton('.', Colors.grey, Colors.white),
                //  calcbutton('=',Colors.amber,Colors.white),
                InkWell(
                  onLongPress: () {
                    // Show pop-up menu here
                    _showPopUp(context);
                    print("long press activated");
                  },
                  child: ElevatedButton(
                    child: Text(
                      '=',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      // Handle normal button press here
                      calculation('=');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  String _textFieldValue = '';
  //Calculator logic
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;
  int check = 0;
  dynamic result = '';
  dynamic finalResult = '';
  dynamic dupResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    print(check);
    print("button text $btnText");
    if (btnText == 'A') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      print("eqaul value of check is $check");
      if (check == 1) {
        finalResult = dupResult;
        print("final Result at check funtion check activate$finalResult");
      } else {
        if (preOpr == '+') {
          finalResult = add();
        } else if (preOpr == '-') {
          finalResult = sub();
        } else if (preOpr == 'x') {
          finalResult = mul();
        } else if (preOpr == '/') {
          finalResult = div();
        }
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        if (check == 1) {
          print("final result is manipulated");
          finalResult = dupResult;
        } else {
          finalResult = add();
        }
      } else if (opr == '-') {
        if (check == 1) {
          print("final result is manipulated");
          finalResult = dupResult;
        } else {
          finalResult = sub();
        }
     
      } else if (opr == 'x') {
        
        if (check == 1) {
          print("final result is manipulated");
          finalResult = dupResult;
        } else {
          finalResult = mul();
        }
      } else if (opr == '/') {
        finalResult = div();
         if (check == 1) {
          print("final result is manipulated");
          finalResult = dupResult;
        } else {
          finalResult = div();
        }
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }

      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}