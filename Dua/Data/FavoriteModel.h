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
@property (nonatomic) NSString *arabic2;
@property (nonatomic) NSString *translation2;
@property (nonatomic) NSString *transliteration2;


@end
