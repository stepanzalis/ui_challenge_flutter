import 'package:flutter/material.dart';
import 'package:temperature_oval/colors.dart';

class RoundButton extends StatefulWidget {
  RoundButton({Key key, this.icon}) : super(key: key);

  final icon;
  bool tapped = false;

  @override
  _RoundButtonState createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: handleSelected,
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: widget.tapped ? pinkColor : greyColor, width: 2.0),
            color: widget.tapped ? pinkColor : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              widget.icon,
              size: 25.0,
              color: widget.tapped ? Colors.white : greyColor,
            ),
          ),
        ),
      ));

  handleSelected() {
    setState(() {
      widget.tapped = !widget.tapped;
    });
  }
}
