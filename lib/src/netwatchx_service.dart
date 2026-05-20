import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'network_status.dart';

/// NetWatchX service for monitoring internet connectivity.
///
/// Provides static methods and streams to check network status
/// and listen to connectivity changes in real-time.
class NetWatchX {
  /// A stream that emits [NetworkStatus] updates whenever the internet connectivity changes.
  ///
  /// Listen to this stream to receive real-time updates about network connectivity:
  /// ```dart
  /// NetWatchX.onStatusChange.listen((status) {
  ///   if (status == NetworkStatus.connected) {
  ///     print('Connected to internet');
  ///   } else {
  ///     print('Disconnected from internet');
  ///   }
  /// });
  /// ```
  static Stream<NetworkStatus> get onStatusChange =>
      InternetConnection().onStatusChange.map(
        (event) => event == InternetStatus.connected
            ? NetworkStatus.connected
            : NetworkStatus.disconnected,
      );

  /// Checks if the device currently has internet access.
  ///
  /// Returns a [Future] that completes with `true` if connected to internet,
  /// or `false` otherwise.
  ///
  /// Example:
  /// ```dart
  /// bool connected = await NetWatchX.isConnected();
  /// if (connected) {
  ///   // Proceed with network operations
  /// }
  /// ```
  static Future<bool> isConnected() async {
    return await InternetConnection().hasInternetAccess;
  }
}
