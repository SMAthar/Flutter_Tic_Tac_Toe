import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/icon.dart';
import 'package:tic_tac_toe/widgets/message.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isCross = false;
  String winMessage = '';
  var items = List<String>.filled(9, "empty");

  void checkWin() {
    // ! check for row: 1
    if (items[0] == items[1] && items[0] == items[2] && items[0] != 'empty') {
      setState(() {
        winMessage = '${items[0]} wins';
      });
    }
    // ! check for row: 2
    else if (items[3] == items[4] &&
        items[3] == items[5] &&
        items[3] != 'empty') {
      setState(() {
        winMessage = '${items[3]} wins';
      });
    }
    // ! check for row: 3
    else if (items[6] == items[7] &&
        items[6] == items[8] &&
        items[6] != 'empty') {
      setState(() {
        winMessage = '${items[6]} wins';
      });
    }
    // ! check for column: 1
    else if (items[0] == items[3] &&
        items[0] == items[6] &&
        items[0] != 'empty') {
      setState(() {
        winMessage = '${items[0]} wins';
      });
    }
    // ! check for column: 2
    else if (items[1] == items[4] &&
        items[1] == items[7] &&
        items[1] != 'empty') {
      setState(() {
        winMessage = '${items[1]} wins';
      });
    }
    // ! check for column: 3
    else if (items[2] == items[5] &&
        items[2] == items[8] &&
        items[2] != 'empty') {
      setState(() {
        winMessage = '${items[2]} wins';
      });
    }
    // ! check for diagonal: 1 (\)
    else if (items[0] == items[4] &&
        items[0] == items[8] &&
        items[0] != 'empty') {
      setState(() {
        winMessage = '${items[0]} wins';
      });
    }
    // ! check for diagonal: 2 (/)
    else if (items[2] == items[4] &&
        items[2] == items[6] &&
        items[2] != 'empty') {
      setState(() {
        winMessage = '${items[2]} wins';
      });
    } else if (!items.contains('empty')) {
      setState(() {
        winMessage = 'Match Tie';
      });
    }
  }

  void changeItem(int index) {
    if (winMessage == '') {
      if (items[index] == 'empty') {
        if (isCross) {
          items[index] = 'cross';
        } else {
          items[index] = 'circle';
        }
        setState(() {
          isCross = !isCross;
        });
      } else {
        Fluttertoast.showToast(
          msg: 'Already Played',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Color(0xffd62839),
          textColor: Colors.white,
          fontSize: 24,
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: winMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor:
            winMessage.contains('wins') ? Colors.green : Colors.red,
        textColor: Colors.white,
        fontSize: 16,
      );
    }
    checkWin();
  }

  void resetGame() {
    items.fillRange(0, 9, "empty");
    setState(() {
      isCross = false;
      winMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        isCross
            ? Text(
                "Cross's Turn",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              )
            : Text(
                "Circle's Turn",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
        SizedBox(height: 60),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => changeItem(index),
                  child: Card(
                      color: Color(0xFFf6f8ff),
                      child: MyIcon(
                        iconType: items[index],
                      )),
                );
              },
            ),
          ),
        ),
        winMessage != ''
            ? Message(
                message: winMessage,
                onPressed: resetGame,
              )
            : SizedBox.shrink(),
        SizedBox(
          height: 80,
        )
      ],
    );
  }
}
