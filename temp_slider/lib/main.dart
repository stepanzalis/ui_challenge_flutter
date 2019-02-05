import 'package:flutter/material.dart';
import 'package:temperature_oval/type_enum.dart';
import 'package:temperature_oval/widgets/central_temp.dart';
import 'package:temperature_oval/widgets/icon_slider.dart';
import 'package:temperature_oval/widgets/icon_text.dart';
import 'package:temperature_oval/widgets/round_button.dart';
import 'package:temperature_oval/widgets/ruler.dart';
import 'colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  double value = 3;
  num temp = 77;
  List<Widget> sampleData = <Widget>[];

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: Icon(Icons.arrow_back),
      ),
      body: Container(
        color: backgroundColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: MediaQuery.of(context).size.height / 4,
                  left: 0,
                  child: CentralTemp(temperature: temp.toString())),
              Positioned(top: 30, left: MediaQuery.of(context).size.width / 1.3, child: RulerWidget(size: MediaQuery.of(context).size, function: setTemp)),
              Positioned(
                  left: 30,
                  top: MediaQuery.of(context).size.height / 1.9,
                  child: IconTextWidget(
                      icon: Icons.alarm,
                      text: 'Set smart schedule',
                      type: IconText.greyIconPinkText)),
              Positioned(
                  left: 30,
                  top: MediaQuery.of(context).size.height / 1.7,
                  child:
                      Container(height: 80, child: Row(children: sampleData))),
              Positioned(
                  left: 30,
                  top: MediaQuery.of(context).size.height / 1.4,
                  child: IconSlider()),
              Positioned(
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: IconTextWidget(
                          icon: Icons.power_settings_new,
                          text: 'Hold to turn off',
                          type: IconText.pinkIconGreyText)))
            ],
          ),
        ),
      ));

      setTemp(temp) {
        setState(() {
           this.temp = temp.round();
        });
      }

  @override
  void initState() {
    sampleData.add(RoundButton(icon: Icons.ac_unit));
    sampleData.add(SizedBox(width: 15));
    sampleData.add(RoundButton(icon: Icons.place));
    sampleData.add(SizedBox(width: 15));
    sampleData.add(RoundButton(icon: Icons.wb_sunny));

    super.initState();
  }
}
