//
//  FavoriteModel.h
//  Dua
//
//  Created by Sameer Siddiqui on 11/21/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FavoriteModel : NSObject <NSCoding>

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *arabic;
@property (nonatomic) NSString *translation;
@property (nonatomic) NSString *transliteration;

@end
