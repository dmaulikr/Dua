//
//  RearTableViewCell.m
//  Dua
//
//  Created by Sameer Siddiqui on 11/18/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import "RearTableViewCell.h"

@implementation RearTableViewCell

#pragma mark - Life Cycle
- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
    self.backgroundColor = [UIColor grayColor];
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.05];
    [self setSelectedBackgroundView:bgColorView];
}

- (void)initializeCellWithTitle:(NSString *)title{
    self.label.attributedText = [[NSAttributedString alloc]initWithString:[title uppercaseString]
                                                               attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                            NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-DemiBold" size:14.0],
                                                                            NSKernAttributeName: @(2.0f)}];
}

- (void)initializeCellWithTitle:(NSString *)title withImageNamed:(NSString *)imageName {
    
    [self initializeCellWithTitle:title];
    self.image.contentMode = UIViewContentModeScaleAspectFit;
    self.image.image = [UIImage imageNamed:imageName];
}


@end
