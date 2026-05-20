# NetWatchX 🌐

[![pub package](https://img.shields.io/pub/v/netwatchx.svg)](https://pub.dev/packages/netwatchx)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A lightweight Flutter package for real-time internet connectivity monitoring. NetWatchX provides an easy way to check internet connection status and listen for network changes in your Flutter applications.

## Features ✨

- 🔄 **Real-time monitoring** - Listen to internet connectivity changes as they happen
- ✅ **Simple API** - Easy-to-use methods for checking connection status
- 🎨 **Builder Widget** - Use `NetWatchXBuilder` for reactive UI based on connection status
- 📦 **Lightweight** - Minimal dependencies and optimized performance
- 🚀 **Easy Integration** - Get started in minutes with simple setup

## Getting Started 🚀

### Installation

Add `netwatchx` to your `pubspec.yaml`:

```yaml
dependencies:
  netwatchx: ^1.0.0
```

Then run:

```bash
flutter pub get
```

### Platform Setup

#### Android

Add the following permissions to your `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
```

#### iOS

Add the following to your `ios/Runner/Info.plist`:

```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

## Usage 📱

### Basic Example

```dart
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

    // Listen to network changes
    NetWatchX.onStatusChange.listen((status) {
      setState(() {
        if (status == NetworkStatus.connected) {
          networkStatus = "Internet Connected ✅";
        } else {
          networkStatus = "No Internet ❌";
        }
      });
    });

    // Initial internet check
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
      home: Scaffold(
        appBar: AppBar(title: const Text("NetWatchX Example")),
        body: Center(
          child: Text(
            networkStatus,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
```

### Using NetWatchXBuilder Widget

```dart
import 'package:flutter/material.dart';
import 'package:netwatchx/netwatchx.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NetWatchXBuilder(
      online: const Text('You are online! ✅'),
      offline: const Text('You are offline! ❌'),
    );
  }
}
```

### Check Connection Status

```dart
// One-time check
bool isConnected = await NetWatchX.isConnected();

if (isConnected) {
  print('Internet is available');
} else {
  print('No internet connection');
}
```

### Listen to Connection Changes

```dart
StreamSubscription<NetworkStatus> subscription = 
  NetWatchX.onStatusChange.listen((status) {
    if (status == NetworkStatus.connected) {
      print('Connected to internet');
    } else {
      print('Disconnected from internet');
    }
  });

// Don't forget to cancel the subscription when done
subscription.cancel();
```

## API Reference 📚

### NetWatchX

#### Methods

- `static Stream<NetworkStatus> onStatusChange` - Stream that emits network status changes
- `static Future<bool> isConnected()` - Returns `true` if internet is available, `false` otherwise

### NetWatchXBuilder

#### Properties

- `online` (required) - Widget to display when internet is connected
- `offline` (required) - Widget to display when internet is disconnected

### NetworkStatus

Enum with two values:
- `NetworkStatus.connected` - Internet is available
- `NetworkStatus.disconnected` - Internet is not available

## Additional Information 📖

### Contributing

Contributions are welcome! If you find a bug or want to add a feature:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Issues

If you encounter any issues or have questions, please file them on the [issue tracker](https://github.com/uday0117/netwatchx/issues).

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Author

Created by **UKSolutions**

### Support

If you like this package, please give it a ⭐ on [GitHub](https://github.com/uday0117/netwatchx)!
