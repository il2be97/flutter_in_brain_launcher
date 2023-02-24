import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_in_brain_launcher_platform_interface.dart';

final _showingSurveyException = Exception('showing survey failed');

/// An implementation of [FlutterInBrainLauncherPlatform] that uses method channels.
class MethodChannelFlutterInBrainLauncher
    extends FlutterInBrainLauncherPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_in_brain_launcher');

  Future<bool> launch({
    required String apiClientID,
    required String apiSecret,
    required String userID,
    bool isS2S = false,
  }) async {
    return methodChannel.invokeMethod<bool>(
      'launch_in_brain',
      <String, Object>{
        'apiClientID': apiClientID,
        'apiSecret': apiSecret,
        'userID': userID,
        'isS2S': isS2S,
      },
    ).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
      return false;
    }).then((value) => value ?? false);
  }

  @override
  Future<List<InBrainNativeSurveyObject>> getNativeSurveys() => methodChannel
      .invokeListMethod<dynamic>('get_native_survey')
      .then(
        (value) {
          return value?.map((e) => InBrainNativeSurveyObject.from(e)).toList() ?? [];
        },
      );

  @override
  Future<bool> showNativeSurvey({
    required String id,
    String? searchId,
  }) {
    return methodChannel.invokeMethod<bool>(
      "show_native_survey",
      <String, Object>{
        'id': id,
        if (searchId != null) 'searchId': searchId,
      },
    ).then((value) {
      if (value == null) {
        throw _showingSurveyException;
      }
      return value;
    });
  }
}
