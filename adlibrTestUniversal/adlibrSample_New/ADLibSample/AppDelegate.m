//
//  AppDelegate.m
//  ADLibSample
//
//  Created by gskang on 2016. 8. 17..
//
//

#import "AppDelegate.h"

#import <AVFoundation/AVFAudio.h>
#import <Adlib/ADLibSDK.h>
#import "ViewController.h"

@import GoogleMobileAds;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback
                                     withOptions:AVAudioSessionCategoryOptionMixWithOthers
                                           error:nil];
    
    NSLog(@"ADLIB SDK Version = %@", [ADLibSDK sdkVersion]);
    
    //TEST Google mediation
    [[GADMobileAds sharedInstance] startWithCompletionHandler:nil];
    
    //ADLIB CONFIG 5.1.4
    [ADLibSDK config:self.window];
    
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *rootNavigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = rootNavigationController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
