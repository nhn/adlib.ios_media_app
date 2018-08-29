# ADLib iOS SDK 적용 샘플 프로젝트

애드립 광고 연동 및 애드립에서 제공하는 광고 플랫폼 미디에이션 연동을 적용하기위한 샘플 프로젝트를 포함합니다.

# 프로젝트 설정 및 가이드 
* [프로젝트 설정 가이드 링크](http://developer.adlibr.com/guide/Ios)

# SDK Version History

|버전|내용|
|---|---|
|5.0.0.0<br/>(2018.06.08)|Bitcode 지원<br/>미디에이션 워터폴 방식 변경(광고 노출 성공하는 경우 스케쥴 index 초기화)<br/>중지된 미디에이션 삭제<br/>샘플 프로젝트 업데이트|
|4.3.7.0<br/>(2017.10.30)|SDK 내부 동작 로직수정 버전자동 최적화 처리 로직 수정 버전|
|4.3.6.x<br/>(2017.09.07)|띠배너 미디에이션 뷰 내부 예외처리 코드 추가해서 배포<br>이후 4.3.6.x 버전의 경우 해당 내용의 추가적인 소스 수정이 발생한 마이너 배포버전<br>RTB Native 관련 불필요한 소스 제거|
|4.3.4.2<br/>(2017.05.30)|네이티브 동영상 광고 기본 UI 변경|
|4.3.0.7<br/>(2017.03.31)|SDK 미디에이션 기능 업데이트|
|4.3.0.0<br/>(2017.02.21)|SDK 네이티브 동영상광고 상품추가|
|4.2.3.0<br/>(2017.01.18)|SDK 배너뷰 BackFill 지원기능 추가|
|4.2.2.0<br/>(2016.12.05)|SDK 내부개선|
|4.2.1.0<br/>(2016.09.01)|전면광고 상품에 동영상 앱광고 상품 추가|
|4.2.0.1<br/>(2016.08.22)|애드립 및 미디에이션 광고 적용 신규 클래스 지원|
|4.1.5.4<br/>(2016.03.24)|3D 엔진업데이트(엔진업데이트에 따른 리소스파일 교체(*.lua파일 최신으로 교체 필수))|
|4.1.5.2<br/>(2016.01.22)|3D ICon 광고 상품 추가 및 관련 샘플 추가|
|4.1.4.0<br/>(2015.10.19)|iOS 9 빌드 적용<br/>BitCode Compile 미적용 버전(필요시 개별요청)<br/>ADLibSession 일부 클래스 메소드 제거<br/>ALNativeAdTableHelper 관련 메소드 수정|
|4.1.3.1<br/>(2015.7.31)|네이티브 지면 광고 지원 및 샘플 프로젝트 추가|
|4.1.2.0<br/>(2015.7.6)|광고 관련 UIWebView 처리 수정|
|4.1.1.0<br/>(2015.6.25)|광고 컨테이너 뷰 내부에서 배너뷰의 위치 상/하단 정렬 옵션 추가|
|4.1.0.0<br/>(2015.6.12)|3D 광고 추가<br>3D 광고 지원에 필요한 프로젝트 설정 추가|
|4.0.2.0<br/>(2015.5.19)|미디에이션 기능 개선|
|4.0.1.0<br/>(2015.5.13)|디버깅 모드 로그 추가|
|4.0.0.0<br/>(2015.3.19)|비디오 광고 추가|


# ADLib iOS SDK 적용 가이드

애드립 iOS SDK를 사용하여 애드립 광고를 노출하는 방법을 제공합니다.<br>또한 기타 광고 플랫폼을 사용하여 미디에이션 기능을 사용하는 방법을 제공합니다.

## 지원 광고 플랫폼

각 플랫폼의 SDK 버전은 API call 방식이 변경되지 않는한 기존의 애드립 SubView를 통해 상위, 하위 호환이 가능합니다.
실제로 각 플랫폼의 마이너 버전 업데이트가 일어나더라도 애드립 구현부의 변경없이 업데이트 된 SDK 만 새롭게 적용하면 그대로 사용가능하며, 최소한의 구현부 수정으로 큰 수정없이 적용할 수 있도록 구성되었습니다.

|플랫폼|버전|SDK 다운로드|
|---|:---:|:---:|
|Admixer|v.1.4.2|<a href="http://admixer.co.kr/" target="_blank">다운로드</a>|
|Adfit|v3.0.2|<a href="https://github.com/adfit/adfit-ios-sdk" target="_blank">다운로드</a>|
|Admob|v7.31.0|<a href="https://developers.google.com/admob/ios/download" target="_blank">다운로드</a>|
|Cauly|v3.1|<a href="https://github.com/cauly/iOS-SDK/tree/master/" target="_blank">다운로드</a>|
|Facebook|v4.34.0|<a href="https://developers.facebook.com/docs/ios/downloads?locale=ko_KR" target="_blank">다운로드</a>|
|Inmobi|v.7.1.0|<a href="http://www.inmobi.com/products/sdk/" target="_blank">다운로드</a>|



## 개발환경
- Base SDK : iOS 7.0 이상
- iOS Deployment Target : iOS 7.0 이상

## ATS 설정

iOS9 [ATS(App Transport Security)](https://developer.apple.com/library/prerelease/ios/technotes/App-Transport-Security-Technote/) 처리. iOS9 이후 부터 ATS(App Transport Security) 기능이 기본으로 설정됩니다.<br/>
Application Info.plist 파일의 해당 항목을 설정을 하지않을 경우 광고가 차단되어 정상적으로 노출되지 않을 수 있습니다.<br/>
(현재 애드립과 연동된 모든 플랫폼이 https를 지원하지 않는 상황으로 해당 설정이 반드시 필요합니다.)

```
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

## Bitcode 지원

SDK v5.000 이상 버전에서 부터는 비트코드 지원 프레임워크 형태로 제공됩니다.

## ADLib SDK 설치 방법

#### 단계1. ADLibFramework 폴더 추가
ADLibFramework 폴더를 프로젝트에 추가합니다.<br>
해당 폴더에는 애드립 SDK 연동에 필요한 파일들을 포함되어있습니다. (Adlib.framework 파일 및  리소스 파일)

### 단계2. ADLibAdapter 폴더 추가
미디에이션을 사용할 경우 프로젝트에 추가 후 사용하실 미디에이션 플랫폼 어뎁터를 제외하고 나머지 파일들은 제거합니다.

### 단계3. 광고 플랫폼 미디에이션 라이브러리 추가
미디에이션을 사용할 경우 프로젝트에 추가할 광고 플랫폼의 라이브러리 파일을 추가합니다. <br>
Ex.) GoogleMobileAds.framework

## 프로젝트 설정 및 라이브러리 import

### 단계1. Other Linker Flags 설정 : -ObjC
Project - Build Settings 항목에 Other Linker Flags 추가가 필요합니다.
Linking - Other Linker Flags 항목에 -ObjC 를 추가합니다.

## 애드립 배너 연동(띠 배너)

### 단계1. 배너 연동을 위한 초기화

애드립 배너를 연동할 ViewController에 애드립 배너 delegate를 선언하고, 애드립 배너 객체들을 선언합니다.

```objectivec
#import "AdlibSampleController.h"
#import <Adlib/ADLibBanner.h>

#define ADLIB_APP_KEY @"550787410cf2833XXXXXXX"

@interface AdlibSampleController () <ALInterstitialAdDelegate, ALAdBannerViewDelegate>

@property (nonatomic) IBOutlet ALAdBannerView *bannerView;
@property (nonatomic, strong) ALInterstitialAd *interstitialAd;

@end

@implementation AdlibSampleController
...
@end
```

### 단계2. 띠 배너 광고 요청 시작

광고를 호출할 시점에 하단 코드처럼 요청 시작 메소드를 호출합니다.

```objectivec
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    //테스트 모드를 설정할 수 있습니다.
    _bannerView.isTestMode = YES;

    //광고 호출 완료 후 설정된 시간 이후 자동 갱신 요청 여부를 설정합니다.
    _bannerView.repeatLoop = NO;

    /**
     *  배너 광고를 요청한다.
     *  요청한 애드립 키값에 해당하는 띠배너 광고 플랫폼들에 대해서 순차적으로 광고를 요청하고 성공/실패 시 콜백을 호출한다.
     *
     *  @param key : 애드립 앱키
     *  @param rootViewController : 광고를 호출하는 뷰컨트롤러
     *  @param delegate : 광고 요청 및 수신 상태에 대한 델리게이트
     */
    [_bannerView startAdViewWithKey:ADLIB_APP_KEY
                 rootViewController:self
                         adDelegate:self];
}
```

### 단계3. 띠 배너 광고 요청 중단

광고 호출을 중단할 시점에 하단 코드처럼 메소드를 호출합니다.

```objectivec
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];

    [_bannerView stopAdView];
}
```
#### 단계4. 띠 배너 광고 Delegate 처리

ALAdBannerViewDelegate 프로토콜을 구현한 delegate를 아래와 같이 구현하고, 광고 수신 성공 / 실패 여부를 확인할 수 있습니다.

```objectivec
/**
 *  띠 배너 광고요청 재개 상태에서 내부적인 상태 변화를 통지합니다.
 */
- (void)alAdBannerView:(ALAdBannerView *)bannerView didChangeState:(ALMEDIAION_STATE)state withExtraInfo:(id)info
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

/**
 *  플랫폼에 요청한 띠배너 광고의 실패 상태를 반환합니다.
 *  반환값 BackFill 뷰 사용여부, 모든 플랫폼 광고요청이 실패한 경우 노출할 뷰를 지정하여 사용할 수 있습니다.
 */
- (BOOL)alAdBannerViewDidFailedAtAllPlatform:(ALAdBannerView *)bannerView
{
    NSLog(@"bannerView failed all-platform");

    //해당 델리게이트에서 애드립 플랫폼에 등록된 광고의 모두 실패 상태를 처리할 수 있습니다.
    //등록된 플랫폼 스케쥴이 (애드립, 애드몹, 애드핏)인 경우 각 각 요청 후 모두 실패한 케이스의 상황
    //해당 상황에 특별한 처리를 하지 않으면 광고 영역이 공백으로 노출될 수 있으며 뷰의 repeatLoop의 값에 따라
    //일정 시간 (초)대기후 첫 플랫폼 부터 재호출 되거나 요청이 더이상 발생하지 않는 상태로 남아있다.

    return YES;
}
```

## 애드립 배너 연동(전면 배너)

### 단계1. 전면광고 요청

전면광고를 요청할 시점에 다음과 같이 처리합니다.

```objectivec
- (IBAction)requestIntersAd:(id)sender
{
    ALInterstitialAd *interstitialAd = [[ALInterstitialAd alloc] initWithRootViewController:self];
    self.interstitialAd = interstitialAd;

    interstitialAd.isTestMode = YES;

    [_interstitialAd requestAdWithKey:ADLIB_APP_KEY adDelegate:self];
}
```

### 단계2. 전면광고 요청 취소

전면광고 요청 도중 취소하기 위해서는 아래와 같이 처리합니다.

```objectivec
- (void)cancelInterstitialAdRequest
{
    if (_interstitialAd) {
        [_interstitialAd stopAdReqeust];
    }
}
```

### 단계3. 전면광고 Delegate 처리

ALInterstitialAdDelegate 프로토콜을 구현한 delegate를 아래와 같이 구현하고, 광고 수신 성공 / 실패 여부를 확인할 수 있습니다.

```objectivec
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
```

## 애드립 미디에이션 연동
미디에이션을 연동하기 위해서는 위 애드립 광고 연동과 동일과정을 수행하나 추가로
미디에이션 플랫폼 등록 및 해당 플랫폼에 필요한 광고 키 값을 등록하는 추가 과정이 필요합니다.

### 단계1. 미디에이션 플랫폼 추가 (초기화 단계)

사용할 미디에이션 플랫폼에 해당하는 어뎁터 클래스를 선언하고, 해당 플랫폼에서 발급 받은 광고 키값을 미리 정의합니다.

```objectivec
#import "MediationSampleController.h"

#import <Adlib/ADLibBanner.h>
#import "ALAdapterAdmob.h"
#import "ALAdapterCauly.h"


//애드립의 키값을 설정합니다.
#define ADLIB_APP_KEY @"54caefb80cf28dexxxxxxxxx" //adlib, admob, cauly

// ADMOB의 APP 아이디를 설정합니다.
#define ADMOB_ID @"ca-app-pub-2656860633xxxxx/28382xxxx"
#define ADMOB_INTERSTITIAL_ID @"ca-app-pub-xxxxxx"

// CAULY의 키값을 설정합니다.
#define CAULY_ID        @"CAULY"


@interface MediationSampleController () <ALInterstitialAdDelegate, ALAdBannerViewDelegate>

@property (nonatomic) IBOutlet ALAdBannerView *bannerView;
@property (nonatomic, strong) ALInterstitialAd *interstitialAd;

@end

@implementation MediationSampleController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 미디에이션 플랫폼 등록
    [ALMediation registerPlatform:ALMEDIATION_PLATFORM_ADMOB withClass:[ALAdapterAdmob class]];
    [ALMediation registerPlatform:ALMEDIATION_PLATFORM_CAULY withClass:[ALAdapterCauly class]];

}
@end
```

### 단계2. 미디에이션 띠 배너 요청

기본적으로는 위에서 설명한 애드립 띠배너 요청과 동일하나 추가로 광고 키값 설정 코드가 필요합니다.

```objectivec
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    // 미디에이션 플랫폼 띠배너 키설정
    [_bannerView setKey:ADMOB_ID forPlatform:ALMEDIATION_PLATFORM_ADMOB];
    [_bannerView setKey:CAULY_ID forPlatform:ALMEDIATION_PLATFORM_CAULY];

    _bannerView.isTestMode = YES;
    _bannerView.repeatLoop = NO;

    [_bannerView startAdViewWithKey:ADLIB_APP_KEY
                 rootViewController:self
                         adDelegate:self];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];

    [_bannerView stopAdView];
}
```

### 단계2. 미디에이션 전면 배너 요청

기본적으로는 위에서 설명한 애드립 전면 배너 요청과 동일하나 추가로 광고 키값 설정 코드가 필요합니다.

```objectivec
- (IBAction)requestIntersAd:(id)sender
{
    ALInterstitialAd *interstitialAd = [[ALInterstitialAd alloc] initWithRootViewController:self];
    self.interstitialAd = interstitialAd;

    //미디에이션 플랫폼 전면배너 키설정
    [_interstitialAd setKey:ADMOB_INTERSTITIAL_ID forPlatform:ALMEDIATION_PLATFORM_ADMOB];
    [_interstitialAd setKey:CAULY_ID forPlatform:ALMEDIATION_PLATFORM_CAULY];

    [_interstitialAd requestAdWithKey:ADLIB_APP_KEY adDelegate:self];
}
```