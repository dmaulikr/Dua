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

@interface RearViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

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
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationController.navigationBarHidden = YES;
    self.tableView.backgroundColor = [UIColor grayColor];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - table view delegate and data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RearTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell setBackgroundColor:[UIColor clearColor]];
    switch (indexPath.row) {
        case 0:
            [cell initializeCellWithTitle:@"Search" withImageNamed:nil];
            break;
        case 1:
            [cell initializeCellWithTitle:@"About" withImageNamed:nil];
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.revealViewController setFrontViewPosition:FrontViewPositionLeft animated:YES];

    
    if (indexPath.row == 0)
    {
        
        SearchViewController *vc = [SearchViewController create];
        [((UINavigationController *)self.revealViewController.frontViewController) pushViewController:vc animated:YES];
    }
    
    else if (indexPath.row == 1)
    {
    }

}

@end
