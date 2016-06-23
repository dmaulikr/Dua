//
//  DuaModel.h
//  Dua
//
//  Created by Sameer Siddiqui on 11/17/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DuaModel : NSObject

- (instancetype)initWithJson:(NSDictionary *)json;

- (instancetype)initWithDua:(DuaModel *)dua;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *image;

@property (nonatomic) NSString *categories;

@property (nonatomic, copy) NSString *arabic;

@property (nonatomic) NSString *arabic2;

@property (nonatomic, copy) NSString *transliteration;

@property (nonatomic, copy) NSString *transliteration2;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *translation;

@property (nonatomic) NSString *translation2;

@property (nonatomic) BOOL isFavorite;

@property (nonatomic) NSArray *searchKeys;

@end
