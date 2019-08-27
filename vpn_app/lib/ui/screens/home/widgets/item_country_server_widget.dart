import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vpn_app/io/models/vpn_server.dart';
import 'package:vpn_app/ui/screens/home/widgets/rounded_checkbox_widget.dart';
import 'package:vpn_app/util/dimens.dart';

class CountryServerItem extends StatelessWidget {
  final VpnServer server;
  final bool selected;

  const CountryServerItem({@required this.server, this.selected});

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        height: itemStateFlagHeight,
        color: Theme.of(context).backgroundColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: SvgPicture.asset('assets/images/flags/${server.flagAssetName}'),
            ),
            Expanded(
              flex: 5,
              child: Text(
                '${server.stateName}',
                style: Theme.of(context).textTheme.body1.copyWith(fontSize: 18),
              ),
            ),
            Expanded(
              flex: 3,
              child: RoundedCheckbox(checked: selected),
            )
          ],
        ),
      );
}
