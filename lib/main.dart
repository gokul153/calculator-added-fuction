import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

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
                      dupResult = value;
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
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: btncolor,
          border: Border.all(color: btncolor, width: 2),
        ),
        child: ElevatedButton(
          onPressed: () {
            //to add functpm
            calculation(btntxt);
          },
          child: Text(
            btntxt,
            style: TextStyle(
              fontSize: 50,
              color: txtcolor,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: btncolor,
            minimumSize: Size(75, 50),
            //fixedSize: Size(75, 75),
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Calculator
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Calculator display
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  //width: double.maxFinite,
                  color: Color.fromARGB(255, 43, 39, 38),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                /*  height: 140,*/
                                child: AutoSizeText(
                                  '$dispresult\n',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            /*  Container(
                              height: 100,
                              child: FittedBox(
                                child: Text(
                                  "$dispresult\n"
                                  //textAlign: TextAlign.left,
                                ),
                              ),
                            )*/
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: SizedBox(
                                // width: double.maxFinite,
                                /*  height: 140,*/
                                child: AutoSizeText(
                                  '$value',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 90,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('A', Color.fromARGB(255, 208, 7, 192), Colors.white),
                calcbutton('-', Color.fromARGB(255, 40, 38, 38), Colors.white),
                calcbutton('%', Color.fromARGB(255, 40, 38, 38), Colors.white),
                calcbutton('/', Colors.amber, Colors.white),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('7', Color.fromARGB(255, 40, 38, 38), Colors.white),
                calcbutton('8', Color.fromARGB(255, 40, 38, 38), Colors.white),
                calcbutton('9', Color.fromARGB(255, 40, 38, 38), Colors.white),
                calcbutton('x', Colors.amber, Colors.white),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('4', Color.fromARGB(255, 40, 38, 38), Colors.white),
                calcbutton('5', Color.fromARGB(255, 40, 38, 38), Colors.white),
                calcbutton('6', Color.fromARGB(255, 40, 38, 38), Colors.white),
                calcbutton('-', Colors.amber, Colors.white),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('1', Color.fromARGB(255, 40, 38, 38), Colors.white),
                calcbutton('2', Color.fromARGB(255, 40, 38, 38), Colors.white),
                calcbutton('3', Color.fromARGB(255, 40, 38, 38), Colors.white),
                calcbutton('+', Colors.amber, Colors.white),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //this is button Zero
                calcbutton("0", Color.fromARGB(255, 40, 38, 38), Colors.white),
                calcbutton('.', Color.fromARGB(255, 40, 38, 38), Colors.white),
                //  calcbutton('=',Colors.amber,Colors.white),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 40, 38, 38),
                    border: Border.all(width: 2),
                  ),
                  child: GestureDetector(
                    onLongPress: () {
                      // Do something on long press
                      check = 0;
                      print("normal calculator");
                    },
                    child: ElevatedButton(
                      onPressed: () {
                        // Do something on button press
                        calculation('d');
                      },
                      child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back),
                              Text(
                                "",
                                style: TextStyle(fontSize: 50),
                              ),
                            ],
                          )),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        minimumSize: Size(75, 50),
                        //fixedSize: Size(75, 75),
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                ),
                /* child:ElevatedButton(
                      onPressed: () {
                        /* Your code here */
                        calculation('d');
                      },
                      child: Container(
                        //width: double.infinity,
                        //height: double.infinity,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Color.fromARGB(255, 255, 251, 251),
                            ),
                            //SizedBox(width: 8),
                            Text(
                              "",
                              style: TextStyle(fontSize: 50),
                            ),
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 40, 38, 38),
                        minimumSize: Size(75, 50),
                        //fixedSize: Size(75, 75),
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                    ),*/
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 40, 38, 38),
                    border: Border.all(width: 2),
                  ),
                  child: InkWell(
                    onLongPress: () {
                      // Show pop-up menu here
                      _showPopUp(context);
                      print("long press activated");
                    },
                    child: ElevatedButton(
                      child: Text(
                        '=',
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        // Handle normal button press here
                        calculation('=');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        minimumSize: Size(75, 50),
                        //fixedSize: Size(75, 75),
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                ),
              ],
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
  int res = 0;
  dynamic result = '';
  dynamic dispresult = '';
  dynamic finalResult = '';
  dynamic dupResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  dynamic value = '';
  void calculation(btnText) {
    print(check);
    print("button text $btnText");
    if (btnText != null && btnText != 'A' && btnText != "=" && btnText != 'd') {
      dispresult = dispresult + btnText;
    }
    if (btnText == 'A') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '';
      dispresult = '';
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
          //dispresult = dispresult + "+";
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
    } else if (btnText == "d") {
      result = result.toString().substring(0, result.toString().length - 1);
      // finalResult = finalResult.substring(0, finalResult.length - 1);
      dispresult =
          dispresult.toString().substring(0, dispresult.toString().length - 1);
      //finalResult = result;
      //dispresult = result;
      print("dispresult back $dispresult");
    } else {
      // dispresult = dispresult + btnText;
      print("intermediate disp result is $dispresult");
      result = result + btnText;
      // finalResult = dispresult;
      if (btnText == "=") {
        finalResult = result;
        print(finalResult);
      }
    }

    setState(() {
      dispresult;
      value = finalResult;
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
