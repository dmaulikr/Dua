//
//  SearchViewController.m
//  Dua
//
//  Created by Sameer Siddiqui on 11/21/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import "SearchViewController.h"
#import "DuaData.h"
#import "DuaModel.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray *mut = [[NSMutableArray alloc]init];
    
    NSArray *array = [DuaData duas];
    NSMutableArray *mutArray = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *categoryDict in array) {
        [mutArray addObject:categoryDict];
        NSArray *arr = [categoryDict objectForKey:@"duas"];
        for (NSDictionary *duas in arr) {
            [mut addObject:duas];
        }
        
    }
    
    for (NSDictionary *dua in mut) {
        if ([[dua objectForKey:@"searchKeys"]isEqualToString:@"hello"]) {
            DuaModel *d = [[DuaModel alloc]initWithJson:dua];
            NSLog(@"%@",d);
        }
    }
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
