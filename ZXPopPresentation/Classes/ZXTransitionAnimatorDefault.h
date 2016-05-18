//
//  ZXTransitionAnimatorDefault.h
//  Pods
//
//  Created by Zinc on 5/17/16.
//
//

#import <Foundation/Foundation.h>

@interface ZXTransitionAnimatorDefault : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, assign) CGFloat scale;

@end
