//
//  DuaData.m
//  Dua
//
//  Created by Sameer Siddiqui on 11/17/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import "DuaData.h"

@implementation DuaData

+ (NSArray *)duas{
    return  @[
              @{@"category":@"Morning",@"image":@"Mosque1",
                @"duas":@[@{
                              @"dua:image" : @"Mosque1",
                              @"dua:arabic" : @"جَنَْهْ",
                              @"dua:transliteration" : @"Jannah",
                              @"dua:title" : @"Waking up in the Morning",
                              @"isFavorite" : @"YES",
                              @"searchKeys":@""},
                          
                          @{
                              @"dua:image" : @"Mosque1",
                              @"dua:arabic" : @"جَنَْهْ",
                              @"dua:transliteration" : @"Jannah",
                              @"dua:title" : @"Bathroom",
                              @"isFavorite" : @"NO",
                              @"searchKeys":@""}
                          ]
                },
              @{@"category":@"Evening",@"image":@"Mosque2",
                @"duas":@[@{
                              @"dua:image" : @"Mosque2",
                              @"dua:arabic" : @"جَنَْهْ",
                              @"dua:transliteration" : @"Jannah",
                              @"dua:title" : @"Waking up in the Morning",
                              @"isFavorite" : @"YES",
                              @"searchKeys":@""}
                          ]
                }
              ];
}

@end
