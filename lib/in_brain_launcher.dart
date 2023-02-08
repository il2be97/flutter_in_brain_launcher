import 'src/flutter_in_brain_launcher_platform_interface.dart';

class InBrainLauncher {
  Future<bool> launch({
    required String apiClientID,
    required String apiSecret,
    required String userID,
    bool isS2S = false,
  }) =>
      FlutterInBrainLauncherPlatform.instance.launch(
          apiClientID: apiClientID,
          apiSecret: apiSecret,
          userID: userID,
          isS2S: isS2S);

  Future<bool> showNativeSurvey({
    required String id,
    String? searchId,
  }) =>
      FlutterInBrainLauncherPlatform.instance
          .showNativeSurvey(id: id, searchId: searchId);
}
