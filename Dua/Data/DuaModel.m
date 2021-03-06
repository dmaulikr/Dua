//
//  DuaModel.m
//  Dua
//
//  Created by Sameer Siddiqui on 11/17/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import "DuaModel.h"

NSString *const kAttrName=@"dua:name";

NSString *const kAttrImageName=@"dua:image";

NSString *const kAttrCategories=@"dua:categories";

NSString *const kAttrArabic=@"dua:arabic";

NSString *const kAttrArabic2=@"dua:arabic2";

NSString *const kAttrTransliteration=@"dua:transliteration";

NSString *const kAttrTransliteration2=@"dua:transliteration2";

NSString *const kAttrTitle=@"dua:title";

NSString *const kAttrFavorite=@"isFavorite";

NSString *const kAttrSearchKeys=@"searchKeys";

NSString *const kAttrTranslation=@"dua:translation";

NSString *const kAttrTranslation2=@"dua:translation2";



@interface DuaModel () 

@property (nonatomic, strong, readonly) NSDictionary *json;

@end

@implementation DuaModel

#pragma mark - Life Cycle

- (instancetype)initWithJson:(NSDictionary *)json {
    if (self = [super init]) {
        _json = json;
    }
    return self;
}

- (instancetype)initWithDua:(DuaModel *)dua {
    if (self = [super init]) {
        self = dua;
    }
    return self;
}


- (NSString *)description {
    return [NSString stringWithFormat:@"%@", self.json.description];
}


#pragma mark - Dynamic properties

- (NSString *)name {
    return self.json[kAttrName];
}

- (NSString *)image {
    return self.json[kAttrImageName];
}

- (NSString *)arabic {
    return self.json[kAttrArabic];
}

- (NSString *)arabic2 {
    return self.json[kAttrArabic2];
}

- (NSString *)transliteration {
    return self.json[kAttrTransliteration];
}

- (NSString *)transliteration2 {
    return self.json[kAttrTransliteration2];
}

- (NSString *)categories {
    return self.json[kAttrCategories];
}

- (NSString *)title {
    return self.json[kAttrTitle];
}

- (NSString *)translation {
    return self.json[kAttrTranslation];
}

- (NSString *)translation2 {
    return self.json[kAttrTranslation2];
}

- (BOOL)isFavorite {
    return [self.json[kAttrFavorite] boolValue];
}

- (NSArray *)searchKeys {
    return self.json[kAttrSearchKeys];
}

@end
