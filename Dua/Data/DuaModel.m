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

NSString *const kAttrTransliteration=@"dua:transliteration";

@interface DuaModel ()

@property (nonatomic, strong, readonly) NSDictionary *json;

@end

@implementation DuaModel

@dynamic categories;
@dynamic name;
@dynamic arabic;
@dynamic transliteration;
@dynamic image;

#pragma mark - Life Cycle
- (instancetype)init {
    if (self = [super init]) {
        [NSException raise:NSInternalInconsistencyException
                    format:@"Always use initWithJson: to initialize this class"];
    }
    return self;
}

- (instancetype)initWithJson:(NSDictionary *)json {
    if (self = [super init]) {
        _json = json;
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

- (NSString *)transliteration {
    return self.json[kAttrTransliteration];
}

- (NSString *)categories {
    return self.json[kAttrCategories];
}



@end
