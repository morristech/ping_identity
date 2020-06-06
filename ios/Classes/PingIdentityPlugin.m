#import "PingIdentityPlugin.h"
#if __has_include(<ping_identity/ping_identity-Swift.h>)
#import <ping_identity/ping_identity-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ping_identity-Swift.h"
#endif

@implementation PingIdentityPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPingIdentityPlugin registerWithRegistrar:registrar];
}
@end
