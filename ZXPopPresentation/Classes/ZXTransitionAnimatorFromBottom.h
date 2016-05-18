//
//  ZXTransitionAnimatorFromBottom.h
//  Pods
//
//  Created by Zinc on 5/17/16.
//
//

#import <Foundation/Foundation.h>

@interface ZXTransitionAnimatorFromBottom : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, assign) CGFloat dampingRatio;
@property (nonatomic, assign) CGFloat velocity;

@end
