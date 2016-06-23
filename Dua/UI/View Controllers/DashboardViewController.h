//
//  DashboardViewController.h
//  Dua
//
//  Created by Sameer Siddiqui on 11/17/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"


@interface DashboardViewController : UIViewController

+ (DashboardViewController *)create;

@property (nonatomic, weak) SWRevealViewController *revealViewController;

@end
