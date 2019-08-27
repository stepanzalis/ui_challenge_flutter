import 'package:flutter/material.dart';
import 'package:vpn_app/util/colors.dart';
import 'package:vpn_app/util/dimens.dart';

class RoundedCheckbox extends StatelessWidget {
  final double size;
  final bool checked;

  const RoundedCheckbox({@required this.checked, this.size});

  @override
  Widget build(BuildContext context) {
    final Color color = checked ? primaryColor : Colors.white;
    final Color borderColor = checked ? primaryColor : strokeCheckBoxColor;

    return Container(
      width: size ?? checkBoxHeight,
      height: size ?? checkBoxHeight,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1),
        color: color,
        shape: BoxShape.circle,
      ),
      child: checked
          ? Icon(
              Icons.check,
              size: 15,
              color: Colors.white,
            )
          : null,
    );
  }
}
