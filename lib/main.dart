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
                    child: Text('+'),
                    onPressed: () {
                      // Handle '*' option press here
                      dupResult = value;
                      check = 1;
                      acheck = 1;
                      mcheck = 0;
                      print(
                          "result is fixed as $dupResult and check is $check");
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text('*'),
                    onPressed: () {
                      // Handle '*' option press here
                      dupResult = value;
                      check = 1;
                      mcheck = 1;
                      acheck = 0;
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
            // shape: BoxShape.circle,
            // color: btncolor,
            //border: Border.all(color: btncolor, width: 0),
            ),
        child: ElevatedButton(
          onPressed: () {
            //to add functpm
            calculation(btntxt);
          },
          child: Text(
            btntxt,
            style: TextStyle(
              fontSize: 30,
              color: txtcolor,
            ),
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            primary: btncolor,
            //minimumSize: Size(75, 50),
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
      // backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Calculator display
            Expanded(
              child: Container(
                // height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 1,
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: AutoSizeText(
                              '$dispresult\n',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromARGB(255, 43, 39, 38),
                                fontSize: 50,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 5, top: 10),
                              child: Container(
                                alignment: Alignment.bottomRight,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.9,
                                /*  height: 140,*/
                                child: AutoSizeText(
                                  '$value',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xff575757),
                                    fontSize: 50,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Icon(
                    Icons.timer,
                    color: Color(0xff9b9b9b),
                    size: 24.0,
                    //semanticLabel: 'Text to announce in accessibility modes',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Icon(
                    Icons.scale,
                    color: Color(0xff9b9b9b),
                    size: 25.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Icon(
                    Icons.calculate,
                    color: Color(0xff9b9b9b),
                    size: 25.0,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: IconButton(
                          onPressed: () {
                            calculation('d');
                          },
                          icon: Icon(Icons.backspace_outlined),
                          iconSize: 28,
                          color: Color(0xff518d1c),
                        ),                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('C', Color.fromARGB(255, 236, 232, 232),
                    Color.fromARGB(255, 226, 5, 5)),
                calcbutton('-', Color.fromARGB(255, 236, 232, 232),
                    Color(0xff518d1c)),
                calcbutton('%', Color.fromARGB(255, 236, 232, 232),
                    Color(0xff518d1c)),
                calcbutton('/', Color.fromARGB(255, 236, 232, 232),
                    Color(0xff518d1c)),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('7', Color.fromARGB(255, 236, 232, 232),
                    Color(0xff575757)),
                calcbutton('8', Color.fromARGB(255, 236, 232, 232),
                    Color(0xff575757)),
                calcbutton('9', Color.fromARGB(255, 236, 232, 232),
                    Color(0xff575757)),
                calcbutton('x', Color.fromARGB(255, 236, 232, 232),
                    Color(0xff518d1c)),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('4', Color.fromARGB(255, 236, 232, 232),
                    Color(0xff575757)),
                calcbutton('5', Color.fromARGB(255, 236, 232, 232),
                    Color(0xff575757)),
                calcbutton('6', Color.fromARGB(255, 236, 232, 232),
                    Color(0xff575757)),
                calcbutton('-', Color.fromARGB(255, 236, 232, 232),
                    Color(0xff518d1c)),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('1', Color.fromARGB(255, 236, 232, 232),
                    Color(0xff575757)),
                calcbutton('2', Color.fromARGB(255, 236, 232, 232),
                    Color(0xff575757)),
                calcbutton('3', Color.fromARGB(255, 236, 232, 232),
                    Color(0xff575757)),
                calcbutton('+', Color.fromARGB(255, 236, 232, 232),
                    Color(0xff518d1c)),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //this is button Zero
                calcbutton("0", Color.fromARGB(255, 236, 232, 232),
                    Color(0xff575757)),
                calcbutton('.', Color.fromARGB(255, 236, 232, 232),
                    Color(0xff575757)),
                // calcbutton('()',Color.fromARGB(255, 236, 232, 232),Color.fromARGB(255, 43, 39, 38)),
                Container(
                  decoration: BoxDecoration(
                      //shape: BoxShape.circle,
                      //color: Color.fromARGB(255, 251, 249, 249),
                      //border: Border.all(width: 0),
                      ),
                  child: InkWell(
                    onLongPress: () {
                      // Show pop-up menu here

                      print("long press activated");
                      check = 0;
                      mcheck = 0;
                      acheck = 0;
                      print("normal caculator");
                    },
                    child: ElevatedButton(
                      child: Text(
                        '()',
                        style: TextStyle(
                          fontSize: 35,
                          color: Color(0xff575757),
                        ),
                      ),
                      onPressed: () {
                        // Handle normal button press here
                        //calculation('=');
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        primary: Color.fromARGB(255, 236, 232, 232),
                        // minimumSize: Size(75, 50),
                        //fixedSize: Size(75, 75),
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                ),
                /*  ElevatedButton(
                  onPressed: () {},
                  child: Container(
                    //width: double.infinity,
                    //height: double.infinity,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //SizedBox(width: 8),
                        Text(
                          "()",
                          style: TextStyle(
                              fontSize: 40,
                              color: Color.fromARGB(255, 43, 39, 38)),
                        ),
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 236, 232, 232),
                    minimumSize: Size(75, 50),
                    //fixedSize: Size(75, 75),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                ),*/
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
                    //color: Color.fromARGB(255, 251, 249, 249),
                    // border: Border.all(width: 0),
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
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        // Handle normal button press here
                        calculation('=');
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        primary: Color(0xff518d1c),
                        // minimumSize: Size(75, 50),
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
  int acheck = 0;
  int mcheck = 0;
  int change = 0;
  dynamic result = '';
  dynamic dispresult = '';
  dynamic finalResult = '';
  dynamic dupResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  dynamic value = '';
  void calculation(btnText) {
    if (btnText == '=' || btnText == '%') {
      res = 1;
    } else {
      res = 0;
      print("status $res");
    }
    print("mcheck is $mcheck");

    print("acheck is $acheck");
    if (btnText == '+' && check == 1 && acheck == 1 && mcheck == 0) {
      acheck = 1;
      print("addiction manipulation activated acheck $acheck");
      mcheck = 0;
      change = 1;
    }
    if (btnText == 'x' && check == 1 && acheck == 0 && mcheck == 1) {
      mcheck = 1;
      print("multiply manipulation activated acheck $mcheck");
      print("status of acheck $acheck");
      acheck = 0;
      change = 1;
    }
    print(check);
    print("button text $btnText");
    if (btnText != null && btnText != 'C' && btnText != "=" && btnText != 'd') {
      dispresult = dispresult + btnText;
    }
    if (btnText == '%') {
      dispresult = "";
    }
    if (btnText == 'C') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '';
      dispresult = '';
      opr = '';
      preOpr = '';
      change = 0;
      //  acheck = 0;
      //   mcheck = 0;
    } else if (opr == '=' && btnText == '=') {
      print("eqaul value of check is $check");
      if (check == 1 && acheck == 1 || check == 1 && mcheck == 1) {
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
        if ((check == 1 && acheck == 1 || check == 1 && mcheck == 1) &&
            change == 1) {
          print("final result is manipulated");
          finalResult = dupResult;
        } else {
          //dispresult = dispresult + "+";
          finalResult = add();
        }
      } else if (opr == '-') {
        if ((check == 1 && acheck == 1 || check == 1 && mcheck == 1) &&
            change == 1) {
          print("final result is manipulated");
          finalResult = dupResult;
        } else {
          finalResult = sub();
        }
      } else if (opr == 'x') {
        if ((check == 1 && acheck == 1 || check == 1 && mcheck == 1) &&
            change == 1) {
          print("final result is manipulated");
          finalResult = dupResult;
        } else {
          finalResult = mul();
        }
      } else if (opr == '/') {
        //finalResult = div();
        if (check == 1 && acheck == 1 || check == 1 && mcheck == 1) {
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
      if (btnText == "="||btnText == "%") {
        finalResult = result;
        print(finalResult);
      }
    }

    setState(() {
      dispresult;
      if (res == 0) {
        value = "";
      } else {
        value = finalResult;
      }
      //  value = finalResult;
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
