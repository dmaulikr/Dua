//
//  FavoritesViewController.m
//  Dua
//
//  Created by Sameer Siddiqui on 11/21/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import "FavoritesViewController.h"
#import "UIViewController+Navigation.h"
#import "CategoryViewController.h"
#import "FavoriteModel.h"
#import "DuaModel.h"
#import "DuaDetailViewController.h"
#import "DuaData.h"

@interface FavoritesViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation FavoritesViewController{
    NSMutableArray *favArray;
}


#pragma mark - life cycle
+ (FavoritesViewController *)create {
    return [[UIStoryboard storyboardWithName:@"Dashboard" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([FavoritesViewController class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self getFavsArray];
}

#pragma mark - utils

- (void)setupView{
    [self navBarWithWhiteBackButtonAndTitle:[@"Favorites" uppercaseString]];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.editButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                  NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:15.0],
                                                  NSKernAttributeName: @(2.0f)} forState:UIControlStateNormal];
    
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)getFavsArray {
    
    NSArray *array = [self readArrayWithCustomObjFromUserDefaults:@"favorites"];
    if (array!=nil) {
        favArray = [[NSMutableArray alloc]init];
        for (FavoriteModel *fav in array) {
            [favArray addObject:fav];
        }
    }
    [self.tableView reloadData];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:YES];
}

- (void)writeArrayWithCustomObjToUserDefaults:(NSString *)keyName withArray:(NSMutableArray *)myArray {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:myArray];
    [defaults setObject:data forKey:keyName];
    [defaults synchronize];
}

- (NSArray *)readArrayWithCustomObjFromUserDefaults:(NSString*)keyName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:keyName];
    NSArray *myArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return myArray;
}

#pragma mark - tableview delegate and data source

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    id obj = [favArray objectAtIndex:sourceIndexPath.row] ;
    [favArray removeObjectAtIndex:sourceIndexPath.row];
    [favArray insertObject:obj atIndex:destinationIndexPath.row];
    [self writeArrayWithCustomObjToUserDefaults:@"favorites" withArray:favArray];
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {

        if (favArray.count > 1) {
            [favArray removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        else {
            [self.tableView beginUpdates];
            [favArray removeObjectAtIndex:indexPath.row];
            [self.tableView endUpdates];
            [self.tableView reloadData];
        }
        [self writeArrayWithCustomObjToUserDefaults:@"favorites" withArray:favArray];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return favArray.count>0?favArray.count:1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellid=@"cell";
    if (favArray.count > 0) {
        CategoryTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid];
        FavoriteModel *dua = favArray[indexPath.row];
        [cell initializeCellWithTitle:dua.title withImageNamed:nil];
        return cell;
    }
    else {
        NoFavCell *cell = [tableView dequeueReusableCellWithIdentifier:@"favCell"];
        [cell initializeCellWithTitle:@"Looks like you have no favorites added. Add a Dua to your favorites for quick access!"];
        self.navigationItem.rightBarButtonItem = nil;
        [self setEditing:NO animated:YES];
        return cell;
    }
    
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (favArray.count > 0) {
        NSArray *array = [self readArrayWithCustomObjFromUserDefaults:@"favorites"];
        NSMutableArray *mut = [[NSMutableArray alloc]init];
        NSArray *arraydata = [DuaData duas];
        NSMutableArray *mutArray = [[NSMutableArray alloc] initWithCapacity:array.count];
        NSMutableArray *duasArray = [[NSMutableArray alloc]init];
        
        for (NSDictionary *categoryDict in arraydata) {
            [mutArray addObject:categoryDict];
            NSArray *arr = [categoryDict objectForKey:@"duas"];
            for (NSDictionary *duas in arr) {
                [mut addObject:duas];
            }
        }
        
        for (int i =0; i<favArray.count; i++) {
            FavoriteModel *favModel = [favArray objectAtIndex:i];
            NSString *title = favModel.title;
            for (NSDictionary *dua in mut) {
                if ([[dua objectForKey:@"dua:title"] isEqualToString:title]) {
                    DuaModel *d = [[DuaModel alloc]initWithJson:dua];
                    [duasArray addObject:d];
                }
            }
        }

        DuaModel *fav = duasArray[indexPath.row];
        DuaModel *dua = [[DuaModel alloc]initWithDua:fav];
        DuaDetailViewController *vc = [DuaDetailViewController create];
        vc.dua = dua;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end


@implementation NoFavCell
#pragma mark - Life Cycle
- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
    self.backgroundColor = [UIColor blackColor];
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.05];
    [self setSelectedBackgroundView:bgColorView];
    
    self.label.numberOfLines = 0;
}

- (void)initializeCellWithTitle:(NSString *)title {
    
    self.label.attributedText = [[NSAttributedString alloc]initWithString:title
                                                               attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                            NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:14.0],
                                                                            NSKernAttributeName: @(2.0f)}];

}




@end