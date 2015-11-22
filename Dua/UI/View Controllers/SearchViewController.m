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

@interface SearchViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *searchResultArray;


@end

@implementation SearchViewController{
}

+ (SearchViewController *)create {
    return [[UIStoryboard storyboardWithName:@"Dashboard" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([SearchViewController class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self.searchBar addTarget:self action:@selector(textFieldEdited:event:) forControlEvents:UIControlEventEditingChanged];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.searchBar removeTarget:self
                          action:@selector(textFieldEdited:event:)
                forControlEvents:UIControlEventEditingChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - textField Delegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if ([[self.searchResultArray objectAtIndex:0]isKindOfClass:[NSString class]]) {
        self.searchResultArray = @[@"Could not be found"];
        [self.tableView reloadData];
    }
    return YES;
}

- (void)textFieldEdited:(UITextField*)textfield event:(UIEvent*)event {
    NSString *stringTitle = nil;
    stringTitle = textfield.text;
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self performSelector:@selector(updateSearchResultsForSearchString:) withObject:stringTitle afterDelay:0.1f];
}
#pragma mark - Search

- (void)updateSearchResultsForSearchString:(NSString *)searchString {
    
    if (![searchString isEqualToString:@""]) {
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
        
        BOOL found = NO;
        NSMutableArray *searched = [[NSMutableArray alloc]init];
        for (NSDictionary *dua in mut) {
            if ([[dua objectForKey:@"searchKeys"]isEqualToString:searchString]) {
                DuaModel *d = [[DuaModel alloc]initWithJson:dua];
                [searched addObject:d];
                found = YES;
            }
        }

        if (found) {
            self.searchResultArray = searched.copy;
        }
        else {
            self.searchResultArray = @[@"searching..."];
        }
        
        [self.tableView reloadData];
    }
    
}
#pragma mark - tableView delegate and datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResultArray.count > 0 ? self.searchResultArray.count : 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        
        /*
         *   Actually create a new cell (with an identifier so that it can be dequeued).
         */
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    if ([[self.searchResultArray objectAtIndex:0]isKindOfClass:[DuaModel class]]) {
        DuaModel *dua = [self.searchResultArray objectAtIndex:indexPath.row];
        cell.textLabel.text = dua.title;
    } else {
        cell.textLabel.text = [self.searchResultArray objectAtIndex:0];
    }
    return cell;
}

@end
