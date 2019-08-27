import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vpn_app/io/models/welcome_model.dart';
import 'package:vpn_app/ui/screens/welcome/widgets/circle_dot.dart';
import 'package:vpn_app/ui/widgets/rounded_button_widget.dart';
import 'package:vpn_app/util/router.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: Container(
            child: Stack(
              children: <Widget>[
                _OnboardingPageView(),
                _PageCircleBar(),
                _GetStartedButton(),
              ],
            ),
          ),
        ),
      );
}

class _OnboardingPageView extends StatelessWidget {

  const _OnboardingPageView();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<WelcomeModel>(context, listen: false);

    return PageView.builder(
        physics: ClampingScrollPhysics(),
        onPageChanged: (index) => _onPageChanged(index, model),
        itemCount: model.widgetLength,
        itemBuilder: (context, index) => model.widgets[index]);
  }

  _onPageChanged(index, WelcomeModel model) => model.changeCurrentIndex(index);
}

class _PageCircleBar extends StatelessWidget {

  const _PageCircleBar();

  @override
  Widget build(BuildContext context) => Consumer<WelcomeModel>(
        builder: (context, model, child) => Padding(
          padding: const EdgeInsets.only(bottom: 110.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Theme.of(context).backgroundColor,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < model.widgetLength; i++) ...[
                    CircleDot(selected: i == model.currentIndex, key: UniqueKey())
                  ]
                ],
              ),
            ),
          ),
        ),
      );
}

class _GetStartedButton extends StatelessWidget {

  const _GetStartedButton();

  @override
  Widget build(BuildContext context) {
    final WelcomeModel model = Provider.of<WelcomeModel>(context);
    final double opacity = model.lastPage ? 1 : 0;

    return AnimatedOpacity(
      opacity: opacity,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: RoundedButton(
            title: 'GET STARTED',
            onTap: () => Navigator.of(context).pushNamed(Router.HOME_PAGE),
          ),
        ),
      ),
    );
  }
}
