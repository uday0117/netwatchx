import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'network_status.dart';

class NetWatchX {
  static Stream<NetworkStatus> get onStatusChange =>
      InternetConnection().onStatusChange.map(
        (event) => event == InternetStatus.connected
            ? NetworkStatus.connected
            : NetworkStatus.disconnected,
      );

  static Future<bool> isConnected() async {
    return await InternetConnection().hasInternetAccess;
  }
}
