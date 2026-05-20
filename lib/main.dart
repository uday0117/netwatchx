import 'package:flutter/material.dart';
import 'package:netwatchx/netwatchx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String networkStatus = "Checking Internet...";

  @override
  void initState() {
    super.initState();

    /// Listen network changes
    NetWatchX.onStatusChange.listen((status) {
      setState(() {
        if (status == NetworkStatus.connected) {
          networkStatus = "Internet Connected ✅";
        } else {
          networkStatus = "No Internet ❌";
        }
      });
    });

    /// Initial internet check
    checkInternet();
  }

  Future<void> checkInternet() async {
    bool isConnected = await NetWatchX.isConnected();

    setState(() {
      networkStatus = isConnected ? "Internet Connected ✅" : "No Internet ❌";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("NetWatchX Example")),
        body: Center(
          child: Text(
            networkStatus,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
