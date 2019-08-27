import 'package:flutter/material.dart';
import 'package:vpn_app/util/colors.dart';
import 'package:vpn_app/util/dimens.dart';
import 'package:vpn_app/util/string.dart';

class ConnectionStateInfo extends StatelessWidget {

  final String title;
  final bool connected;

  const ConnectionStateInfo({@required this.title, @required this.connected});

  @override
  Widget build(BuildContext context) => Material(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Container(
          height: connectionStateHeight,
          width: connectionStateWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(capitalize(title.toLowerCase()), style: Theme.of(context).textTheme.overline),
              SizedBox(width: 10),
              _ConnectionIcon(connected: connected),
            ],
          ),
        ),
      );
}

class _ConnectionIcon extends StatelessWidget {
  final double size = 10;
  final bool connected;

  const _ConnectionIcon({@required this.connected});

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: connected ? connectedStateColor : disconnectedStateColor,
          shape: BoxShape.circle,
        ),
      );
}
