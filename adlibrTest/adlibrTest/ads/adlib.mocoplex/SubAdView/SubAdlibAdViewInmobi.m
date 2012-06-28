/*
 * adlibr - Library for mobile AD mediation.
 * http://adlibr.com
 * Copyright (c) 2012 Mocoplex, Inc.  All rights reserved.
 * Licensed under the BSD open source license.
 */

/*
 * confirmed compatible with Inmobi SDK 350
 */

#import "SubAdlibAdViewInmobi.h"

// 여기에 인모비에서 발급받은 key 를 입력하세요.
// 마찬가지로 애드립의 스케줄 설정창에도 발급받은 키를 입력해주세요.
// 같은 키를 소스파일, 애드립 페이지 두 곳에 입력해야 리워드 포인트를 적립받을 수 있습니다.
#define INMOBI_ID @"INMOBI - APP - ID"

@implementation SubAdlibAdViewInmobi

- (void)query:(UIViewController*)parent
{
    [super query:parent];    
    
    IMAdRequest *request = [IMAdRequest request];
        
    // 애드립 리워드 포인트 적립을 위해 필요한 코드입니다. -- 삭제하지 마세요.
    // do not modify this area -- implemented to get reward point
    request.paramsDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"c_adlib", @"tp", nil];
    // do not modify this area -- implemented to get reward point
    // 애드립 리워드 포인트 적립을 위해 필요한 코드입니다. -- 삭제하지 마세요.

    bShowed = false;
    
    ad = [[IMAdView alloc] initWithFrame:CGRectMake(0, 0, 320, 50) imAppId:INMOBI_ID imAdUnit:IM_UNIT_320x50 rootViewController:parent];    
    ad.delegate = self;
    ad.refreshInterval = 20;
    ad.rootViewController = parent;
        
    request.testMode = NO;
    ad.imAdRequest = request;

    [self.view addSubview:ad];
}

- (void)clearAdView
{
    ad.delegate = nil;
    [ad release];
    ad = nil;
    
    [super clearAdView];
}

- (CGSize)size
{
    return CGSizeMake(320, 50);
}

#pragma mark InMobiAdDelegate methods

- (void)adViewDidFinishRequest:(IMAdView *)view {
    //NSLog(@"<<<<<ad request completed>>>>>");
    [self gotAd];
    bShowed = true;
}

- (void)adView:(IMAdView *)view didFailRequestWithError:(IMAdError *)error {
    //NSLog(@"<<<< ad request failed.>>>, error=%@",[error localizedDescription]);
    //NSLog(@"error code=%d",[error code]);
    
    if(bShowed)
        return;
        
    if([error code] == kIMADNoFillError || [error code] == kIMADInvalidRequestError || [error code] == kIMADInternalError)
        [self failed];
}

- (void)adViewDidDismissScreen:(IMAdView *)adView {
    //NSLog(@"adViewDidDismissScreen");
}

- (void)adViewWillDismissScreen:(IMAdView *)adView {
    //NSLog(@"adViewWillDismissScreen");
}

- (void)adViewWillPresentScreen:(IMAdView *)adView {
    //NSLog(@"adViewWillPresentScreen");
}

- (void)adViewWillLeaveApplication:(IMAdView *)adView {
    //NSLog(@"adViewWillLeaveApplication");
}


@end