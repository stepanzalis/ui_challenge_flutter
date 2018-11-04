import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenges/theme/text_styles.dart';

class AnimatedScreen extends StatefulWidget {
  AnimatedScreen({@required this.appBar, @required this.child});

  final String appBar;
  final Widget child;

  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _tween;

  var isOpen = false;

  @override
  Widget build(BuildContext context) {
    final openPercent =
        Interval(0.0, 0.8, curve: Curves.easeOut).transform(_tween.value);

    final slideAmount = 255.0 * openPercent;
    final contentScale = 1 - (0.35 * openPercent);

    return Transform(
        transform: Matrix4.translationValues(slideAmount, 0.0, 0.0)
          ..scale(contentScale, contentScale),
        alignment: Alignment.centerLeft,
        child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                new BoxShadow(
                  color: Colors.blue[100],
                  offset: Offset(0.0, 3.0),
                  blurRadius: 50.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: Scaffold(
                appBar: getAppBar(widget.appBar), body: widget.child)));
  }

  Widget getAppBar(String appBarText) {
    return AppBar(
      title: Text(appBarText,
          style: MyTextTheme().getLightSmallGrey().copyWith(fontSize: 20.0)),
      leading: IconButton(
          icon: Icon(CupertinoIcons.back, color: Colors.grey[400], size: 25.0),
          onPressed: () {
            isOpen
                ? _animationController.reverse()
                : _animationController.forward();
            setState(() {
              isOpen = !isOpen;
            });
          }),
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
          icon: Image(
              image: AssetImage("assets/images/ic_trash.png"),
              width: 25,
              height: 25),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _tween = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
