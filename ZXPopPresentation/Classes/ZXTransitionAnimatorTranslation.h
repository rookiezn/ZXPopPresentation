//
//  ZXTransitionAnimatorTranslation.h
//  Pods
//
//  Created by Zinc on 5/17/16.
//
//

#import "ZXTransitionAnimator.h"

typedef NS_ENUM(NSInteger, ZXTranslationDirection)
{
    ZXTransitionDirectionFromBottom,
    ZXTransitionDirectionFromTop,
    ZXTransitionDirectionFromLeft,
    ZXTransitionDirectionFromRight
};

@interface ZXTransitionAnimatorTranslation : ZXTransitionAnimator

@property (nonatomic, assign) ZXTranslationDirection direction;

@end
