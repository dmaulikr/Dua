//
//  CategoryViewController.h
//  Dua
//
//  Created by Sameer Siddiqui on 11/18/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DuaModel.h"

@interface CategoryViewController : UIViewController
+ (CategoryViewController *)create;

@property (nonatomic) DuaModel *dua;
@end
