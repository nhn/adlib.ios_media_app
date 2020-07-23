//
//  MediationSampleController.m
//  ADLibSample
//
//  Created by gskang on 2016. 8. 17..
//
//

#import "MediationSampleController.h"

#import <Adlib/ADLibBanner.h>
#import "SampleKey.h"
#import "ALAdapterAdmobTest.h"

//#import "ALAdapterAdmob.h"
//#import "ALAdapterFacebook.h"
//#import "ALAdapterAdMixer.h"
//#import "ALAdapterAdfit.h"
//#import "ALAdapterCauly.h"
//#import "ALAdapterInmobi.h"
//#import "ALAdapterMezzo.h"


@interface MediationSampleController () <ALInterstitialAdDelegate, ALAdBannerViewDelegate>

@property (nonatomic, strong) ALAdBannerView *bannerView;
@property (nonatomic, strong) ALInterstitialAd *interstitialAd;

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, readonly) BOOL isHalf;
@property (nonatomic, readonly) NSString *mTitle;

@end

@implementation MediationSampleController

- (instancetype)initWithTitle:(NSString *)aTitle isHalf:(BOOL)aIsHalf
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        _mTitle = aTitle;
        _isHalf = aIsHalf;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    return [self initWithTitle:@"" isHalf:NO];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [self initWithTitle:@"" isHalf:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self setInterstitialADButton];

    //InterstitialAD
    [self setIntersAD];
    
    //LineBanner AD
    [self setBannerAD];
    
    [self.view addSubview:_bannerView];
    
    if (@available(iOS 11.0, *)) {
        [[_bannerView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
    } else {
        [[_bannerView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor] setActive:YES];
    }
    [[_bannerView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor] setActive:YES];
    [[_bannerView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor] setActive:YES];
    if (_isHalf) {
        [[_bannerView.heightAnchor constraintEqualToConstant:250] setActive:YES];
    } else {
        [[_bannerView.heightAnchor constraintEqualToConstant:50] setActive:YES];
    }
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setTitle:_mTitle];
    [self loadAdlibAdvert];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [_bannerView stopAdView];
}

- (void)loadAdlibAdvert
{
    //앱 업데이트시에는 발급받으신 키로 교체하세요.
    NSString *appKey = ADLIB_APP_KEY;
    
    [_bannerView startAdViewWithKey:appKey
                 rootViewController:self
                         adDelegate:self];
}

- (void)setInterstitialADButton
{
    _button = [[UIButton alloc] initWithFrame:CGRectZero];
    [_button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_button setTitle:@"Request InterstitialAD" forState:UIControlStateNormal];
    [_button setBackgroundColor:[UIColor blueColor]];
    [_button.titleLabel setTextColor:[UIColor blackColor]];
    [_button addTarget:self action:@selector(requestIntersAd) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_button];
    [[_button.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] setActive:YES];
    [[_button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
}

- (void)setIntersAD
{
    // 미디에이션 플랫폼 등록
    [ALMediation registerPlatform:ALMEDIATION_PLATFORM_ADMOB withClass:[ALAdapterAdmobTest class]];
    
    _interstitialAd = [[ALInterstitialAd alloc] initWithRootViewController:self];
    //미디에이션 플랫폼 전면배너 키설정
    [_interstitialAd setKey:ADMOB_INTERSTITIAL_ID forPlatform:ALMEDIATION_PLATFORM_ADMOB];
    _interstitialAd.isTestMode = YES;
}

- (void)setBannerAD
{
    _bannerView = [[ALAdBannerView alloc] initWithFrame:CGRectZero];
    [_bannerView setTranslatesAutoresizingMaskIntoConstraints:NO];
    // 미디에이션 플랫폼 띠배너 키설정
    [_bannerView setKey:ADMOB_BAND_ID forPlatform:ALMEDIATION_PLATFORM_ADMOB];
    _bannerView.isTestMode = YES;
    _bannerView.repeatLoop = YES;
    if (_isHalf) {
        #warning - 하프 배너 사이즈로 노출을 원할 시 반드시 확인합니다.
        _bannerView.bannerSize = AL_SIZE_HALF;  // 하프 배너 설정
    }
}

- (void)requestIntersAd
{
    //앱 업데이트시에는 발급받으신 키로 교체하세요.
    NSString *appKey = ADLIB_APP_KEY;
    
    [_interstitialAd requestAdWithKey:appKey adDelegate:self];
}

#pragma mark - ALInterstitialAd delegate
/**
 *  전면광고 요청이 성공에 대한 알림
 */
- (void)alInterstitialAd:(ALInterstitialAd *)interstitialAd didReceivedAdAtPlatform:(ALMEDIATION_PLATFORM)platform
{
    NSLog(@"didReceivedAdAtPlatform : %zd", platform);
}

/**
 * *  전면광고 요청 실패에 대한 알림
 */
- (void)alInterstitialAd:(ALInterstitialAd *)interstitialAd didFailedAdAtPlatform:(ALMEDIATION_PLATFORM)platform
{
    NSLog(@"didFailedAdAtPlatform : %zd", platform);
}

/**
 *  모든 전면광고 요청 실패에 대한 알림
 */
- (void)alInterstitialAdDidFailedAd:(ALInterstitialAd *)interstitialAd
{
    NSLog(@"alInterstitialAdDidFailedAd");
}

#pragma mark - ALAdBannerView delegate

/**
 *  띠 배너 광고요청 재개 상태에서 내부적인 상태 변화를 통지합니다.
 */
- (void)alAdBannerView:(ALAdBannerView *)bannerView didChangeState:(ALMEDIATION_STATE)state withExtraInfo:(id)info
{
    NSLog(@"bannerView state : %@, info = %@", [ALMediationDefine descriptionOfState:state], info);
}

/**
 *  플랫폼에 요청한 띠배너 광고의 성공 상태를 반환합니다.
 */
- (void)alAdBannerView:(ALAdBannerView *)bannerView didReceivedAdAtPlatform:(ALMEDIATION_PLATFORM)platform
{
    NSLog(@"bannerView receivedAd : %@", [ALMediationDefine nameOfPlatform:platform]);
}

/**
 *  플랫폼에 요청한 띠배너 광고의 실패 상태를 반환합니다.
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
