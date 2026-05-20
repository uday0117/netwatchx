import 'dart:async';

import 'package:flutter/material.dart';

import 'netwatchx_service.dart';
import 'network_status.dart';

/// A widget that rebuilds based on internet connectivity status.
///
/// [NetWatchXBuilder] listens to network changes and displays different widgets
/// depending on whether the device is online or offline.
///
/// Example:
/// ```dart
/// NetWatchXBuilder(
///   online: Text('You are online'),
///   offline: Text('You are offline'),
/// )
/// ```
class NetWatchXBuilder extends StatefulWidget {
  /// The widget to display when internet connection is available.
  final Widget online;

  /// The widget to display when internet connection is unavailable.
  final Widget offline;

  /// Creates a [NetWatchXBuilder] widget.
  ///
  /// Both [online] and [offline] parameters are required.
  const NetWatchXBuilder({
    super.key,
    required this.online,
    required this.offline,
  });

  @override
  State<NetWatchXBuilder> createState() => _NetWatchXBuilderState();
}

class _NetWatchXBuilderState extends State<NetWatchXBuilder> {
  late StreamSubscription subscription;

  NetworkStatus status = NetworkStatus.connected;

  @override
  void initState() {
    super.initState();

    subscription = NetWatchX.onStatusChange.listen((event) {
      setState(() {
        status = event;
      });
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return status == NetworkStatus.connected ? widget.online : widget.offline;
  }
}
