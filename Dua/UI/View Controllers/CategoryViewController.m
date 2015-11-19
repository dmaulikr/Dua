//
//  CategoryViewController.m
//  Dua
//
//  Created by Sameer Siddiqui on 11/18/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import "CategoryViewController.h"
#import "UIViewController+Navigation.h"
#import "ParallaxHeaderView.h"

@interface CategoryViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *topImage;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;

@end

const static CGFloat kTableViewHeaderHeight = 250.0f;
const static CGFloat kTableCutAway = 50.0f;


@implementation CategoryViewController{
    UIScrollView *titleView;
    UIView *header;
    CAShapeLayer *headerMarkLayer;
}

+ (CategoryViewController *)create {
    return [[UIStoryboard storyboardWithName:@"Dashboard" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([CategoryViewController class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

    [self navBarWithWhiteBackButtonAndTitle:@""];

    //title that sets into place
    [self setTitle:self.dua.name];
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
    
    self.tableView.delegate = (id)self;
    self.tableView.dataSource = (id)self;

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    header = self.tableView.tableHeaderView;
    self.tableView.tableHeaderView = nil;
    [self.tableView addSubview:header];
    self.tableView.contentInset = UIEdgeInsetsMake(kTableViewHeaderHeight, 0, 0, 0);
    self.tableView.contentOffset = CGPointMake(0, -kTableViewHeaderHeight);
    
    headerMarkLayer = [[CAShapeLayer alloc]init];
    headerMarkLayer.fillColor = [UIColor blackColor].CGColor;
    header.layer.mask = headerMarkLayer;
    
    self.topImage.image = [UIImage imageNamed:self.dua.image];
    self.topLabel.attributedText = [[NSAttributedString alloc]initWithString:[self.title uppercaseString]
                                                                  attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                               NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:30.0],
                                                                               NSKernAttributeName: @(2.0f)}];
    
    [self updateHeaderView];

}

- (void)updateHeaderView {
    CGRect headerRect = CGRectMake(0, -kTableViewHeaderHeight, self.tableView.bounds.size.width, kTableViewHeaderHeight);
    if (self.tableView.contentOffset.y < -kTableViewHeaderHeight) {
        headerRect.origin.y = self.tableView.contentOffset.y;
        headerRect.size.height = -self.tableView.contentOffset.y;
    }
    header.frame = headerRect;
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(headerRect.size.width, 0)];
    [path addLineToPoint:CGPointMake(headerRect.size.width, headerRect.size.height)];
    [path addLineToPoint:CGPointMake(0, headerRect.size.height - kTableCutAway)];
    headerMarkLayer.path = path.CGPath;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview delegate and data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellid=@"cell";
    CategoryTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    [cell initializeCellWithTitle:@"hello" withImageNamed:nil];
    return cell;
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
    self.backgroundColor = [UIColor blackColor];
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.05];
    [self setSelectedBackgroundView:bgColorView];
}

- (void)initializeCellWithTitle:(NSString *)title withImageNamed:(NSString *)imageName {
    
    self.label.attributedText = [[NSAttributedString alloc]initWithString:[title uppercaseString]
                                                               attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                            NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:14.0],
                                                                            NSKernAttributeName: @(2.0f)}];
    self.image.image = [UIImage imageNamed:imageName];
}
@end


