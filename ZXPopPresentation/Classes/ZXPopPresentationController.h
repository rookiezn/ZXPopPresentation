//
//  ZXPopPresentationController.h
//  Pods
//
//  Created by Zinc on 5/17/16.
//
//

#import <UIKit/UIKit.h>

@class ZXPopPresentationController;

@protocol ZXPopPresentationDelegate <NSObject>

@optional
/**
 *  Notifies the delegate that the dismissal transition due to tapping dimming are about to start.
 *
 *  @param controller the presentation controller
 */
- (void)presentationWillDismiss:(ZXPopPresentationController *)presentationController;

/**
 *  Notifies the delegate that the dismissal transition due to tapping dimming finished.
 *
 *  @param controller the presentation controller
 */
- (void)presentationDidDismissed:(ZXPopPresentationController *)presentationController;

/**
 *  ask the delegate for the frame of the presented view
 *
 *  @param controller the presentation controller
 *
 *  @return frame
 */
- (CGRect)frameOfPresentedViewForPresentationController:(ZXPopPresentationController *)controller;

@end

@interface ZXPopPresentationController : UIPresentationController

@property (nonatomic, weak) id<ZXPopPresentationDelegate> popPresentationDelegate;

/*! @brief dimming background or not */
@property (nonatomic, assign) BOOL dimming;

/*! @brief if dismiss when tapping dimming background */
@property (nonatomic, assign) BOOL shouldDismissWhenTap;

@end
