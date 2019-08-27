import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vpn_app/ui/screens/home/widgets/stroke_circle_widget.dart';
import 'package:vpn_app/util/colors.dart';
import 'package:vpn_app/util/dimens.dart';

class ConnectionStateCircleWidget extends StatelessWidget {
  final double circleSize;
  final bool connected;

  const ConnectionStateCircleWidget({this.circleSize = 200, @required this.connected})
      : assert(circleSize >= 0, '$ConnectionStateCircleWidget must be bigger then zero');

  @override
  Widget build(BuildContext context) {
    final Color outerCircleColor = connected ? primaryColor : outerDisconnectedColor;
    final Color innerCircleColor = connected ? innerConnectedColor : innerDisconnectedColor;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        StrokedCircle(circleSize: circleSize, color: outerCircleColor),
        StrokedCircle(circleSize: outerCircleSize, color: innerCircleColor),
        _InnerIconCircle(circleSize: innerCircleSize, connected: connected),
      ],
    );
  }
}

class _IconWidget extends StatelessWidget {
  final String imagePath;
  final double size;

  const _IconWidget({@required this.imagePath, this.size = 30, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
        imagePath,
        width: size,
        height: size,
      );
}

class _InnerIconCircle extends StatelessWidget {
  final bool connected;
  final double circleSize;

  _InnerIconCircle({@required this.connected, this.circleSize = 160});

  @override
  Widget build(BuildContext context) {
    final List<Color> gradientColors = connected ? connectedGradientColors : disconnectedGradientColors;
    final CrossFadeState currentFadeState = connected ? CrossFadeState.showSecond : CrossFadeState.showFirst;

    return Container(
      width: circleSize,
      height: circleSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: gradientColors,
        ),
      ),
      child: Center(
        child: AnimatedCrossFade(
          duration: Duration(milliseconds: 300),
          firstChild: _IconWidget(imagePath: 'assets/images/arrow.svg', key: UniqueKey()),
          secondChild: _IconWidget(imagePath: 'assets/images/check_arrow.svg', key: UniqueKey()),
          crossFadeState: currentFadeState,
        ),
      ),
    );
  }
}
