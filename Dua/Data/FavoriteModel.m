//
//  FavoriteModel.m
//  Dua
//
//  Created by Sameer Siddiqui on 11/21/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import "FavoriteModel.h"




NSString *const kAttrArab=@"dua:arabic";


NSString *const kAttrTrans=@"dua:transliteration";

NSString *const kAttrTitl=@"dua:title";


NSString *const kAttrTranslate=@"dua:translation";


@implementation FavoriteModel

#pragma mark - NSCoding support
- (id)initWithCoder:(NSCoder*)decoder {
    if (self = [self init]) {
        
        self.title = [decoder decodeObjectForKey:kAttrTitl];
        self.arabic = [decoder decodeObjectForKey:kAttrArab];
        self.translation = [decoder decodeObjectForKey:kAttrTranslate];
        self.transliteration = [decoder decodeObjectForKey:kAttrTrans];
    }
    
    return self;
}


- (void)encodeWithCoder:(NSCoder*)encoder {
    
    [encoder encodeObject:self.title forKey:kAttrTitl];
    [encoder encodeObject:self.arabic forKey:kAttrArab];
    [encoder encodeObject:self.translation forKey:kAttrTranslate];
    [encoder encodeObject:self.transliteration forKey:kAttrTrans];
}


@end
