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

@property (nonatomic, readonly) NSString *name;

@property (nonatomic, readonly) NSString *image;

@property (nonatomic, readonly) NSString *categories;

@property (nonatomic, readonly) NSString *arabic;

@property (nonatomic, readonly) NSString *transliteration;

@end
