//
//  UIViewController+Navigation.h
//  Dua
//
//  Created by Sameer Siddiqui on 11/18/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Navigation)
- (void)navBarWithTitleImage;
- (void)navBarWithBackButtonAndTitleImage;
- (void)navBarWithCloseButtonAndTitle:(NSString *)title;
- (void)navBarWithBackButtonAndTitle:(NSString *)title;
- (void)navBarWithWhiteBackButtonAndTitle:(NSString *)title;

- (void)navBarWithBackButtonAndTitle:(NSString *)title
                rightButtonImageName:(NSString *)imageName
                 rightButtonSelector:(SEL)selector;

- (void)navBarWithLeftButton:(NSString *)leftButtonImageName
          leftButtonSelector:(SEL)leftButtonSelector
              andRightButton:(NSString *)rightButtonImageName
         rightButtonSelector:(SEL)rightButtonSelector
         withTitleImageNamed:(NSString *)imageName;

- (void)navBarWithTitle:(NSString *)title
     andLeftButtonImage:(UIImage *)leftButtonImage
     leftButtonSelector:(SEL)leftButtonSelector
    andRightButtonImage:(UIImage *)rightButtonImage
    rightButtonSelector:(SEL)rightButtonSelector;


- (void)navBarWithLeftButtonImage:(UIImage *)leftButtonImage
               leftButtonSelector:(SEL)leftButtonSelector
              andRightButtonImage:(UIImage *)rightButtonImage
              rightButtonSelector:(SEL)rightButtonSelector
                   withTitleImage:(UIImage *)image;

- (void)navBarWithLeftButtonImage:(UIImage *)leftButtonImage
               leftButtonSelector:(SEL)leftButtonSelector
              andRightButtonImage:(UIImage *)rightButtonImage
              rightButtonSelector:(SEL)rightButtonSelector
                   withTitleImage:(UIImage *)image
                        animation:(BOOL)animation;

- (void)navBarWithTitle:(NSString *)title
     andRightButtonText:(NSString *)text
           withSelector:(SEL)selector;

- (void)navBarWithTitle:(NSString *)title
     andRightButtonText:(NSString *)text
           withSelector:(SEL)selector
         selectorTarget:(id)target;

- (void)addRightButtonItem:(NSString *)imageName selector:(SEL)selector;

- (void)addCloseButtonItem;

- (void)addBackButtonItemAsLeftButtonItem;

- (void)hideBackButton;

- (void)navBarWithSearchBar;

- (void)setNavBarTitle:(NSString *)title;

// Find the UIViewController with class type is aClass
- (UIViewController *)findLastViewController:(Class)aClass;
- (UIViewController *)findViewControllerByIndex:(int)numberOfIndex;
@end
