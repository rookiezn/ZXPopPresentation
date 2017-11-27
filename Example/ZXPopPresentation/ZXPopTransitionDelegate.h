//
//  ZXPopTransitionDelegate.h
//  ZXPopPresentation_Example
//
//  Created by Rookie on 27/11/2017.
//  Copyright © 2017 rookiezn. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ZXPopPresentationStyle)
{
    ZXPopPresentationStyleDefault,
    ZXPopPresentationStyleFade,
    ZXPopPresentationStyleFromBottom
};

@class ZXTransitionAnimator;

@interface ZXPopTransitionDelegate : NSObject <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) ZXTransitionAnimator *animator;

- (instancetype)initWithStyle:(ZXPopPresentationStyle)style;

@end
