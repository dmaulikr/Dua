//
//  FavoritesViewController.h
//  Dua
//
//  Created by Sameer Siddiqui on 11/21/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoritesViewController : UIViewController

+ (FavoritesViewController *)create;

@end


@interface NoFavCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;

- (void)initializeCellWithTitle:(NSString *)title;

@end