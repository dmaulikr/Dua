//
//  RearViewController.m
//  Dua
//
//  Created by Sameer Siddiqui on 11/18/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import "RearViewController.h"
#import "RearTableViewCell.h"
#import "UIImage+Scale.h"
#import "SearchViewController.h"
#import "AppDelegate.h"
#import "SWRevealViewController.h"
#import "AboutViewController.h"
#import "FavoritesViewController.h"

@interface RearViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;

@end
@implementation RearViewController {
        NSInteger _presentedRow;
    }

+ (RearViewController*)create {
    RearViewController *vc = [[UIStoryboard storyboardWithName:@"Dashboard" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([RearViewController class])];
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:39.0/255.0 green:43.0/255.0 blue:46.0/255.0 alpha:1.0f];
    self.navigationController.navigationBarHidden = YES;
    self.tableView.scrollEnabled = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.topLabel.attributedText = [[NSAttributedString alloc]initWithString:@"Daily Duas"
                                                                  attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                               NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:14.0],
                                                                               NSKernAttributeName: @(2.0f)}];
    
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 167.0f, self.view.frame.size.width, 1 / UIScreen.mainScreen.scale)];
    line.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.1f];
    [self.view addSubview:line];

}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

//- (BOOL)prefersStatusBarHidden {
//    return YES;
//}

#pragma mark - table view delegate and data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RearTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell setBackgroundColor:[UIColor clearColor]];
    switch (indexPath.row) {
        case 0:
            [cell initializeCellWithTitle:@"Search" withImageNamed:@"search"];
            break;
        case 1:
            [cell initializeCellWithTitle:@"Favorites" withImageNamed:@"icon_favorites"];
            break;

        case 2:
            [cell initializeCellWithTitle:@"About" withImageNamed:@"info"];
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.revealViewController setFrontViewPosition:FrontViewPositionLeft animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (indexPath.row == 0)
    {
        SearchViewController *vc = [SearchViewController create];
        [((UINavigationController *)self.revealViewController.frontViewController) pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 1)
    {
        FavoritesViewController *vc = [FavoritesViewController create];
        [((UINavigationController *)self.revealViewController.frontViewController) pushViewController:vc animated:YES];
    }

    
    else if (indexPath.row == 2)
    {
        AboutViewController *vc = [AboutViewController create];
        [((UINavigationController *)self.revealViewController.frontViewController) pushViewController:vc animated:YES];
    }

}

@end
