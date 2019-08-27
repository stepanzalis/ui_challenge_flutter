import 'package:flutter/material.dart';
import 'package:vpn_app/util/colors.dart';
import 'package:vpn_app/util/dimens.dart';

class RoundedButton extends StatelessWidget {

  final String title;
  final bool filled;
  final Function onTap;

  const RoundedButton({@required this.title, this.filled = true, this.onTap});

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = filled ? primaryColor : Colors.white;
    final Color borderSideColor = filled ? primaryColor : disconnectedButtonColor;

    return MaterialButton(
      height: primaryButtonHeight,
      padding: EdgeInsets.only(left: 40, right: 40),
      color: backgroundColor,
      onPressed: onTap,
      elevation: 2,
      child: Text(
        title,
        style: filled
            ? Theme.of(context).textTheme.button
            : Theme.of(context).textTheme.button.copyWith(color: disconnectedTextColor),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderSideColor),
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}
