//
//  DashboardViewController.m
//  Dua
//
//  Created by Sameer Siddiqui on 11/17/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import "DashboardViewController.h"
#import "MPSkewedCell.h"
#import "MPSkewedParallaxLayout.h"
#import "DuaData.h"
#import "DuaModel.h"
#import <AMWaveTransition.h>
#import "CategoryViewController.h"
#import "UIViewController+Navigation.h"
#import "CategoryViewController.h"
#import "FavoritesViewController.h"
#import "UIImage+Scale.h"
#import "ImageDownloader.h"
#import "UIViewController+displayPopup.h"
#import "PopupViewController.h"
#import "DuaDetailViewController.h"



static NSString *kCellId = @"cellId";

@interface DashboardViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource, UINavigationControllerDelegate, SWRevealViewControllerDelegate, AMWaveTransitioning>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *categoriesArray;

@end

@implementation DashboardViewController

#pragma mark - Lifecycle
+ (DashboardViewController *)create {
    DashboardViewController *vc = [[UIStoryboard storyboardWithName:@"Dashboard" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([DashboardViewController class])];
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupCollectionView];
    [self setupView];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setDelegate:self];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [(MPSkewedParallaxLayout *)self.collectionView.collectionViewLayout setItemSize:CGSizeMake(CGRectGetWidth(self.view.bounds), 150)];
}

- (void)dealloc {
    [self.navigationController setDelegate:nil];
}

#pragma mark - utils

- (void)setupView {
    self.navigationController.view.backgroundColor = [UIColor blackColor];
    //reveal view controller
    SWRevealViewController *revealController = [self revealViewController];
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    self.revealViewController.delegate = self;
    self.revealViewController.rearViewRevealDisplacement = 0;
    
    [self navBarWithTitle:@"Daily Duas" andLeftButtonImage:[UIImage imageNamed:@"icon_sideMenu"]  leftButtonSelector:@selector(revealToggle:) leftTarget:revealController andRightButtonImage:[UIImage imageNamed:@"icon_favorites"] rightButtonSelector:@selector(favPressed)];
    
    NSArray *array = [DuaData duas];
    NSMutableArray *mutArray = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *categoryDict in array) {
        //remove if statement if Ramadan is to be activated
        if (![[categoryDict objectForKey:@"category"]isEqualToString:@"Ramadan 🕋"]) {
            [mutArray addObject:categoryDict];
        }
    }
    _categoriesArray = mutArray;
    
    UIView *addStatusBar = [[UIView alloc] init];
    addStatusBar.frame = CGRectMake(0, -20, self.view.bounds.size.width, 20);
    addStatusBar.backgroundColor = [UIColor blackColor];
    [self.view addSubview:addStatusBar];
    [self.navigationController.navigationBar addSubview:addStatusBar];
}

- (void)setupCollectionView {
    MPSkewedParallaxLayout *layout = [[MPSkewedParallaxLayout alloc] init];
    layout.lineSpacing = 2;
    layout.itemSize = CGSizeMake(CGRectGetWidth(self.view.bounds), 150);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)  ) collectionViewLayout:layout];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor blackColor];
    [self.collectionView registerClass:[MPSkewedCell class] forCellWithReuseIdentifier:kCellId];
    [self.view addSubview:self.collectionView];
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongGesture:)];
    [self.collectionView addGestureRecognizer:longPressGesture];
    
}

#pragma mark - transition
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController*)fromVC
                                                 toViewController:(UIViewController*)toVC {
    if (operation != UINavigationControllerOperationNone) {
        // Return your preferred transition operation
        return [AMWaveTransition transitionWithOperation:operation andTransitionType:AMWaveTransitionTypeNervous];
    }
    return nil;
}


#pragma mark - collection view editing
- (void)handleLongGesture:(UILongPressGestureRecognizer*)gesture {
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            NSIndexPath *selectedIndex = [self.collectionView indexPathForItemAtPoint:[gesture locationInView:self.collectionView]];
            if (selectedIndex) {
                [self.collectionView beginInteractiveMovementForItemAtIndexPath:selectedIndex];
            }
        }
            break;
        case UIGestureRecognizerStateChanged:{
            [self.collectionView updateInteractiveMovementTargetPosition:[gesture locationInView:gesture.view]];
        }
            break;
        case UIGestureRecognizerStateEnded:{
            [self.collectionView endInteractiveMovement];
        }
            break;
        default:
        {
            [self.collectionView cancelInteractiveMovement];
        }
            break;
    }
}

- (void)favPressed {
    FavoritesViewController *vc = [FavoritesViewController create];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.categoriesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MPSkewedCell* cell = (MPSkewedCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kCellId forIndexPath:indexPath];
    
    if (cell != nil) {
        cell.layer.shouldRasterize = YES;
        cell.layer.rasterizationScale = [UIScreen mainScreen].scale;
        NSDictionary *categories = self.categoriesArray[indexPath.row];
        NSString *category = [categories objectForKey:@"category"];
        NSString *imageString = [categories objectForKey:@"image"];
        [ImageDownloader retrieveImageWithName:imageString withCompletionBlock:^(id responseData) {
            cell.image = responseData;
        }];
        cell.text = category;
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CategoryViewController *vc = [CategoryViewController create];
    NSDictionary *category = self.categoriesArray[indexPath.row];
    vc.duasArray = [category objectForKey:@"duas"];
    vc.category = category;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    if ([self.categoriesArray isKindOfClass:[NSMutableArray class]]) {
        NSString *dua = [self.categoriesArray objectAtIndex:sourceIndexPath.item];
        [(NSMutableArray *)self.categoriesArray removeObjectAtIndex:sourceIndexPath.item];
        [(NSMutableArray *)self.categoriesArray insertObject:dua atIndex:destinationIndexPath.item];
    }
}

- (NSArray*)visibleCells {
     NSMutableArray *cells = [@[] mutableCopy];
    [cells addObjectsFromArray:[self.collectionView visibleCells]];
    return cells;
}

#pragma mark - SWRevealViewControllerDelegate
- (void)revealController:(SWRevealViewController *)revealController didMoveToPosition:(FrontViewPosition)position {
    if (FrontViewPositionRight == position) {
        self.view.userInteractionEnabled = NO;
    }
    else if (FrontViewPositionLeft == position) {
        self.view.userInteractionEnabled = YES;
    }
}

- (id<UIViewControllerAnimatedTransitioning>)revealController:(SWRevealViewController *)revealController
                              animationControllerForOperation:(SWRevealControllerOperation)operation
                                           fromViewController:(UIViewController *)fromVC
                                             toViewController:(UIViewController *)toVC {
    if ( operation != SWRevealControllerOperationReplaceRightController) {
        return nil;
    }
    return nil;
}

@end
