//
//  UIViewController+Navigation.m
//  Dua
//
//  Created by Sameer Siddiqui on 11/18/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import "UIViewController+Navigation.h"
#import "UIImage+Scale.h"

@implementation UIViewController (Navigation)

#pragma mark - Dynamic Properties

- (void)navBarWithWhiteBackButtonAndTitle:(NSString *)title {
    [self setNavBarTitle:title];
    UIImage *barButtonImage = [UIImage imageNamed:@"button_back"];
    [self addLeftButtonImageItem:[barButtonImage invertColor] selector:@selector(back:) animation:NO withLeftTarget:self];
}

- (void)navBarWithTitle:(NSString *)title
     andLeftButtonImage:(UIImage *)leftButtonImage
     leftButtonSelector:(SEL)leftButtonSelector
             leftTarget:(nullable id)target
    andRightButtonImage:(UIImage *)rightButtonImage
    rightButtonSelector:(SEL)rightButtonSelector {
    
    [self setNavBarTitle:title];
    [self addLeftButtonImageItem:leftButtonImage selector:leftButtonSelector animation:NO withLeftTarget:target];
    [self addRightButtonImageItem:rightButtonImage selector:rightButtonSelector animation:NO];
}



#pragma mark - Create Bar buttons
- (void)setNavBarTitle:(NSString *)title {
    UILabel *titleLabel = [UILabel new];
    titleLabel.attributedText = [[NSAttributedString alloc]initWithString:title
                                                               attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                            NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:14.0],
                                                                            NSKernAttributeName: @(2.0f)}];
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
    
    
}

- (void)addLeftButtonImageItem:(UIImage *)imageName selector:(SEL)selector animation:(BOOL)animation withLeftTarget:(nullable id)target{
    // Create a custom button with the image
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:imageName forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0, 0, imageName.size.width, imageName.size.height);
    // Add the target
    [leftButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    // Add the container bar button
    self.navigationItem.backBarButtonItem = nil;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    if (animation) {
        [leftButton setAlpha:0.0f];
        [UIView animateWithDuration:0.5f animations:^{
            [leftButton setAlpha:1.0f];
        }];
    }
}
- (void)addRightButtonImageItem:(UIImage *)image selector:(SEL)selector animation:(BOOL)animation {
    // Create a custom button with the image
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:image forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(0, 0, 20, 20);
    // Add the target
    [rightButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    
    // Add the container bar button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.backBarButtonItem = nil;
    
    if (animation) {
        [rightButton setAlpha:0.0f];
        [UIView animateWithDuration:0.5f animations:^{
            [rightButton setAlpha:1.0f];
        }];
    }
}


#pragma mark - Bar Button Actions

- (void)back:(NSObject *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
