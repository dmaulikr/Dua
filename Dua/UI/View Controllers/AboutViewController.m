//
//  AboutViewController.m
//  Dua
//
//  Created by Sameer Siddiqui on 6/11/16.
//  Copyright © 2016 Sameer Siddiqui. All rights reserved.
//

#import "AboutViewController.h"
#import "UIViewController+Navigation.h"

@interface AboutViewController ()
@property (weak, nonatomic) IBOutlet UILabel *aboutLabel;
@property (weak, nonatomic) IBOutlet UILabel *disclosureLabel;

@end

@implementation AboutViewController
+ (AboutViewController*)create {
    AboutViewController *vc = [[UIStoryboard storyboardWithName:@"Dashboard" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([AboutViewController class])];
    return vc;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];//[UIColor colorWithRed:39.0/255.0 green:43.0/255.0 blue:46.0/255.0 alpha:1.0f];
    [self navBarWithWhiteBackButtonAndTitle:@"About"];
    self.aboutLabel.numberOfLines = 0;
    self.aboutLabel.textAlignment = NSTextAlignmentCenter;
    self.aboutLabel.attributedText = [[NSAttributedString alloc]initWithString:@"Hand picked Duas from reputable sources to incorporate into one's daily life."
                                                                  attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                               NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0],
                                                                               NSKernAttributeName: @(2.0f)}];
    self.disclosureLabel.numberOfLines = 0;
    self.disclosureLabel.textAlignment = NSTextAlignmentCenter;
    self.disclosureLabel.attributedText = [[NSAttributedString alloc]initWithString:@"Made with 💓 by SSS\n🙏 for us\nVersion 1.1"
                                                                    attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                                 NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:10.0],
                                                                                 NSKernAttributeName: @(2.0f)}];
}

@end
