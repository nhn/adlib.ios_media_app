//
//  SubAdlibAdAdmixer.m
//  AdlibNativeADSample
//
//  Created by gskang on 2015. 3. 12..
//  Copyright (c) 2015년 gskang. All rights reserved.
//

#import "SubAdlibAdAdmixer.h"

#define ADMIXER_ID @"ADMIXER_ID"

@interface SubAdlibAdAdmixer () <AdMixerViewDelegate, AdMixerInterstitialDelegate>

@property (nonatomic, strong) AdMixerInterstitial *adMixerInters;


@end

@implementation SubAdlibAdAdmixer

// 전면광고를 사용하기 위해 정적 객체로 사용합니다.
+ (BOOL)isStaticObject
{
    return YES;
}

- (void)query:(UIViewController*)parent
{
    [super query:parent];
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        _iPad = NO;
    else
        _iPad = YES;
    
    // Create a view of the standard size at the bottom of the screen.
    if (_adView) {
        [_adView removeFromSuperview];
        self.adView = nil;
        
//        [AdMixer registerUserAdAdapterNameWithAppCode:AMA_ADAM cls:[AdamAdapter class] appCode:@"adam_app_code"];
//        [AdMixer registerUserAdAdapterNameWithAppCode:AMA_ADMOB cls:[AdmobAdapter class] appCode:@"admob_app_code"];
//        [AdMixer registerUserAdAdapterNameWithAppCode:AMA_ADMOB_ECPM cls:[AdmobECpmAdapter class] appCode:@"admob_app_code"
//        [AdMixer registerUserAdAdapterNameWithAppCode:AMA_ADPOST cls:[AdpostAdapter class] appCode:@"adpost_app_code"];
//        [AdMixer registerUserAdAdapterNameWithAppCode:AMA_CAULY cls:[CaulyAdapter class] appCode:@"cauly_app_code"];
//        [AdMixer registerUserAdAdapterNameWithAppCode:AMA_SHALLWE cls:[ShallWeAdapter class] appCode:@”shall_app_code"];
//        [AdMixer registerUserAdAdapterNameWithAppCode:AMA_TAD cls:[TAdAdapter class] appCode:@"tad_app_code"];
//        [AdMixer registerUserAdAdapterNameWithAppCode:AMA_INMOBI cls:[InmobiAdapter class] appCode:@”inmobi_app_code"];
//        [AdMixer registerUserAdAdapterNameWithAppCode:AMA_IAD cls:[IAdAdapter class] appCode:@”iad_app_code"];
//        [AdMixer registerUserAdAdapterNameWithAppCode:AMA_FACEBOOK cls:[FacebookAdapter class] appCode:@”facebook_app_code"];
       
        [AdMixer setLogLevel:AXLogLevelDebug]; // 로그 레벨 설정
      
        CGFloat ptx = [self getViewOriginX];
        _adView = [[AdMixerView alloc] initWithFrame:CGRectMake(ptx, 0, 320, 50)];
        _adView.delegate = self;
        _adView.adSize = AXBannerSize_Default; // 배너 크기 요청 조절
            
        [self.view addSubview:_adView];
    }

    AdMixerInfo *adMixerInfo = [[AdMixerInfo alloc] init];
    adMixerInfo.axKey = ADMIXER_ID;
    adMixerInfo.rtbVerticalAlign = AdMixerRTBVAlignCenter; // 고수익 배너 상/하단 여백 처리 방식 지정(AdMixerRTBVAlignTop, AdMixerRTBVAlignCenter, AdMixerRTBVAlignBottom)
    adMixerInfo.defaultAdTime = 0; // 디폴트 광고 유지 시간(초단위로 지정한 시간 이후 광고 로딩)
    
    [self.adView startWithAdInfo:adMixerInfo baseViewController:self.parentController];
}

// 플랫폼 광고 뷰의 크기를 반환합니다.
- (CGSize)size
{
    return CGSizeMake(320, 50);
}

// 플랫폼 광고뷰의 회전에 대한 처리를 수행합니다.
// 미디에이션 광고 컨테이너 뷰의 크기 변경 시 플랫폼 광고뷰의 frame을 변경합니다.
- (void)orientationChanged
{
    [super orientationChanged];
    
    CGFloat height = 50;
    
    CGFloat ptX = [self getViewOriginX];
    _adView.frame = CGRectMake(ptX, 0, 320, height);
}

// 플랫폼 광고 뷰가 미디에이션 광고 컨테이너뷰에서 사라질 때의 처리를 구현합니다.
- (void)clearAdView
{
    [super clearAdView];
    
    if(_adView != nil)
    {
        [_adView stop];
        self.adView = nil;
    }
}

// 해당 플래폼 광고에 전면광고 요청을 처리합니다.
- (void)subAdlibViewLoadInterstitial:(UIViewController*)viewController
{
    AdMixerInfo * adInfo = [[AdMixerInfo alloc] init];
    adInfo.axKey = ADMIXER_ID;
    
    AdMixerInterstitial * interstitial = [[AdMixerInterstitial alloc] init];
    self.adMixerInters = interstitial;
    
    interstitial.delegate = self;
    
    [interstitial startWithAdInfo:adInfo baseViewController:self.parentController];
}

- (CGFloat)getViewOriginX
{
    CGFloat w,w2=0;
    
    w = self.view.bounds.size.width;
    w2 = 320;
    
    return (w-w2)/2;
}

#pragma mark - 

- (void)onSucceededToReceiveAd:(AdMixerView *)adView
{
    NSLog(@"onSucceededToReceiveAd");
    
    // 화면에 광고를 보여줍니다.
    [self gotAd];
}

- (void)onFailedToReceiveAd:(AdMixerView *)adView error:(AXError *)error;
{
    NSLog(@"onFailedToReceiveAd : %@", error.errorMsg);
    
    // 광고 수신에 실패 처리를 요청합니다.
    [self failed];
}

#pragma mark - AdmixerInterstitial Delegate

- (void)onSucceededToReceiveInterstitalAd:(AdMixerInterstitial *)intersitial
{
    // 전면광고 성공을 알린다.
    [self subAdlibViewInterstitialReceived:@"admixer"];
}

- (void)onFailedToReceiveInterstitialAd:(AdMixerInterstitial *)intersitial error:(AXError *)error
{
    // 전면광고 실패를 알린다.
    [self subAdlibViewInterstitialFailed:@"admixer"];
    
    self.adMixerInters = nil;
}

- (void)onClosedInterstitialAd:(AdMixerInterstitial *)intersitial
{
    // 전면광고 닫힘을 알린다.
    [self subAdlibViewInterstitialClosed:@"admixer"];
    
    self.adMixerInters = nil;
}

@end