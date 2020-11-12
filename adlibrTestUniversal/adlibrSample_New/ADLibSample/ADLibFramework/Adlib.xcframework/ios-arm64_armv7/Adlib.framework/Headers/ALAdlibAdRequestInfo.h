//
//  ALAdlibAdRequestInfo.h
//  Adlib
//
//  Created by KangTW on 2020/09/08.
//  Copyright © 2020 payco. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ALREQUEST_SYNC_AD_TYPE){
    
    ALREQUEST_SYNC_AD_TYPE_SMART  = 2,
};

typedef NS_ENUM(NSInteger, ALAdlibAdProdType){

    ALAdlibAdProdTypeNone          = -1,
    ALAdlibAdProdTypeBandBanner    = 1,
    ALAdlibAdProdTypeInterstitial  = 2,
    ALAdlibAdProdTypeHalf          = 3,
};

typedef NS_ENUM(NSInteger, ALAdRequestItemType){
    
    ALAdRequestItemTypeImageAd = 1,
    ALAdRequestItemTypeVideoAd = 2,
    ALAdRequestItemTypeAll     = 3,
};

@interface ALAdlibAdRequestInfo : NSObject

@property (nonatomic, strong) NSString *urlCacheKey;
@property (nonatomic, strong) NSNumber *timeInterval;

@property (nonatomic) ALREQUEST_SYNC_AD_TYPE reqeustType;
@property (nonatomic) ALAdRequestItemType requestAdType;
@property (nonatomic) ALAdlibAdProdType reqeustProdType;

@end
