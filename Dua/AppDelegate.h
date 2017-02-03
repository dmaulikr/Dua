//
//  AppDelegate.h
//  Dua
//
//  Created by Sameer Siddiqui on 11/17/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DashboardViewController;
@class SWRevealViewController;

@protocol Database <NSObject>

- (void)dataReceived;

@end
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) DashboardViewController *dashboardViewController;
@property (strong, nonatomic) SWRevealViewController *viewController;
@property (nonatomic, weak) id <Database> delegate;


@end

