#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import <Flutter/Flutter.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    
    FlutterViewController* controller=(FlutterViewController*)self.window.rootViewController;
    FlutterMethodChannel* toastChannel=[FlutterMethodChannel
                                 methodChannelWithName:@"cn.libery.fluttertoast.FlutterToastPlugin"
                                 binaryMessenger:controller];
    [toastChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        // TODO
    }];
    
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
