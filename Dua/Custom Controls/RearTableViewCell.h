//
//  RearTableViewCell.h
//  Dua
//
//  Created by Sameer Siddiqui on 11/18/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RearTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *label;

- (void)initializeCellWithTitle:(NSString *)title;
- (void)initializeCellWithTitle:(NSString *)title withImageNamed:(NSString *)imageName;

@end
