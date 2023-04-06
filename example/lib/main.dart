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
                  onPressed: _handleCheck,
                  child: const Text("Check Survey availabylity")),
              const SizedBox(
                height: 40,
              ),
              TextButton(
                  onPressed: () => _showSurveysWall(),
                  child: const Text("Show surveys wall")),
              const SizedBox(
                height: 40,
              ),
              TextButton(
                  onPressed: _handleGetNativeSurveys,
                  child: const Text("Get native in brain")),
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
        apiClientID: 'e551ff8e-a707-40d8-a045-d4c9ac3dcdbe',
        apiSecret:
            'Y89l4iZsMLdvaq3aBEJ84FY1QpEHEySnBTxnL47Cl4gaRHMZ82fMu80Tg3gfAVy03+iHtWMup/LlaW+h512R2g==',
        userID: '1',
      );
      print(result);
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleCheck() async {
    try {
      final InBrainLauncher launcher = InBrainLauncher();
      final result = await launcher.checkSurveysAvailability();
      print(result);
    } catch (error) {
      print(error);
    }
  }

  Future<void> _showSurveysWall() async {
    final InBrainLauncher launcher = InBrainLauncher();
    try {
      final result = await launcher.showSurveysWall();
      print(result);
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleGetNativeSurveys() async {
    final InBrainLauncher launcher = InBrainLauncher();
    try {
      final result = await launcher.getNativeSurveys();
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
    } catch (error) {}
  }
}
