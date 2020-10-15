//
//  ALInternalCache.h
//  Adlib
//
//  Created by KangTW on 2020/09/08.
//  Copyright © 2020 payco. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface ALInternalCache : NSObject

+ (instancetype)sharedCache;

+ (void)clearAllReqeustCache;

/**
 * API 캐시에 사용되는 초단위 값을 지정한다.
 * 응답을 정상 수신한 경우 재 요청 시간 값 캐싱
 * @param interval API 캐시에 사용하는 초 값
 * @date 2014.12.16
 */

+ (void)setSmartApiCacheTimeInterval:(NSTimeInterval)interavl;

/**
 * API 캐시에 사용되는 캐시 값을 반환한다.
 * @return NSTimeInterval 초단위 값
 * @date 2014.12.16
 */

+ (NSTimeInterval)smartAdApiRequestCacheTimeInterval;


/**
 * API 캐시에 사용되는 초단위 값을 지정한다.
 * 응답을 정상 수신하지 못한 경우 내부적인 요청 시간 값 캐싱
 * @param interval API 캐시에 사용하는 초 값
 * @date 2014.12.16
 */

+ (void)setSmartApiCacheTimeIntervalForErrorState;
+ (void)resetSmartApiCacheTimeIntervalForErrorState;


/**
 * API 마지막 요청 시간을 고유 주소 값 별로 캐싱한다.
 * @param requestKey api 요청 고유 주소 값, 키값으로 사용
 * @param 키값에 해당하는 캐싱 값, requestTime 마지막 요청 시간
 */
+ (void)setAdlibApiRequestKey:(NSString *)requestKey time:(NSTimeInterval)reqeustTime;

/**
 * API 마지막 요청 시간을 반환한다.
 * @param requestKey api 요청 고유 주소 값, 키값으로 사용
 * @return requestTime 마지막 요청 시간
 */
+ (NSTimeInterval)lastRequestTimeForKey:(NSString *)requestKey;

// 디스크 I/O를 수행하므로 메인 스레드에서 호출하는것을 권장하지 않는다.
- (BOOL)existsCachedDataForKey:(NSString *)key;
- (NSData *)cachedDataForKey:(NSString *)key;
- (void)storeCacheData:(NSData *)data forKey:(NSString *)key;
- (void)removeAllDataFromCache;
- (void)setMemoryCacheEnabled:(BOOL)enabled;

@end
