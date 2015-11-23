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

NSString *const kAttrArab2=@"dua:arabic2";

NSString *const kAttrTrans2=@"dua:transliteration2";

NSString *const kAttrTranslate2=@"dua:translation2";



@implementation FavoriteModel


#pragma mark - NSCoding support
- (id)initWithCoder:(NSCoder*)decoder {
    if (self = [self init]) {
        
        self.title = [decoder decodeObjectForKey:kAttrTitl];
        self.arabic = [decoder decodeObjectForKey:kAttrArab];
        self.translation = [decoder decodeObjectForKey:kAttrTranslate];
        self.transliteration = [decoder decodeObjectForKey:kAttrTrans];
        self.arabic2 = [decoder decodeObjectForKey:kAttrArab2];
        self.translation2 = [decoder decodeObjectForKey:kAttrTranslate2];
        self.transliteration2 = [decoder decodeObjectForKey:kAttrTrans2];
    }
    
    return self;
}


- (void)encodeWithCoder:(NSCoder*)encoder {
    
    [encoder encodeObject:self.title forKey:kAttrTitl];
    [encoder encodeObject:self.arabic forKey:kAttrArab];
    [encoder encodeObject:self.translation forKey:kAttrTranslate];
    [encoder encodeObject:self.transliteration forKey:kAttrTrans];
    [encoder encodeObject:self.arabic2 forKey:kAttrArab2];
    [encoder encodeObject:self.translation2 forKey:kAttrTranslate2];
    [encoder encodeObject:self.transliteration2 forKey:kAttrTrans2];

}


@end
