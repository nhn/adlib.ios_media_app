//
//  HalfMediationSampleController.m
//  ADLibSample
//
//  Created by Adlib on 08/08/2019.
//

#import "HalfMediationSampleController.h"

#import <Adlib/ADLibBanner.h>
#import "SampleKey.h"

//#import "ALAdapterAdmob.h"
//#import "ALAdapterAdfit.h"

@interface HalfMediationSampleController () <ALAdBannerViewDelegate>

@property (nonatomic) IBOutlet ALAdBannerView *bannerView;

@end

@implementation HalfMediationSampleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        [self setAutomaticallyAdjustsScrollViewInsets:NO];
    }
    
    // 미디에이션 플랫폼 등록
    //[ALMediation registerPlatform:ALMEDIATION_PLATFORM_ADMOB withClass:[ALAdapterAdmob class]];
    //[ALMediation registerPlatform:ALMEDIATION_PLATFORM_ADAM withClass:[ALAdapterAdfit class]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 미디에이션 플랫폼 하프배너 키설정
    //[_bannerView setKey:ADMOB_BAND_ID forPlatform:ALMEDIATION_PLATFORM_ADMOB];
    //[_bannerView setKey:ADFIT_KEY forPlatform:ALMEDIATION_PLATFORM_ADAM];
    
    _bannerView.isTestMode = YES;
    _bannerView.repeatLoop = YES;
    _bannerView.bannerSize = AL_SIZE_HALF;  // 하프 배너 설정
    
    //발급받으신 애드립 키값을 넣어주세요.
    NSString *appKey = @"Input Your Adlib Key";
    
    [_bannerView startAdViewWithKey:appKey
                 rootViewController:self
                         adDelegate:self];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [_bannerView stopAdView];
}


#pragma mark - ALAdBannerView delegate

/**
 *  하프배너 광고요청 재개 상태에서 내부적인 상태 변화를 통지합니다.
 */
- (void)alAdBannerView:(ALAdBannerView *)bannerView didChangeState:(ALMEDIATION_STATE)state withExtraInfo:(id)info
{
    NSLog(@"bannerView state : %@, info = %@", [ALMediationDefine descriptionOfState:state], info);
}

/**
 *  플랫폼에 요청한 하프배너 광고의 성공 상태를 반환합니다.
 */
- (void)alAdBannerView:(ALAdBannerView *)bannerView didReceivedAdAtPlatform:(ALMEDIATION_PLATFORM)platform
{
    NSLog(@"bannerView receivedAd : %@", [ALMediationDefine nameOfPlatform:platform]);
}

/**
 *  플랫폼에 요청한 하프배너 광고의 실패 상태를 반환합니다.
 */
- (void)alAdBannerView:(ALAdBannerView *)bannerView didFailedAdAtPlatform:(ALMEDIATION_PLATFORM)platform
{
    NSLog(@"bannerView failedAd : %@", [ALMediationDefine nameOfPlatform:platform]);
}

//등록된 모든 플랫폼 광고의 실패 상태를 반환합니다.
- (BOOL)alAdBannerViewDidFailedAtAllPlatform:(ALAdBannerView *)bannerView
{
    return YES;
}

@end


