#import "FlutterToastPlugin.h"

@implementation FlutterToastPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_toast"
            binaryMessenger:[registrar messenger]];
  FlutterToastPlugin* instance = [[FlutterToastPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }else if([@"showToast" isEqualToString:call.method]) {
    NSString *msg = call.arguments[@"message"];
    UIAlertView *alert = [[UIAlertView alloc]
                                 initWithTitle:nil
                                       message:msg
                                      delegate:nil
                             cancelButtonTitle:nil
                             otherButtonTitles:nil, nil];
    [alert show];
    double duration = 0.5;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alert dismissWithClickedButtonIndex:0 animated:YES];
    });
  }else if([@"showLongToast" isEqualToString:call.method]) {
    NSString *msg = call.arguments[@"message"];
    UIAlertView *alert = [[UIAlertView alloc]
                                 initWithTitle:nil
                                       message:msg
                                      delegate:nil
                             cancelButtonTitle:nil
                             otherButtonTitles:nil, nil];
    [alert show];
    double duration = 1;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alert dismissWithClickedButtonIndex:0 animated:YES];
    });
  }else {
       result(FlutterMethodNotImplemented);
  }
}

@end
