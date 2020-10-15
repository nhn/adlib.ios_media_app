//
//  ALAdBackFillView.h
//  Adlib
//
//  Created by KangTW on 2020/09/09.
//  Copyright © 2020 payco. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALAdBackFillView;

@protocol ALAdBackFillViewDelegate <NSObject>

@optional
- (void)alAdBackFillView:(ALAdBackFillView *)view shouldLinkClicked:(NSURL *)link;

@end


@interface ALAdBackFillView : UIView {
    
}

@property (nonatomic, weak) id<ALAdBackFillViewDelegate> delegate;

- (void)setBackgroundImage:(UIImage *)image;
- (void)loadBackFillUrl:(NSURL *)url;

@end
