import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tim_flutterwave/example.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TimFlutterEntrance());
}

class TimFlutterEntrance extends StatelessWidget {
  const TimFlutterEntrance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Flutterwave payment',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: const TimFlutterExample(),
    );
  }
}
