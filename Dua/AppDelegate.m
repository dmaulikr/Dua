//
//  AppDelegate.m
//  Dua
//
//  Created by Sameer Siddiqui on 11/17/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import "AppDelegate.h"
#import "DashboardViewController.h"
#import "RearViewController.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>


@interface AppDelegate () <SWRevealViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    [UINavigationBar appearance].barStyle = UIBarStyleBlack;
    [UINavigationBar appearance].barTintColor = [UIColor blackColor];
    
    
    
    
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new]
                                      forBarPosition:UIBarPositionAny
                                          barMetrics:UIBarMetricsDefault];
    [UINavigationBar appearance].backgroundColor = [UIColor blackColor];
    
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
   

    
    
    DashboardViewController *frontViewController = [DashboardViewController create];
    RearViewController *rearViewController = [RearViewController create];
    
    UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
    UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:rearViewController];
    
    SWRevealViewController *revealController = [[SWRevealViewController alloc] initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
    revealController.delegate = self;
    revealController.rearViewRevealWidth = 215;
//    revealController.rearViewRevealDisplacement = 200.0f;
//    [revealController panGestureRecognizer];
//    [revealController tapGestureRecognizer];

    
    revealController.bounceBackOnOverdraw=YES;
    //revealController.stableDragOnOverdraw=YES;
    
    self.viewController = revealController;
    frontViewController.revealViewController = revealController;
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    [Fabric with:@[[Crashlytics class]]];

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - SWRevealViewDelegate

- (id <UIViewControllerAnimatedTransitioning>)revealController:(SWRevealViewController *)revealController animationControllerForOperation:(SWRevealControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if ( operation != SWRevealControllerOperationReplaceRightController )
        return nil;
    
    return nil;
}


@end
