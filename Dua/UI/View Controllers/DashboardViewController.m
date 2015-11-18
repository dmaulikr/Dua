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

static NSString *kCellId = @"cellId";

@interface DashboardViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *duasArray;


@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    UILabel *titleLabel = [UILabel new];
    titleLabel.attributedText = [[NSAttributedString alloc]initWithString:@"Dua"
                                                               attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                            NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:14.0],
                                                                            NSKernAttributeName: @(2.0f)}];
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
    UIImage *menu = [UIImage imageNamed:@"icon_sideMenu"];
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:menu forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0, 0, 35, 35);

    self.navigationItem.backBarButtonItem = nil;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
   
    UIImage *fav = [UIImage imageNamed:@"icon_favorites"];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:fav forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(0, 0, 35, 35);
    // Add the target
//    [rightButton addTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
    
    // Add the container bar button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.backBarButtonItem = nil;

    
    
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
    

    NSArray *array = [DuaData getAllDuas];
    NSMutableArray *mutArray = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *duaDict in array) {
        DuaModel *dua = [[DuaModel alloc] initWithJson:duaDict];
        [mutArray addObject:dua];
    }
    _duasArray = mutArray.copy;
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [(MPSkewedParallaxLayout *)self.collectionView.collectionViewLayout setItemSize:CGSizeMake(CGRectGetWidth(self.view.bounds), 150)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.duasArray.count;//self.titles.count; // random
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MPSkewedCell* cell = (MPSkewedCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kCellId forIndexPath:indexPath];
    
    DuaModel *dua = self.duasArray[indexPath.row];
    cell.image =[UIImage imageNamed:dua.image];
    cell.text = [dua.name uppercaseString];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@ %zd", NSStringFromSelector(_cmd), indexPath.item);
}



@end
