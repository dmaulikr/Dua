//
//  PopupViewController.m
//  Dua
//
//  Created by Sameer Siddiqui on 6/23/16.
//  Copyright © 2016 Sameer Siddiqui. All rights reserved.
//

#import "PopupViewController.h"
#import "AppDelegate.h"
#import "UIViewController+displayPopup.h"



@interface PopupViewController ()
- (IBAction)reviewPressed:(id)sender;
- (IBAction)noPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *reviewButton;
@property (weak, nonatomic) IBOutlet UIButton *noButton;

@end

@implementation PopupViewController {
    UIView *background;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.reviewButton.layer.cornerRadius = 4.0;
    self.noButton.layer.cornerRadius = 4.0;
    [self addBackgroundLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addBackgroundLayer {
    background = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    background.backgroundColor = [UIColor blackColor];
    background.alpha = 0.4;
//    [self.view insertSubview:view belowSubview:self.ratingsView];
    [self.view addSubview:background];
}

- (void)removeBackgroundLayer {
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveLinear  animations:^{
        background.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        [background removeFromSuperview];
    }];
}

- (void)slideIn {
    self.isUsing = YES;
    
    //set initial location at bottom of view
    CGRect frame = self.view.frame;
    frame.origin = CGPointMake(0.0, ((AppDelegate *)[UIApplication sharedApplication].delegate).window.bounds.size.height);
    frame.size.width = ((AppDelegate *)[UIApplication sharedApplication].delegate).window.bounds.size.width;
    frame.size.height = 307;
    self.view.frame = frame;
    
    frame = self.ratingsView.frame;
    frame.origin = CGPointMake(0.0, 0.0);
    frame.size.width = ((AppDelegate *)[UIApplication sharedApplication].delegate).window.bounds.size.width;
    frame.size.height = 307;
    self.ratingsView.frame = frame;
    
    [self.view addSubview:self.ratingsView];
    
    [self.view layoutIfNeeded];
    
    //animate to new location, determined by height of the view in the NIB
    [UIView beginAnimations:@"presentWithSuperview" context:nil];
    self.view.alpha = 1.0f;
    [self.view layoutIfNeeded];
    frame.origin = CGPointMake(0.0, ((AppDelegate *)[UIApplication sharedApplication].delegate).window.bounds.size.height - self.ratingsView.bounds.size.height);
    self.view.frame = frame;
    [UIView commitAnimations];
    
}

- (IBAction)slideOut {
    
    //do what you need to do with information gathered from the custom action sheet. E.g., apply data filter on parent view.
    [UIView beginAnimations:@"removeFromSuperviewWithAnimation" context:nil];
    
    // Set delegate and selector to remove from superview when animation completes
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    self.view.alpha = 0.0f;
    // Move this view to bottom of superview
    CGRect frame = self.ratingsView.frame;
    frame.origin = CGPointMake(0.0, ((AppDelegate *)[[UIApplication sharedApplication] delegate]).window.bounds.size.height);
    self.ratingsView.frame = frame;
    
    [UIView commitAnimations];
    
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    if ([animationID isEqualToString:@"removeFromSuperviewWithAnimation"]) {
        [self.view removeFromSuperview];
        
        self.isUsing = NO;
    }
}

- (IBAction)reviewPressed:(id)sender {
    NSString *link = @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1123475814&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software";
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:link]];
    [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"Reviewed"];
    [self slideOutPopup];

}

- (IBAction)noPressed:(id)sender {
    [self slideOutPopup];
    [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"Reviewed"];
    
}
@end
