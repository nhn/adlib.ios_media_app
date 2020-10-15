//
//  Adlib.h
//  Adlib
//
//  Created by KangTW on 2020/09/07.
//  Copyright © 2020 payco. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for Adlib.
FOUNDATION_EXPORT double AdlibVersionNumber;

//! Project version string for Adlib.
FOUNDATION_EXPORT const unsigned char AdlibVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <Adlib/PublicHeader.h>

#import <Adlib/ADLibSDK.h>


///////////////////////////////////////////////////////////////////////////
// 애드립 광고 띠/전면 광고 - 미디에이션 클래스                                     //
///////////////////////////////////////////////////////////////////////////

#import <Adlib/ALMediationDefine.h>
#import <Adlib/ALMediation.h>
#import <Adlib/ADLibSession.h>
#import <Adlib/ALInternalCache.h>

/*
 * 애드립 미디에이션 (신규버전)
 * 애드립 이외의 광고 플랫폼 사용 시 해당 플랫폼의 구현 클래스를 추가해야한다.
 * (Ex. ALAdapterAdmob)
 */

// 미디에이션 띠배너 요청 배너뷰
#import <Adlib/ALAdBannerView.h>

// 미디에이션 전면배너 요청 객체
#import <Adlib/ALInterstitialAd.h>

// 미디에이션 띠배너 BackFill제공 탬플릿뷰
#import <Adlib/ALAdBackFillView.h>

/**
 * 애드립 전용 이미지 광고 뷰
 * 애드립 및 애드립 하우스 플랫폼만 사용할 수 있는 이미지/웹 뷰 광고 제공 클래스
 */

// (Width x Height) 동적 소재사이즈 광고
#import <Adlib/ALDynamicBanner.h>
#import <Adlib/ALDynamicBannerView.h>
#import <Adlib/ALDynamicBannerController.h>

// (320 x 50) 규격 소재사이즈 광고
#import <Adlib/ALAdlibBannerView.h>

//애드립 네트워크 배너
#import <Adlib/ALNetworkAd.h>
