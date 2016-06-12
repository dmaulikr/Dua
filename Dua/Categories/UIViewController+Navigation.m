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

- (void)navBarWithTitleImage {
    // Add the main title image
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo_irisTitlebar"]];
}

- (void)addCloseButtonItem {
    [self addRightButtonItem:@"button_close" selector:@selector(close:)];
}

- (void)addBackButtonItemAsLeftButtonItem {
    [self addLeftButtonItem:@"button_back" selector:@selector(back:)];
}

- (void)addWhiteBackButtonItemAsLeftButtonItem {
    [self addWhiteLeftButtonItem:@"button_back" selector:@selector(back:)];
}

- (void)addRightButtonImageItem:(UIImage *)image selector:(SEL)selector {
    [self addRightButtonImageItem:image selector:selector animation:NO];
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

- (void)addRightButtonItem:(NSString *)imageName selector:(SEL)selector {
    UIImage *barButtonImage = [UIImage imageNamed:imageName];
    [self addRightButtonImageItem:barButtonImage selector:selector];
}

- (void)addLeftButtonImageItem:(UIImage *)imageName selector:(SEL)selector {
    UIImage *barButtonImage = imageName;
    [self addLeftButtonImageItem:barButtonImage selector:selector animation:NO];
}

- (void)addLeftButtonImageItem:(UIImage *)imageName selector:(SEL)selector withLeftTarget:(nullable id)target{
    UIImage *barButtonImage = imageName;
    [self addLeftButtonImageItem:barButtonImage selector:selector animation:NO withLeftTarget:target];
}

- (void)addLeftButtonImageItem:(UIImage *)imageName selector:(SEL)selector animation:(BOOL)animation {
    // Create a custom button with the image
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:imageName forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0, 0, imageName.size.width, imageName.size.height);
    // Add the target
    [leftButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    
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

- (void)addLeftButtonItem:(NSString *)imageName selector:(SEL)selector {
    UIImage *barButtonImage = [UIImage imageNamed:imageName];
    [self addLeftButtonImageItem:barButtonImage selector:selector];
}

- (void)addWhiteLeftButtonItem:(NSString *)imageName selector:(SEL)selector {
    UIImage *barButtonImage = [UIImage imageNamed:imageName];
    [self addLeftButtonImageItem:[barButtonImage invertColor] selector:selector];
}

- (void)navBarWithBackButtonAndTitleImage {
    [self navBarWithTitleImage];
    [self addBackButtonItemAsLeftButtonItem];
}

- (void)navBarWithCloseButtonAndTitle:(NSString *)title {
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
    [self setNavBarTitle:title];
    
    // Check if the "Close" button needs to be displayed
    if (self.presentingViewController || (self.navigationController && self.navigationController.viewControllers.count > 1)) {
        [self addCloseButtonItem];
    }
}

- (void)navBarWithBackButtonAndTitle:(NSString *)title {
    // Display the back button if necessary
    if (self.navigationController.viewControllers.count > 1) {
        [self addBackButtonItemAsLeftButtonItem];
    }
    [self setNavBarTitle:title];
}

- (void)navBarWithWhiteBackButtonAndTitle:(NSString *)title {
    // Display the back button if necessary
    if (self.navigationController.viewControllers.count > 1) {
        [self addWhiteBackButtonItemAsLeftButtonItem];
    }
    [self setNavBarTitle:title];
}

- (void)navBarWithWhiteBackButtonAndTitle:(NSString *)title withSelector:(SEL)selector{
    // Display the back button if necessary
    if (self.navigationController.viewControllers.count > 1) {
        [self addWhiteLeftButtonItem:@"button_back" selector:selector];
    }
    [self setNavBarTitle:title];
}

- (void)navBarWithBackButtonAndTitle:(NSString *)title
                rightButtonImageName:(NSString *)imageName
                 rightButtonSelector:(SEL)selector {
    [self addBackButtonItemAsLeftButtonItem];
    
    [self setNavBarTitle:title];
    
    [self addRightButtonItem:imageName selector:selector];
}


- (void)navBarWithLeftButton:(NSString *)leftButtonImageName
          leftButtonSelector:(SEL)leftButtonSelector
              andRightButton:(NSString *)rightButtonImageName
         rightButtonSelector:(SEL)rightButtonSelector
         withTitleImageNamed:(NSString *)imageName {
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    
    [self addLeftButtonItem:leftButtonImageName selector:leftButtonSelector];
    [self addRightButtonItem:rightButtonImageName selector:rightButtonSelector];
}


- (void)navBarWithLeftButtonImage:(UIImage *)leftButtonImage
               leftButtonSelector:(SEL)leftButtonSelector
              andRightButtonImage:(UIImage *)rightButtonImage
              rightButtonSelector:(SEL)rightButtonSelector
                   withTitleImage:(UIImage *)image {
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
    
    [self addLeftButtonImageItem:leftButtonImage selector:leftButtonSelector];
    [self addRightButtonImageItem:rightButtonImage selector:rightButtonSelector];
}

- (void)navBarWithTitle:(NSString *)title
    andLeftButtonImage:(UIImage *)leftButtonImage
               leftButtonSelector:(SEL)leftButtonSelector
                     leftTarget:(nullable id)target
              andRightButtonImage:(UIImage *)rightButtonImage
              rightButtonSelector:(SEL)rightButtonSelector{
    
    [self setNavBarTitle:title];
    [self addLeftButtonImageItem:leftButtonImage selector:leftButtonSelector withLeftTarget:target];
    [self addRightButtonImageItem:rightButtonImage selector:rightButtonSelector];
}


- (void)navBarWithLeftButtonImage:(UIImage *)leftButtonImage
               leftButtonSelector:(SEL)leftButtonSelector
              andRightButtonImage:(UIImage *)rightButtonImage
              rightButtonSelector:(SEL)rightButtonSelector
                   withTitleImage:(UIImage *)image
                        animation:(BOOL)animation {
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
    if (animation) {
        self.navigationItem.titleView.alpha = 0.0f;
        [UIView animateWithDuration:0.5f animations:^{
            self.navigationItem.titleView.alpha = 1.0f;
        }];
    }
    
    [self addLeftButtonImageItem:leftButtonImage selector:leftButtonSelector animation:animation];
    [self addRightButtonImageItem:rightButtonImage selector:rightButtonSelector animation:animation];
}

- (void)navBarWithTitle:(NSString *)title
     andRightButtonText:(NSString *)text
           withSelector:(SEL)selector {
    [self navBarWithTitle:title andRightButtonText:text withSelector:selector selectorTarget:self];
}

- (void)navBarWithTitle:(NSString *)title
     andRightButtonText:(NSString *)text
           withSelector:(SEL)selector
         selectorTarget:(id)target {
    [self.navigationItem setHidesBackButton:YES animated:YES];
    [self setNavBarTitle:title];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.titleLabel.attributedText = [[NSAttributedString alloc]initWithString:title
                                                                           attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                                        NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:14.0],
                                                                                        NSKernAttributeName: @(2.0f)}];


    rightButton.frame = CGRectMake(0, 0, 50, 12);
    // Add the target
    [rightButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    // Add the container bar button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.backBarButtonItem = nil;
}

- (void)hideBackButton {
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = nil;
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

#pragma mark - Bar Button Actions
- (void)close:(NSObject *)sender {
    if (!self.parentViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)closeToRootViewController:(NSObject *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)back:(NSObject *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, (CGRect) {.size = size});
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)navBarWithSearchBar {
    UISearchBar *searchBar = [[UISearchBar new] initWithFrame:self.navigationItem.titleView.frame];
    searchBar.barStyle = UIBarStyleBlack;
    searchBar.backgroundImage = [[UIImage alloc] init];
    searchBar.translucent = YES;
    
    [searchBar setSearchBarStyle:UISearchBarStyleMinimal];
    searchBar.backgroundColor = [UIColor clearColor];
    searchBar.tintColor = [UIColor blackColor];
    
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setTextColor:[UIColor whiteColor]];
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:14.0]];
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setBackgroundColor:[UIColor redColor]];
    
    self.navigationItem.titleView = searchBar;
    
    for (UIView *subview in [[searchBar.subviews lastObject] subviews]) {
        if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
            [subview addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]]];
            break;
        }
    }
    [searchBar setBackgroundColor:[UIColor clearColor]];
    UIImage *clearImg = [self imageWithColor:[UIColor clearColor] andSize:CGSizeMake(300, 30)];
    [searchBar setBackgroundImage:clearImg];
}

- (UIViewController *)findLastViewController:(Class)aClass {
    for (int index = ((int)self.navigationController.viewControllers.count - 1); index >= 0; index--) {
        UIViewController *vc = self.navigationController.viewControllers[index];
        if ([vc isKindOfClass:aClass]) {
            return vc;
        }
    }
    return nil;
}

- (UIViewController *)findViewControllerByIndex:(int)numberOfIndex {
    if (self.navigationController.viewControllers.count <= numberOfIndex) {
        return nil;
    }
    else {
        return self.navigationController.viewControllers[self.navigationController.viewControllers.count-numberOfIndex-1];
    }
}

//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class class = [self class];
//        
//        SEL originalSelector = @selector(viewWillAppear:);
//        SEL swizzledSelector = @selector(viewWillAppearNavigationBarFix:);
//        
//        Method originalMethod = class_getInstanceMethod(class, originalSelector);
//        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
//        
//        BOOL didAddMethod =
//        class_addMethod(class,
//                        originalSelector,
//                        method_getImplementation(swizzledMethod),
//                        method_getTypeEncoding(swizzledMethod));
//        
//        if (didAddMethod) {
//            class_replaceMethod(class,
//                                swizzledSelector,
//                                method_getImplementation(originalMethod),
//                                method_getTypeEncoding(originalMethod));
//        }
//        else {
//            method_exchangeImplementations(originalMethod, swizzledMethod);
//        }
//    });
//}

#pragma mark - Method Swizzling

- (void)viewWillAppearNavigationBarFix:(BOOL)animated {
    [self viewWillAppearNavigationBarFix:animated];
    
    for (UINavigationItem *item in self.navigationController.navigationBar.subviews) {
        if ([item isKindOfClass:[UILabel class]]) {
            [((UILabel *)item) setTextColor:[UIColor blackColor]];
        }
        if ([item isKindOfClass:[UIButton class]]) {
            ((UIButton *)item).imageView.image = [((UIButton *)item).imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            [((UIButton *)item).imageView setTintColor:[UIColor blackColor]];
            [((UIButton *)item) setImage:((UIButton *)item).imageView.image forState:UIControlStateNormal];
        }
    }
}

@end
