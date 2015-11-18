//
//  CategoryViewController.m
//  Dua
//
//  Created by Sameer Siddiqui on 11/18/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import "CategoryViewController.h"
#import "UIViewController+Navigation.h"
@interface CategoryViewController ()

@end

@implementation CategoryViewController

+ (CategoryViewController *)create {
    return [[UIStoryboard storyboardWithName:@"Dashboard" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([CategoryViewController class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    [self navBarWithWhiteBackButtonAndTitle:[self.dua.name uppercaseString]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
