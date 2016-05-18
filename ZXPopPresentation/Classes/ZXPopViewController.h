//
//  ZXPopViewController.h
//  Pods
//
//  Created by Zinc on 5/17/16.
//
//

#import <UIKit/UIKit.h>
#import "ZXPopPresentationController.h"

typedef NS_ENUM(NSInteger, ZXTransitionAnimationStyle) {
    ZXTransitionAnimationStyleDefault,
    ZXTransitionAnimationStyleFade,
    ZXTransitionAnimationStyleFromBottom
};

@interface ZXPopViewController : UIViewController <ZXPopPresentationDelegate, UIViewControllerTransitioningDelegate>

/*! @brief animation style */
@property (nonatomic, assign) ZXTransitionAnimationStyle style;
@property (nonatomic, assign) BOOL dimming;
@property (nonatomic, assign) BOOL shouldDismissWhenTap;

- (instancetype)initWithAnimationStyle:(ZXTransitionAnimationStyle)style;

@end
