import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_in_brain_launcher/in_brain_launcher.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                  onPressed: _handleConfigure,
                  child: const Text("Configure in brain")),
              const SizedBox(
                height: 40,
              ),
              TextButton(
                  onPressed: _showNativeSurve,
                  child: const Text("Run Native Survey")),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleConfigure() async {
    final InBrainLauncher launcher = InBrainLauncher();
    try {
      final result = await launcher.launch(
        apiClientID: 'Your Api Client ID',
        apiSecret: 'Your Api Secret',
        userID: 'test_user1',
      );
      print(result);
    } catch (error) {
      print(error);
    }
  }

  Future<void> _showNativeSurve() async {
    final InBrainLauncher launcher = InBrainLauncher();
    try {
      final result =
          await launcher.showNativeSurvey(id: 'Native survey identifier');
      print(result);
    } catch (error) {
     }
  }
}
