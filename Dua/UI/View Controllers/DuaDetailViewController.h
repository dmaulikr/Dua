//
//  DuaDetailViewController.h
//  Dua
//
//  Created by Sameer Siddiqui on 11/20/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DuaModel.h"

@interface DuaDetailViewController : UIViewController

+ (DuaDetailViewController *)create;

@property (nonatomic) DuaModel *dua;

@end


@interface DuaDetailCell : UITableViewCell

- (void)initializeCellWithArabic:(NSString *)arabic withTranslation:(NSString *)translation andTransliteration:(NSString *)transliteration;

@end