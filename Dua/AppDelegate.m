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
#import <Google/Analytics.h>
#import "UIViewController+displayPopup.h"
#import "DuaData.h"
#import "DuaModel.h"
#import "DuaDetailViewController.h"




@import Firebase;
@import UserNotifications;


@interface AppDelegate () <SWRevealViewControllerDelegate, UNUserNotificationCenterDelegate, FIRMessagingDelegate>

@property (strong, nonatomic) FIRDatabaseReference *ref;

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

    
    self.viewController = revealController;
    frontViewController.revealViewController = revealController;
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    [Fabric with:@[[Crashlytics class]]];
    
    // Configure tracker from GoogleService-Info.plist.
    NSError *configureError;
    [[GGLContext sharedInstance] configureWithError:&configureError];
    NSAssert(!configureError, @"Error configuring Google services: %@", configureError);

    [FIRApp configure];
    //self.ref = [[FIRDatabase database] reference];
    //[FIRDatabase database].persistenceEnabled = YES;
    
    [self registerForNotifications];

    
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
    [self countOpen];
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - Notifications

- (void)registerForNotifications {
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_9_x_Max) {
        UIUserNotificationType allNotificationTypes =
        (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge);
        UIUserNotificationSettings *settings =
        [UIUserNotificationSettings settingsForTypes:allNotificationTypes categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    } else {
        // iOS 10 or later
#if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
        UNAuthorizationOptions authOptions =
        UNAuthorizationOptionAlert
        | UNAuthorizationOptionSound
        | UNAuthorizationOptionBadge;
        [[UNUserNotificationCenter currentNotificationCenter]
         requestAuthorizationWithOptions:authOptions
         completionHandler:^(BOOL granted, NSError * _Nullable error) {
         }
         ];
        
        // For iOS 10 display notification (sent via APNS)
        [[UNUserNotificationCenter currentNotificationCenter] setDelegate:self];
        // For iOS 10 data message (sent via FCM)
        [[FIRMessaging messaging] setRemoteMessageDelegate:self];
#endif
    }
    
    [[UIApplication sharedApplication] registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    // If you are receiving a notification message while your app is in the background,
    // this callback will not be fired till the user taps on the notification launching the application.
    // TODO: Handle data of notification
    
    if (application.applicationState == UIApplicationStateBackground || application.applicationState == UIApplicationStateInactive) {
        [self showDuaForDuaString:[userInfo objectForKey:@"dua"]];
    }
    
    // Print message ID.
    NSLog(@"Message ID: %@", userInfo[@"gcm.message_id"]);
    
    // Print full message.
    NSLog(@"%@", userInfo);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    // If you are receiving a notification message while your app is in the background,
    // this callback will not be fired till the user taps on the notification launching the application.
    // TODO: Handle data of notification
    
    if (application.applicationState == UIApplicationStateBackground || application.applicationState == UIApplicationStateInactive) {
        [self showDuaForDuaString:[userInfo objectForKey:@"dua"]];
    }
    
    // Print message ID.
    NSLog(@"Message ID: %@", userInfo[@"gcm.message_id"]);
    
    // Print full message.
    NSLog(@"%@", userInfo);
}

- (void)applicationReceivedRemoteMessage:(FIRMessagingRemoteMessage *)remoteMessage {
    NSLog(@"%@", remoteMessage);
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler{

    NSLog(@"%@%@", response.notification, response);
    
    NSString *duaName = [response.notification.request.content.userInfo objectForKey:@"dua"];
    [self showDuaForDuaString:duaName];
    
   
    
    if (completionHandler) {
        completionHandler();
    }
}

- (void)showDuaForDuaString:(NSString *)duastring {
    NSArray *arraydata = [DuaData duas];
    
    for (NSDictionary *categoryDict in arraydata) {
        NSArray *arr = [categoryDict objectForKey:@"duas"];
        for (NSDictionary *duas in arr) {
            if ([[duas objectForKey:@"dua:title"] isEqualToString:duastring]) {
                DuaModel *d = [[DuaModel alloc]initWithJson:duas];
                DuaDetailViewController *vc = [DuaDetailViewController create];
                vc.dua = d;
                
                
                [(UINavigationController *)self.viewController.frontViewController pushViewController:vc animated:YES];
            }
        }
    }

}

#pragma mark - SWRevealViewDelegate

- (id <UIViewControllerAnimatedTransitioning>)revealController:(SWRevealViewController *)revealController animationControllerForOperation:(SWRevealControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if ( operation != SWRevealControllerOperationReplaceRightController )
        return nil;
    
    return nil;
}

- (void)countOpen {
    int _count = 0;
    _count=  [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppCount"] intValue];
    UIViewController *currentVC = [UIApplication sharedApplication].keyWindow.rootViewController;

    if (_count == 9) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [currentVC displayRatingsPopup];
        });
    }
    if (_count == 25 && [[[NSUserDefaults standardUserDefaults] objectForKey:@"Reviewed"] isEqualToString:@"NO"] ) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [currentVC displayRatingsPopup];
        });
    }
    if (_count == 50 && [[[NSUserDefaults standardUserDefaults] objectForKey:@"Reviewed"] isEqualToString:@"NO"] ) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [currentVC displayRatingsPopup];
        });
    }
    if (_count == 100 && [[[NSUserDefaults standardUserDefaults] objectForKey:@"Reviewed"] isEqualToString:@"NO"] ) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [currentVC displayRatingsPopup];
        });
    }
    if (_count == 200 && [[[NSUserDefaults standardUserDefaults] objectForKey:@"Reviewed"] isEqualToString:@"NO"] ) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [currentVC displayRatingsPopup];
        });
    }
    if (_count == 400 && [[[NSUserDefaults standardUserDefaults] objectForKey:@"Reviewed"] isEqualToString:@"NO"] ) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [currentVC displayRatingsPopup];
        });
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d",_count+1] forKey:@"AppCount"];
    
    

}



@end
