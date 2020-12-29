import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Message extends StatelessWidget {
  final String message;
  final Function onPressed;

  const Message({Key key, this.message, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        FlatButton(
          onPressed: onPressed,
          minWidth: 250,
          color: Color(0xff2edc76),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  FontAwesomeIcons.redo,
                  color: Color(0xff333333),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Reload",
                  style: TextStyle(
                      color: Color(0xff333333),
                      // color: Color(0xff030301),
                      fontSize: 24,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
