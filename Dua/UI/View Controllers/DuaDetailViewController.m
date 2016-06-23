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
#import "FavoriteModel.h"
#import <Crashlytics/Crashlytics.h>
#import <AMWaveTransition.h>
#import <Google/Analytics.h>



@interface DuaDetailViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate, AMWaveTransitioning>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UIView *header;

- (IBAction)shareButtonPressed:(id)sender;
- (IBAction)favoriteButtonPressed:(id)sender;

@end


@implementation DuaDetailViewController {
    UIScrollView *titleView;
    BOOL _checkedState;
    CGFloat scale;
}

+ (DuaDetailViewController *)create {
    return [[UIStoryboard storyboardWithName:@"Dashboard" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([DuaDetailViewController class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navBarWithWhiteBackButtonAndTitle:@""];
//    [self navBarWithWhiteBackButtonAndTitle:@"" withSelector:@selector(backPressed)];
    self.view.backgroundColor = [UIColor clearColor];
    self.navigationController.view.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.topLabel.attributedText = [[NSAttributedString alloc]initWithString:self.dua.title
                                                                  attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                               NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:13.0],
                                                                               NSKernAttributeName: @(2.0f)}];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 1)];
    
    [Answers logCustomEventWithName:[NSString stringWithFormat:@"Seen:%@", self.dua.title]
                   customAttributes:@{}];
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:self.title];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
    
    
    UIPinchGestureRecognizer *gesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchDetected:)];
    [self.view addGestureRecognizer:gesture];

    scale = 1;
    
}

- (void)pinchDetected:(UIPinchGestureRecognizer*) gestureRecognizer {
//    scale = pinchRecognizer.scale;
    
//    
//    if([gestureRecognizer state] == UIGestureRecognizerStateBegan) {
//        // Reset the last scale, necessary if there are multiple objects with different scales
//        scale = [gestureRecognizer scale];
//    }
//    
//    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan ||
//        [gestureRecognizer state] == UIGestureRecognizerStateChanged) {
//        
//        CGFloat currentScale = [[[gestureRecognizer view].layer valueForKeyPath:@"transform.scale"] floatValue];
//        
//        // Constants to adjust the max/min values of zoom
//        const CGFloat kMaxScale = 2.0;
//        const CGFloat kMinScale = 1.0;
//        
//        CGFloat newScale = 1 -  (scale - [gestureRecognizer scale]);
//        newScale = MIN(newScale, kMaxScale / currentScale);
//        newScale = MAX(newScale, kMinScale / currentScale);
//        CGAffineTransform transform = CGAffineTransformScale([[gestureRecognizer view] transform], newScale, newScale);
//        [gestureRecognizer view].transform = transform;
    
        scale = [gestureRecognizer scale];  // Store the previous scale factor for the next pinch gesture call
//    }
    
    
    
    [self.tableView reloadData];
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
    
    NSArray *array = [self readArrayWithCustomObjFromUserDefaults:@"favorites"];
    for (FavoriteModel *model in array) {
        if ([model.title isEqualToString:self.dua.title]) {
            [self.favoriteButton setImage:[UIImage imageNamed:@"icon_favoritesFilled"] forState:UIControlStateNormal];
            _checkedState = YES;
        }
    }
   

}




-(NSArray *)visibleCells {
    NSMutableArray *cells = [@[]mutableCopy];
    if (self.header != nil) {
        [cells addObject:self.header];
    }
    [cells addObjectsFromArray:[self.tableView visibleCells]];
    
    return cells;
}

- (void)backPressed {
    UIViewController *source = self;
    
    CATransition* transition = [CATransition animation];
    transition.duration = .25;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    
    [source.navigationController.view.layer addAnimation:transition
                                                  forKey:kCATransition];
    [self.navigationController popViewControllerAnimated:NO];
    
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
        [cell initializeCellWithArabic:self.dua.arabic withTranslation:self.dua.translation andTransliteration:self.dua.transliteration withFontSize:scale];
        cell.preservesSuperviewLayoutMargins = false;
        cell.separatorInset = UIEdgeInsetsZero;
        cell.layoutMargins = UIEdgeInsetsZero;

        return cell;
    }
    else {
        switch (indexPath.row) {
            case 0:
            {
                [cell initializeCellWithArabic:self.dua.arabic withTranslation:self.dua.translation andTransliteration:self.dua.transliteration withFontSize:scale];
                cell.preservesSuperviewLayoutMargins = false;
                cell.separatorInset = UIEdgeInsetsZero;
                cell.layoutMargins = UIEdgeInsetsZero;

                return cell;
            }
                break;
            case 1:
            {
                [cell initializeCellWithArabic:self.dua.arabic2 withTranslation:self.dua.translation2 andTransliteration:self.dua.transliteration2 withFontSize:scale];
                cell.preservesSuperviewLayoutMargins = false;
                cell.separatorInset = UIEdgeInsetsZero;
                cell.layoutMargins = UIEdgeInsetsZero;

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
    [self.favoriteButton setHidden:YES];
    [self.shareButton setHidden:YES];
    UIView *subView = self.view;
    UIGraphicsBeginImageContextWithOptions(subView.bounds.size, YES, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [subView.layer renderInContext:context];
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.favoriteButton setHidden:NO];
    [self.shareButton setHidden:NO];
    
    NSArray *objectsToShare = @[snapshotImage];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    
    [self presentViewController:activityVC animated:YES completion:nil];
}

- (IBAction)favoriteButtonPressed:(id)sender {
    [self toggle];
}

- (void) toggle {
    [self setChecked:!_checkedState];
}

- (void) setChecked:(BOOL)state {
    _checkedState = state;
    if (state) {
        FavoriteModel *model = [[FavoriteModel alloc]init];
        model.title = self.dua.title;
        NSArray *array = [self readArrayWithCustomObjFromUserDefaults:@"favorites"];
        NSMutableArray *mutArray = [[NSMutableArray alloc]init];
        if (array != nil) {
            [mutArray addObjectsFromArray:array];
        }
        
        [mutArray addObject:model];
        [self writeArrayWithCustomObjToUserDefaults:@"favorites" withArray:mutArray];
        [self.favoriteButton setImage:[UIImage imageNamed:@"icon_favoritesFilled"] forState:UIControlStateNormal];
       
        
        [Answers logCustomEventWithName:[NSString stringWithFormat:@"Fav:%@", self.dua.title]
                       customAttributes:@{}];
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        [tracker set:@"Favorite" value:self.title];
        [tracker send:[[GAIDictionaryBuilder createScreenView] build]];

    }
    else {
        
        FavoriteModel *model = [[FavoriteModel alloc]init];
        model.title = self.dua.title;
        model.arabic = self.dua.arabic;
        model.translation = self.dua.translation;
        model.transliteration = self.dua.transliteration;
        
        NSArray *array = [self readArrayWithCustomObjFromUserDefaults:@"favorites"];
        NSMutableArray *mutArray = [[NSMutableArray alloc]init];
        if (array != nil) {
            [mutArray addObjectsFromArray:array];
        }
        
        for (int i=(int)mutArray.count-1; i>=0; i--) {
            FavoriteModel *fav = [mutArray objectAtIndex:i];
            if ([fav.title isEqualToString:self.dua.title]) {
                [mutArray removeObject:fav];
            }
        }
        [self writeArrayWithCustomObjToUserDefaults:@"favorites" withArray:mutArray];

        [self.favoriteButton setImage:[UIImage imageNamed:@"icon_favorites"] forState:UIControlStateNormal];
        NSLog(@"%@",mutArray);
    }
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

-(void)awakeFromNib {
    [super awakeFromNib];
//    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 3, self.frame.size.width, 3)];
//    line.backgroundColor = [UIColor colorWithRed:39.0/255.0 green:43.0/255.0 blue:46.0/255.0 alpha:1.0f];
//    [self addSubview:line];
}
- (void)drawRect:(CGRect)rect{
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    [[UIColor darkGrayColor] setStroke];
//    
//    CGContextSetLineWidth(context, 1);
//    CGContextBeginPath(context);
//    CGContextMoveToPoint(context, 0, 0.5);
//    CGContextAddLineToPoint(context, CGRectGetMaxX(rect), 0.5);
//    
//    CGContextStrokePath(context);
}
- (void)initializeCellWithArabic:(NSString *)arabic withTranslation:(NSString *)translation andTransliteration:(NSString *)transliteration withFontSize:(CGFloat)size{
    self.backgroundColor = [UIColor clearColor];
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.05];
    [self setSelectedBackgroundView:bgColorView];
    self.arabicLabel.numberOfLines = 0;
    self.translationLabel.numberOfLines = 0;
    self.transliterationLabel.numberOfLines = 0;

    
    
    CGFloat arabicSize;
    CGFloat translationSize;

    arabicSize = 30 * size;
    if (arabicSize >= 60) {
        arabicSize = 60;
    }
    if (arabicSize <= 30) {
        arabicSize = 30;
    }
    translationSize = 14 * size;
    if (translationSize >= 28) {
        translationSize = 28;
    }
    if (translationSize<=14) {
        translationSize = 14;
    }

    self.arabicLabel.attributedText = [[NSAttributedString alloc]initWithString:arabic
                                                                     attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                                  NSFontAttributeName: [UIFont fontWithName:@"AlQalamQuranMajeed2" size:arabicSize]}];
//                                                                                  NSKernAttributeName: @(1.0f)}];
    self.translationLabel.attributedText = [[NSAttributedString alloc]initWithString:translation
                                                                          attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                                       NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:translationSize],
                                                                                       NSKernAttributeName: @(2.0f)}];
    self.transliterationLabel.attributedText = [[NSAttributedString alloc]initWithString:transliteration
                                                                              attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                                           NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-MediumItalic" size:translationSize],
                                                                                           NSKernAttributeName: @(2.0f)}];
    
    
}


@end
