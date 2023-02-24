import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_in_brain_launcher_method_channel.dart';

class InBrainNativeSurveyObject {
  final String id;
  final String searchId;
  final int rank;
  final int time;
  final double value;
  final bool currencySale;
  final double multiplier;

  InBrainNativeSurveyObject(this.id, this.searchId, this.rank, this.time,
      this.value, this.currencySale, this.multiplier);

  factory InBrainNativeSurveyObject.from(Map<Object?, dynamic> map) {
    return InBrainNativeSurveyObject(
      map['id'],
      map['searchId'],
      map['rank'],
      map['time'],
      map['value'],
      map['currencySale'],
      map['multiplier'],
    );
  }
}

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

  /// Get in brain native surveys.
  Future<List<InBrainNativeSurveyObject>> getNativeSurveys();

  /// Show native survey by specific identifier.
  Future<bool> showNativeSurvey({
    required String id,
    String? searchId,
  });
}
