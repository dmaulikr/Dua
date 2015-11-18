//
//  DuaData.m
//  Dua
//
//  Created by Sameer Siddiqui on 11/17/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import "DuaData.h"

@implementation DuaData

+ (NSArray *)getAllDuas {
    return @[
             @{
                 @"dua:image" : @"Mosque1",
                 @"dua:categories" : @[
                         @"Fasting"],
                 @"dua:name" : @"Beginning Fasting",
                 @"dua:arabic" : @"جَنَْهْ",
                 @"dua:transliteration" : @"Jannah",
                 },
             @{
                 @"dua:image" : @"Mosque2",
                 @"dua:categories" : @[
                         @"Prayer"],
                 @"dua:name" : @"Prayer",
                 @"dua:arabic" : @"جَنَْهْ",
                 @"dua:transliteration" : @"Jannah",
                 }
             ];
}

@end
