//
//  UIViewController+displayPopup.m
//  Dua
//
//  Created by Sameer Siddiqui on 6/23/16.
//  Copyright © 2016 Sameer Siddiqui. All rights reserved.
//

#import "UIViewController+displayPopup.h"

@implementation UIViewController (displayPopup)

PopupViewController *popupvc;
UIView *background;

- (void)displayRatingsPopup {
    @synchronized(self) {
        
        if (popupvc) {
            if (popupvc.isUsing) {
                [popupvc.view removeFromSuperview];
            }
        }
        else {
            popupvc = [[PopupViewController alloc] initWithNibName:@"PopupViewController" bundle:nil];
        }
        background = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        background.backgroundColor = [UIColor blackColor];
        background.alpha = 0.4;
        [self.view addSubview:background];
        [self.view addSubview:popupvc.view];
        [popupvc slideIn];

    }
}

- (void)slideOutPopup {
    @synchronized(self) {
        self.navigationController.view.userInteractionEnabled = YES;
        
        if (popupvc) {
            if (popupvc.isUsing) {
                [popupvc slideOut];
                [background removeFromSuperview];
            }
        }
    }
}

@end
