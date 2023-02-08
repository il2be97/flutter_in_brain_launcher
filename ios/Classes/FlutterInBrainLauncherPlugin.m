#import "FlutterInBrainLauncherPlugin.h"
#if __has_include(<flutter_in_brain_launcher/flutter_in_brain_launcher-Swift.h>)
#import <flutter_in_brain_launcher/flutter_in_brain_launcher-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_in_brain_launcher-Swift.h"
#endif

@implementation FlutterInBrainLauncherPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterInBrainLauncherPlugin registerWithRegistrar:registrar];
}
@end
