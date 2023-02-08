import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_in_brain_launcher_method_channel.dart';

abstract class FlutterInBrainLauncherPlatform extends PlatformInterface {
  /// Constructs a FlutterInBrainLauncherPlatform.
  FlutterInBrainLauncherPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterInBrainLauncherPlatform _instance =
      MethodChannelFlutterInBrainLauncher();

  /// The default instance of [FlutterInBrainLauncherPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterInBrainLauncher].
  static FlutterInBrainLauncherPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterInBrainLauncherPlatform] when
  /// they register themselves.
  static set instance(FlutterInBrainLauncherPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Launch InBrain with speicifc params
  Future<bool> launch({
    required String apiClientID,
    required String apiSecret,
    required String userID,
    bool isS2S = false,
  });

  /// Show native survey by specific identifier.
  Future<bool> showNativeSurvey({
    required String id,
    String? searchId,
  });
}
