import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyIcon extends StatelessWidget {
  final String iconType;

  const MyIcon({Key key, this.iconType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    switch (iconType) {
      case 'cross':
        return Center(
          child: Icon(
            FontAwesomeIcons.times,
            size: 60,
            color: Color(0xff030301),
          ),
        );
      case 'circle':
        return Center(
          child: Icon(
            FontAwesomeIcons.circle,
            size: 60,
            color: Color(0xff030301),
          ),
        );
      default:
        return Center(
          child: Icon(
            FontAwesomeIcons.pencilAlt,
            color: Color(0xff030301),
            size: 60,
          ),
        );
    }
  }
}
