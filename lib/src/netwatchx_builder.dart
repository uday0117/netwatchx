import 'dart:async';

import 'package:flutter/material.dart';

import 'netwatchx_service.dart';
import 'network_status.dart';

class NetWatchXBuilder extends StatefulWidget {
  final Widget online;
  final Widget offline;

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
