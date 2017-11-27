#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "ZXPopPresentation.h"
#import "ZXPopPresentationController.h"
#import "ZXTransitionAnimator.h"
#import "ZXTransitionAnimatorDefault.h"
#import "ZXTransitionAnimatorFade.h"
#import "ZXTransitionAnimatorFromBottom.h"

FOUNDATION_EXPORT double ZXPopPresentationVersionNumber;
FOUNDATION_EXPORT const unsigned char ZXPopPresentationVersionString[];

