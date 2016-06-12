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

@interface FavoritesViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FavoritesViewController{
    NSMutableArray *duasArray;
}

+ (FavoritesViewController *)create {
    return [[UIStoryboard storyboardWithName:@"Dashboard" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([FavoritesViewController class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self navBarWithWhiteBackButtonAndTitle:[@"Favorites" uppercaseString]];
    
        self.navigationItem.rightBarButtonItem = self.editButtonItem;
        [self.editButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                      NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:15.0],
                                                      NSKernAttributeName: @(2.0f)} forState:UIControlStateNormal];
    
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
  

}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:YES];
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    duasArray = [[NSMutableArray alloc]init];
    NSArray *array = [self readArrayWithCustomObjFromUserDefaults:@"favorites"];
    if (array!=nil) {
        [duasArray addObjectsFromArray:array];
        
    }
    [self.tableView reloadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [duasArray insertObject: [duasArray objectAtIndex:sourceIndexPath.row] atIndex:destinationIndexPath.row];
    [duasArray removeObjectAtIndex:(sourceIndexPath.row + 1)];
    [self writeArrayWithCustomObjToUserDefaults:@"favorites" withArray:duasArray];
    [self.tableView reloadData];

}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {

        [self.tableView beginUpdates];
        [duasArray removeObjectAtIndex:indexPath.row];
        
        [self writeArrayWithCustomObjToUserDefaults:@"favorites" withArray:duasArray];
        [self.tableView endUpdates];
        [self.tableView reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return duasArray.count>0?duasArray.count:1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellid=@"cell";
    if (duasArray.count > 0) {
        CategoryTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid];
        FavoriteModel *dua = duasArray[indexPath.row];
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
    if (duasArray.count > 0) {
        FavoriteModel *fav = duasArray[indexPath.row];
        NSDictionary *json = [[NSDictionary alloc]init];
        if (fav.arabic2 != nil) {
            json = @{@"dua:title":fav.title, @"dua:arabic":fav.arabic, @"dua:translation" : fav.translation, @"dua:transliteration" : fav.transliteration, @"dua:arabic2":fav.arabic2, @"dua:translation2" : fav.translation2, @"dua:transliteration2" : fav.transliteration2};
        } else {
        json = @{@"dua:title":fav.title, @"dua:arabic":fav.arabic, @"dua:translation" : fav.translation, @"dua:transliteration" : fav.transliteration};
        }
        DuaModel *dua = [[DuaModel alloc]initWithJson:json];;
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