//
//  PopupViewController.h
//  Dua
//
//  Created by Sameer Siddiqui on 6/23/16.
//  Copyright © 2016 Sameer Siddiqui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopupViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *ratingsView;
@property (nonatomic) BOOL isUsing;

- (void)slideIn;
- (void)slideOut;
@end
