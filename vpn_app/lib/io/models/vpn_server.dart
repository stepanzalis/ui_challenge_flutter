class VpnServer {

  final String stateName;
  final String flagAssetName;
  final int index;

  VpnServer(this.stateName, this.flagAssetName, this.index)
      : assert(stateName != null || stateName.isNotEmpty, 'Country name should not be empty'),
        assert(flagAssetName != null, 'Flag resource should not be null');
}
