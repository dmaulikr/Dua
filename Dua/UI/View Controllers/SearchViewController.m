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
#import "DuaDetailViewController.h"
#import "UIViewController+Navigation.h"
#import "CategoryViewController.h"

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
    [self navBarWithWhiteBackButtonAndTitle:@""];
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, self.searchBar.frame.size.height - 1, self.searchBar.frame.size.width, 2.0f);
    bottomBorder.backgroundColor = [UIColor whiteColor].CGColor;
    [self.searchBar.layer addSublayer:bottomBorder];
    
  
    self.searchBar.font = [UIFont fontWithName:@"AvenirNext-DemiBold" size:14.0];
    self.searchBar.attributedPlaceholder = [[NSAttributedString alloc]initWithString:[@"search" uppercaseString]
                                                                          attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                                       NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:14.0],
                                                                                       NSKernAttributeName: @(2.0f)}];
    [self.searchBar setTextColor:[UIColor whiteColor]];
    [self.searchBar setTintColor:[UIColor whiteColor]];
    self.searchBar.keyboardAppearance = UIKeyboardAppearanceDark;
    
    CGFloat myWidth = 26.0f;
    CGFloat myHeight = 30.0f;
    UIButton *myButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, myWidth, myHeight)];
    [myButton setImage:[UIImage imageNamed:@"x"] forState:UIControlStateNormal];
    [myButton setImage:[UIImage imageNamed:@"x"] forState:UIControlStateHighlighted];
    myButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [myButton addTarget:self action:@selector(doClear:) forControlEvents:UIControlEventTouchUpInside];
    self.searchBar.rightView = myButton;
    self.searchBar.rightViewMode = UITextFieldViewModeWhileEditing;

    
    UITapGestureRecognizer *tapper = [[UITapGestureRecognizer alloc]
              initWithTarget:self action:@selector(handleSingleTap:)];
    tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper];
 
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.searchBar addTarget:self action:@selector(textFieldEdited:event:) forControlEvents:UIControlEventEditingChanged];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.searchBar removeTarget:self
                          action:@selector(textFieldEdited:event:)
                forControlEvents:UIControlEventEditingChanged];
}

- (void)doClear:(id)sender {
    self.searchBar.text = @"";
    [self.searchBar becomeFirstResponder];
    self.searchResultArray = @[@""];
    [self.tableView reloadData];
}


- (void)handleSingleTap:(UITapGestureRecognizer *) sender {
    [self.view endEditing:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [[self view] endEditing:TRUE];
    
}

#pragma mark - textField Delegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if ([[self.searchResultArray objectAtIndex:0]isKindOfClass:[NSString class]] && ![textField.text  isEqual: @""]) {
        self.searchResultArray = @[@"Could not be found"];
        [self.tableView reloadData];
    } else if ([textField.text isEqualToString:@""]) {
        self.searchResultArray = @[@""];
        [self.tableView reloadData];
    }
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (range.length > 0)
    {
        // We're deleting
        self.searchResultArray = nil;
        [self.tableView reloadData];
        
    }
    else
    {
        // We're adding
    }
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if ([[self.searchResultArray objectAtIndex:0]isKindOfClass:[NSString class]] && ![textField.text  isEqual: @""]) {
        self.searchResultArray = @[@"Could not be found"];
        [self.tableView reloadData];
    } else if ([textField.text isEqualToString:@""]) {
        self.searchResultArray = nil;
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
            if ([[[dua objectForKey:@"searchKeys"] lowercaseString ]containsString:[searchString lowercaseString]]) {
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

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResultArray.count > 0 ? self.searchResultArray.count : 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if ([[self.searchResultArray objectAtIndex:0]isKindOfClass:[DuaModel class]]) {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(changeLabel) object:nil];
        
        DuaModel *dua = [self.searchResultArray objectAtIndex:indexPath.row];
        [cell initializeCellWithTitle:dua.title withImageNamed:@""];
        [cell.disclosureImage setHidden:NO];
        
        cell.hidden = NO;
        
        
    } else {
        [cell.disclosureImage setHidden:YES];
        if ([self.searchResultArray objectAtIndex:0] != nil) {
            [cell initializeCellWithTitle:[self.searchResultArray objectAtIndex:0] withImageNamed:@""];
            cell.hidden = NO;
            if ([[[self.searchResultArray objectAtIndex:0] lowercaseString] isEqualToString:[@"Searching..." lowercaseString]]) {
                
                [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(changeLabel) object:nil];
                [self performSelector:@selector(changeLabel) withObject:nil afterDelay:1.0f];
            }
            
            
        } else {
            cell.hidden = YES;
        }
    }
    return cell;
    
}

- (void)changeLabel {
    self.searchResultArray = @[@"Could not be found"];
    [self.tableView reloadData];

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([[self.searchResultArray objectAtIndex:0]isKindOfClass:[DuaModel class]]) {
        DuaModel *dua = [self.searchResultArray objectAtIndex:indexPath.row];
        DuaDetailViewController *vc = [DuaDetailViewController create];
        vc.dua = dua;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
