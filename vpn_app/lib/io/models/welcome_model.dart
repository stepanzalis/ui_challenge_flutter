import 'package:flutter/cupertino.dart';
import 'package:vpn_app/ui/screens/welcome/widgets/intro_widget.dart';

class WelcomeModel with ChangeNotifier {

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List<Widget> get widgets => _introWidgetList;
  int get widgetLength => widgets.length;

  bool get lastPage => _currentIndex == widgetLength - 1;

  void changeCurrentIndex(int index) {
    if (index < 0 || index > widgetLength - 1) return null;

    _currentIndex = index;
    notifyListeners();
  }

  final List<Widget> _introWidgetList = <Widget>[
    IntroWidget(
        title: 'Secured, forever.',
        imageRes: 'assets/images/onboarding.png',
        description:
            'Curabitur lobortis id lorem id bibendum. Ut id consectetur magna. Quisque volutpat augue enim, pulvinar lobortis.'),
    IntroWidget(
        title: 'Secured, forever.',
        imageRes: 'assets/images/onboarding.png',
        description:
            'Curabitur lobortis id lorem id bibendum. Ut id consectetur magna. Quisque volutpat augue enim, pulvinar lobortis.'),
    IntroWidget(
        title: 'Secured, forever.',
        imageRes: 'assets/images/onboarding.png',
        description:
            'Curabitur lobortis id lorem id bibendum. Ut id consectetur magna. Quisque volutpat augue enim, pulvinar lobortis.'),
  ];
}
