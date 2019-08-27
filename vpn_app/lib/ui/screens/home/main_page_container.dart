import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vpn_app/io/models/connection_model.dart';
import 'package:vpn_app/io/models/server_model.dart';
import 'package:vpn_app/io/models/vpn_server.dart';
import 'package:vpn_app/ui/screens/home/widgets/connection_info_widget.dart';
import 'package:vpn_app/ui/screens/home/widgets/connection_state_circle_widget.dart';
import 'package:vpn_app/ui/screens/home/widgets/server_container_widget.dart';
import 'package:vpn_app/ui/widgets/rounded_button_widget.dart';
import 'package:vpn_app/util/dimens.dart';

class MainPageContainer extends StatelessWidget {
  const MainPageContainer();

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).backgroundColor,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _ConnectionStateInfo(),
                SizedBox(height: separatorHeight),
                _ConnectionStateCircle(),
                SizedBox(height: separatorHeight),
                _ConnectionButton(),
              ],
            ),
            _ServerBottomContainer()
          ],
        ),
      );
}

class _ConnectionStateCircle extends StatelessWidget {
  const _ConnectionStateCircle();

  @override
  Widget build(BuildContext context) => Consumer<ConnectionModel>(
        builder: (context, model, child) => ConnectionStateCircleWidget(
          circleSize: connectionCircleSize,
          connected: model.isConnected,
        ),
      );
}

class _ConnectionButton extends StatelessWidget {
  const _ConnectionButton();

  @override
  Widget build(BuildContext context) => Consumer<ConnectionModel>(
        builder: (context, model, child) => RoundedButton(
          title: model.buttonTitle,
          filled: model.isConnected,
          onTap: () => model.changeConnectionState(),
        ),
      );
}

class _ConnectionStateInfo extends StatelessWidget {
  const _ConnectionStateInfo();

  @override
  Widget build(BuildContext context) => Consumer<ConnectionModel>(
        builder: (context, model, child) => ConnectionStateInfo(
          title: model.connectionStateTitle,
          connected: model.isConnected,
        ),
      );
}

class _ServerBottomContainer extends StatelessWidget {
  const _ServerBottomContainer();

  @override
  Widget build(BuildContext context) {
    final VpnServer selectedServer = Provider.of<ServerModel>(context).selectedServer;

    return Align(
      alignment: Alignment.bottomCenter,
      child: ServerContainer(chosenServer: selectedServer),
    );
  }
}
