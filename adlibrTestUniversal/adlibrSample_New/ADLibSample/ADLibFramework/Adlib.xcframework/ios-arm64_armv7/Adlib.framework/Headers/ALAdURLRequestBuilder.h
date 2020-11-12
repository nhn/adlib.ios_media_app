//
//  ALAdURLRequestBuilder.h
//  Adlib
//
//  Created by KangTW on 2020/09/07.
//  Copyright © 2020 payco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALAdlibAdRequestInfo.h"
#import "ADLibSession.h"
#import <WebKit/WebKit.h>

/**
 *  GW 서버 통신 API URL을 생성하는 클래스
 *  기본 주소 및 설정 정보에서 가져오는 BaseURL을 사용한다.
 */

@protocol ALAdSetConfigDelegate <NSObject>

- (void)setConfigSuccess;

@end


@interface ALAdURLRequestBuilder : NSObject

#pragma mark - config api methods

+ (void)setWebViewUserAgentDelegate:(id<ALAdSetConfigDelegate>)delegate;
/**
 * @param type 광고 요청 타입
 * @param house 하우스 광고 여부
 * @return config-api NSURLRequest
 * @date 2014.12.15
 */
+ (NSURLRequest *)adl_configApiRequestWithKey:(NSString *)requestKey;

/**
 * @return smart-api NSURLRequest
 * @date 2014.12.15
 */
+ (NSMutableURLRequest *)adl_smartApiRequestWithSession:(ADLibSession *)session
                                                   type:(ALAdlibAdProdType)type
                                              isHouseAd:(BOOL)house;

/**
 * 스마트 광고 요청의 캐시 키값으로 사용되는 문자열을 반환하는 클래스 메소드
 * @param type 광고 요청 타입
 * @param house 하우스 광고 여부
 * @return 캐시 문자열
 * @date 2014.12.15
 */
+ (NSString *)adl_smartAdCacheUrlStringWithSession:(ADLibSession *)session
                                              type:(ALAdlibAdProdType)type
                                         isHouseAd:(BOOL)house;


+ (NSURLRequest *)adl_dynamicSizeSmartApiRequestWithSession:(ADLibSession *)session
                                                       type:(ALAdlibAdProdType)type
                                                  isHouseAd:(BOOL)house
                                                 sourceSize:(CGSize)size;

/**
 * 랜딩 페이지 주소에 기본 파라미터 정보(key, udid 등)를 추가한 URL을 생성하여 반환한다.
 * @param requestKey 요청 키 값 (애드립키 혹은 네이티브 지면 키)
 * @param urlString landing Base domain
 * @param type 광고 요청 타입 (smart)
 * @param iType 광고 아이템 요청 타입 (image / video / all)
 * @param pType 로딩 타입 (band, interstitial)
 * @return 랜딩 페이지 URL 객체
 * @date 2014.12.15
 */
+ (NSURL *)adl_landingUrlWithKey:(NSString *)requestKey
                  landingBaseUrl:(NSString *)urlString
                        destPage:(NSString *)page
                   requestAdType:(ALREQUEST_SYNC_AD_TYPE)type
                        itemType:(ALAdRequestItemType)iType
                        prodType:(ALAdlibAdProdType)pType;

+ (NSString *)adl_landingBaseUrlStringWithSession:(ADLibSession *)session;


/**
 * @return medi-report-api NSURLRequest
 * @date 2014.12.15
 */
+ (NSURLRequest *)adl_mediationReportApiRequestWithURL:(NSURL *)baseUrl
                                            requestKey:(NSString *)requestKey
                                                   aid:(NSString *)aid
                                                  type:(NSString *)type;

/**
 * @return dialog-api NSURLRequest
 * @date 2014.12.15
 */
+ (NSURL *)adl_dialogApiWithURL:(NSURL *)baseUrl
                     requestKey:(NSString *)requestKey
                          dlgId:(NSString *)dlgId
                           type:(NSString *)type;

+ (NSString *)al_appUDID;

+ (NSString *)al_stringByAddingPercentEscapes:(NSString *)str;

+ (void)setWebViewUserAgent:(WKWebView *)aWebView;

@end
