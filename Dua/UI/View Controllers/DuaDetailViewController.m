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

@interface DuaDetailViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
- (IBAction)shareButtonPressed:(id)sender;
- (IBAction)favoriteButtonPressed:(id)sender;

@end

@implementation DuaDetailViewController

+ (DuaDetailViewController *)create {
    return [[UIStoryboard storyboardWithName:@"Dashboard" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([DuaDetailViewController class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navBarWithWhiteBackButtonAndTitle:self.dua.title];
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
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
    self.arabicLabel.attributedText = [[NSAttributedString alloc]initWithString:arabic
                                                                     attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                                  NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-UltraLight" size:22.0],
                                                                                  NSKernAttributeName: @(2.0f)}];
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
