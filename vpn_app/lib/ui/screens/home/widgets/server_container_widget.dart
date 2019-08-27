import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vpn_app/io/models/server_model.dart';
import 'package:vpn_app/io/models/vpn_server.dart';
import 'package:vpn_app/ui/screens/home/widgets/item_country_server_widget.dart';
import 'package:vpn_app/util/colors.dart';

class ServerContainer extends StatelessWidget {

  final VpnServer chosenServer;
  const ServerContainer({@required this.chosenServer});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => _openServerList(context),
        child: _ContainerHolder(
          child: Consumer<ServerModel>(
            builder: (context, model, child) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset('assets/images/flags/${chosenServer.flagAssetName}', width: 20, height: 20),
                SizedBox(width: 15),
                Text(
                  '${chosenServer.stateName}',
                  style: Theme.of(context).textTheme.body1.copyWith(color: primaryTextColor),
                ),
                SizedBox(width: 10),
                child,
              ],
            ),
            child: SvgPicture.asset('assets/images/down_arrow.svg', width: 8, height: 8),
          ),
        ),
      );
}

_openServerList(context) {
  final List<VpnServer> servers = ServerModel.servers;

  showModalBottomSheet(
    backgroundColor: Theme.of(context).backgroundColor,
    context: context,
    builder: (context) => Consumer<ServerModel>(
      builder: (context, model, child) => Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            child,
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: servers.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    model.changeServer(index);
                    Navigator.of(context).pop();
                  },
                  child: CountryServerItem(
                    server: servers[index],
                    selected: model.selectedIndex == index,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      child: Center(child: Text('Pick your server', style: Theme.of(context).textTheme.overline)),
    ),
  );
}

class _ContainerHolder extends StatelessWidget {

  final Widget child;
  const _ContainerHolder({@required this.child});

  @override
  Widget build(BuildContext context) => Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              blurRadius: 5.0,
            ),
          ],
        ),
        child: child,
      );
}
