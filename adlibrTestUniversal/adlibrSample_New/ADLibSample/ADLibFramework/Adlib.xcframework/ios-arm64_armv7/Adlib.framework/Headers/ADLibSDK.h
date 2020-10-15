//
//  ADLibSDK.h
//  Adlib
//
//  Created by KangTW on 2020/09/07.
//  Copyright © 2020 payco. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADLibSDK : NSObject

+ (NSString *)sdkVersion;

+ (void)config:(UIWindow *)window;

@end
