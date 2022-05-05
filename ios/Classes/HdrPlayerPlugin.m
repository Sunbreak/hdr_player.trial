#import "HdrPlayerPlugin.h"
#if __has_include(<hdr_player/hdr_player-Swift.h>)
#import <hdr_player/hdr_player-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "hdr_player-Swift.h"
#endif

@implementation HdrPlayerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHdrPlayerPlugin registerWithRegistrar:registrar];
}
@end
