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

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation CategoryViewController{
    ParallaxHeaderView *headerView ;
        UIScrollView *titleView;
}

+ (CategoryViewController *)create {
    return [[UIStoryboard storyboardWithName:@"Dashboard" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([CategoryViewController class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    [self navBarWithWhiteBackButtonAndTitle:@""];
    //title that sets into place
    [self setTitle:self.dua.name];
    titleView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, 200.0, 44.0)];
    [titleView setContentSize:CGSizeMake(0.0, 88.0)];
    [self.view insertSubview:titleView atIndex:0];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 44.0, CGRectGetWidth(titleView.frame), 44.0)];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
//    [titleLabel setFont:[UIFont boldSystemFontOfSize:17.0]];
//    [titleLabel setText:self.title];
//    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.attributedText = [[NSAttributedString alloc]initWithString:[self.title uppercaseString]
                                                               attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                            NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:14.0],
                                                                            NSKernAttributeName: @(2.0f)}];
    [titleView addSubview:titleLabel];
    
    
    self.navigationItem.titleView = titleView;
    
    
    
    self.tableView.delegate = (id)self;
    self.tableView.dataSource = (id)self;
    
    // Create ParallaxHeaderView with specified size, and set it as uitableView Header, that's it
    headerView = [ParallaxHeaderView parallaxHeaderViewWithImage:[UIImage imageNamed:self.dua.image] forSize:CGSizeMake(self.tableView.frame.size.width, 250)];
//    headerView.headerTitleLabel.text = self.dua.name;
    headerView.headerTitleLabel.attributedText = [[NSAttributedString alloc]initWithString: [self.dua.name uppercaseString]
                                                                                attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                             NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:14.0],
                                                                             NSKernAttributeName: @(2.0f)}];
    
   
    [self.tableView setTableHeaderView:headerView];
    
    
    
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [(ParallaxHeaderView *)self.tableView.tableHeaderView refreshBlurViewForNewImage];

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


#pragma mark -
#pragma mark UISCrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.tableView)
    {
        // pass the current offset of the UITableView so that the ParallaxHeaderView layouts the subViews.
        [(ParallaxHeaderView *)self.tableView.tableHeaderView layoutHeaderViewForScrollViewOffset:scrollView.contentOffset];
    }
    
    CGPoint contentOffset = CGPointMake(0.0,MIN(scrollView.contentOffset.y - 95.0, 44.0) );
    [titleView setContentOffset:contentOffset];
    
    
    
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


