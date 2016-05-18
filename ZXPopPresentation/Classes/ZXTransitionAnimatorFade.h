//
//  ZXTransitionAnimatorFade.h
//  Pods
//
//  Created by Zinc on 5/17/16.
//
//

#import <Foundation/Foundation.h>

@interface ZXTransitionAnimatorFade : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, assign) CGFloat offsetX;
@property (nonatomic, assign) CGFloat offsetY;

@end
