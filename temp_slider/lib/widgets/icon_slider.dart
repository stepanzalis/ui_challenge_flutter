import 'dart:math';

import 'package:flutter/material.dart';
import 'package:temperature_oval/colors.dart';

class IconSlider extends StatefulWidget {
  const IconSlider({
    Key key,
  }) : super(key: key);

  @override
  IconSliderState createState() => new IconSliderState();
}

class IconSliderState extends State<IconSlider> with TickerProviderStateMixin {
  var sliderValue = 3.0;

  AnimationController _animationController;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: AnimatedBuilder(
              animation: _animationController,
              child: ImageIcon(AssetImage('assets/ic_ac.png'),
                  color: greyColor, size: 20.0),
              builder: (context, widget) => Transform.rotate(
                  angle: _animationController.value * pi, child: widget),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            child: Slider(
                value: sliderValue,
                min: 0,
                max: 10,
                onChanged: (double newValue) {
                  setState(() {
                    sliderValue = newValue;
                    _animationController.forward();

                     _animationController.addStatusListener((status) {
                        if (status == AnimationStatus.completed) {
                          _animationController.value = 0;
                        }
                    });
                  });
                },
                activeColor: pinkColor,
                inactiveColor: greyColor),
          )
        ],
      );

  @override
  void initState() {
    _animationController = new AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
