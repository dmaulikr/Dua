//
//  CategoryViewController.m
//  Dua
//
//  Created by Sameer Siddiqui on 11/18/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import "CategoryViewController.h"
#import "UIViewController+Navigation.h"
#import "DuaData.h"
#import "DuaDetailViewController.h"
#import <AMWaveTransition.h>
#import <Crashlytics/Crashlytics.h>
#import <Google/Analytics.h>


@interface CategoryViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate, AMWaveTransitioning>

@property (weak, nonatomic) IBOutlet UIImageView *topImage;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) UIView *header;


@end

const static CGFloat kTableViewHeaderHeight = 250.0f;
const static CGFloat kTableCutAway = 50.0f;


@implementation CategoryViewController{
    UIScrollView *titleView;
    CAShapeLayer *headerMarkLayer;
}

#pragma mark - Life Cycle
+ (CategoryViewController *)create {
    return [[UIStoryboard storyboardWithName:@"Dashboard" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([CategoryViewController class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (self.tableView.tableHeaderView != nil) {
        self.header = self.tableView.tableHeaderView;
        self.tableView.tableHeaderView = nil;
    }
    [self.tableView addSubview:self.header];
    self.tableView.contentInset = UIEdgeInsetsMake(kTableViewHeaderHeight, 0, 0, 0);
    self.tableView.contentOffset = CGPointMake(0, -kTableViewHeaderHeight);
    
    headerMarkLayer = [[CAShapeLayer alloc]init];
    headerMarkLayer.fillColor = [UIColor blackColor].CGColor;
    self.header.layer.mask = headerMarkLayer;
    
    self.topImage.image = [UIImage imageNamed:[self.category objectForKey:@"image"]];
    self.topLabel.attributedText = [[NSAttributedString alloc]initWithString:[self.title uppercaseString]
                                                                  attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                               NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:30.0],
                                                                               NSKernAttributeName: @(2.0f)}];
    [self updateHeaderView];
}

#pragma mark - utils

- (void)setupView {
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    self.navigationController.view.backgroundColor = [UIColor blackColor];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    NSArray *array = self.duasArray;
    NSMutableArray *mutArray = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *duaDict in array) {
        DuaModel *dua = [[DuaModel alloc] initWithJson:duaDict];
        [mutArray addObject:dua];
    }
    _duasArray = mutArray;
    [self navBarWithWhiteBackButtonAndTitle:@""];
    
    //title that sets into place
    [self setTitle:[self.category objectForKey:@"category"]];
    titleView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, 200.0, 44.0)];
    [titleView setContentSize:CGSizeMake(0.0, 88.0)];
    [self.view insertSubview:titleView atIndex:0];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 44.0, CGRectGetWidth(titleView.frame), 44.0)];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    titleLabel.attributedText = [[NSAttributedString alloc]initWithString:[self.title uppercaseString]
                                                               attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                            NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:14.0],
                                                                            NSKernAttributeName: @(2.0f)}];
    [titleView addSubview:titleLabel];
    self.navigationItem.titleView = titleView;
    
    //change statusbar to black
    UIView *addStatusBar = [[UIView alloc] init];
    addStatusBar.frame = CGRectMake(0, -20, self.view.bounds.size.width, 20);
    addStatusBar.backgroundColor = [UIColor blackColor];
    [self.view addSubview:addStatusBar];
    [self.navigationController.navigationBar addSubview:addStatusBar];
    
    self.tableView.delegate = (id)self;
    self.tableView.dataSource = (id)self;
    
    [Answers logCustomEventWithName:[NSString stringWithFormat:@"Cat:%@", self.title]
                   customAttributes:@{}];
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:@"Category" value:self.title];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];

}

- (NSArray*)visibleCells {
    NSMutableArray *cells = [@[]mutableCopy];
    if (self.header != nil) [cells addObject:self.header];
    [cells addObjectsFromArray:[self.tableView visibleCells]];
    return cells;
}

- (void)updateHeaderView {

    CGRect headerRect = CGRectMake(0, -kTableViewHeaderHeight, self.tableView.bounds.size.width, kTableViewHeaderHeight);
    if (self.tableView.contentOffset.y < -kTableViewHeaderHeight) {
        headerRect.origin.y = self.tableView.contentOffset.y;
        headerRect.size.height = -self.tableView.contentOffset.y;
    }
    self.header.frame = headerRect;
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(headerRect.size.width, 0)];
    [path addLineToPoint:CGPointMake(headerRect.size.width, headerRect.size.height)];
    [path addLineToPoint:CGPointMake(0, headerRect.size.height - kTableCutAway)];
    headerMarkLayer.path = path.CGPath;

}

#pragma mark - tableview delegate and data source

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.duasArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellid=@"cell";
    CategoryTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    
    DuaModel *dua = self.duasArray[indexPath.row];
    [cell initializeCellWithTitle:dua.title withImageNamed:nil];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DuaModel *dua = self.duasArray[indexPath.row];
    DuaDetailViewController *vc = [DuaDetailViewController create];
    vc.dua = dua;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UISCrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGPoint contentOffset = CGPointMake(0.0,MIN(scrollView.contentOffset.y + 167.0, 44.0) );
    [titleView setContentOffset:contentOffset];
    
    [self updateHeaderView];
}

@end


@implementation CategoryTableViewCell

#pragma mark - Life Cycle
- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.05];
    [self setSelectedBackgroundView:bgColorView];
    
    self.label.numberOfLines = 0;
}

- (void)initializeCellWithTitle:(NSString *)title withImageNamed:(NSString *)imageName {
    
    self.label.attributedText = [[NSAttributedString alloc]initWithString:title
                                                               attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                            NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:14.0],
                                                                            NSKernAttributeName: @(2.0f)}];
    if (imageName) {
        self.image.image = [UIImage imageNamed:imageName];
    }
}
@end


