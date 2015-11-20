//
//  DuaDetailViewController.m
//  Dua
//
//  Created by Sameer Siddiqui on 11/20/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import "DuaDetailViewController.h"
#import "UIViewController+Navigation.h"
#import "UIImage+Scale.h"

@interface DuaDetailViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
- (IBAction)shareButtonPressed:(id)sender;
- (IBAction)favoriteButtonPressed:(id)sender;

@end

@implementation DuaDetailViewController{
    UIScrollView *titleView;

}

+ (DuaDetailViewController *)create {
    return [[UIStoryboard storyboardWithName:@"Dashboard" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([DuaDetailViewController class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navBarWithWhiteBackButtonAndTitle:@""];
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
//    [self.tableView setTableFooterView:[[UIView alloc] init]];
    self.topLabel.attributedText = [[NSAttributedString alloc]initWithString:self.dua.title
                                                                  attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                               NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:13.0],
                                                                               NSKernAttributeName: @(2.0f)}];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 1)];

    
//    if (self.dua.arabic2 == nil) {
//        [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    } else {
//        [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
//    }
    
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    //title that sets into place
    [self setTitle:self.dua.title];
    titleView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.tableView.frame.size.width - 200.0, 44.0)];
    [titleView setContentSize:CGSizeMake(0.0, 88.0)];
    [self.view insertSubview:titleView atIndex:0];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 44.0, CGRectGetWidth(titleView.frame), 44.0)];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    titleLabel.numberOfLines = 2;
    titleLabel.attributedText = [[NSAttributedString alloc]initWithString:self.title
                                                               attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                            NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:13.0],
                                                                            NSKernAttributeName: @(2.0f)}];
    [titleView addSubview:titleLabel];
    self.navigationItem.titleView = titleView;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view delegate and data source

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.dua.arabic2 == nil) {
        return 1;
    } else {
        return 2;
    }
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DuaDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell setBackgroundColor:[UIColor clearColor]];
    if (self.dua.arabic2 == nil) {
        [cell initializeCellWithArabic:self.dua.arabic withTranslation:self.dua.translation andTransliteration:nil];
        
        return cell;
    }else {
        switch (indexPath.row) {
            case 0:
            {
                [cell initializeCellWithArabic:self.dua.arabic withTranslation:self.dua.translation andTransliteration:nil];
                return cell;
            }
                break;
            case 1:
            {
                [cell initializeCellWithArabic:self.dua.arabic2 withTranslation:self.dua.translation2 andTransliteration:nil];
                return cell;
            }
                break;
                
            default:
                break;
        }
    }
    return nil;
}

- (IBAction)shareButtonPressed:(id)sender {
    UIView *subView = self.view;
    UIGraphicsBeginImageContextWithOptions(subView.bounds.size, YES, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [subView.layer renderInContext:context];
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSArray *objectsToShare = @[snapshotImage];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    
    [self presentViewController:activityVC animated:YES completion:nil];
}

- (IBAction)favoriteButtonPressed:(id)sender {
}


#pragma mark - UISCrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGPoint contentOffset = CGPointMake(0.0,MIN(scrollView.contentOffset.y + 54.0, 44.0) );
    [titleView setContentOffset:contentOffset];
    
}



@end


@interface DuaDetailCell ()
@property (weak, nonatomic) IBOutlet UILabel *arabicLabel;
@property (weak, nonatomic) IBOutlet UILabel *translationLabel;
@property (weak, nonatomic) IBOutlet UILabel *transliterationLabel;

@end
@implementation DuaDetailCell

- (void)initializeCellWithArabic:(NSString *)arabic withTranslation:(NSString *)translation andTransliteration:(NSString *)transliteration {
    self.backgroundColor = [UIColor blackColor];
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.05];
    [self setSelectedBackgroundView:bgColorView];
    self.arabicLabel.numberOfLines = 0;
    self.translationLabel.numberOfLines = 0;
    self.transliterationLabel.numberOfLines = 0;

    self.arabicLabel.attributedText = [[NSAttributedString alloc]initWithString:arabic
                                                                     attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                                  NSFontAttributeName: [UIFont fontWithName:@"Thonburi-Light" size:30.0],
                                                                                  NSKernAttributeName: @(1.0f)}];
    self.translationLabel.attributedText = [[NSAttributedString alloc]initWithString:translation
                                                                          attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                                       NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:14.0],
                                                                                       NSKernAttributeName: @(2.0f)}];
    self.transliterationLabel.attributedText = [[NSAttributedString alloc]initWithString:@""
                                                                              attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                                           NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:20.0],
                                                                                           NSKernAttributeName: @(2.0f)}];
}

@end
