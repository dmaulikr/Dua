//
//  ImageDownloader.m
//  Dua
//
//  Created by Sameer Siddiqui on 5/29/16.
//  Copyright © 2016 Sameer Siddiqui. All rights reserved.
//

#import "ImageDownloader.h"

@interface ImageDownloader ()
@property(nonatomic, copy) CompletionBlock completionBlock;
@end

@implementation ImageDownloader

+ (NSCache *)sharedImageCache {
    static dispatch_once_t once;
    static NSCache *imageCache;
    dispatch_once(&once, ^{
        imageCache = [[NSCache alloc] init];
    });
    return imageCache;
}

+ (void)retrieveImageWithName:(NSString *)name withCompletionBlock:(CompletionBlock)completionBlock {
    __block NSString *imageName;
    imageName = name;
    
    UIImage *cachedImage = [[self sharedImageCache] objectForKey:imageName];
    if (cachedImage) {
        completionBlock(cachedImage);
    }
    else {
        UIImage *image = [UIImage imageNamed:name];
        [[self sharedImageCache]setObject:image forKey:name];
        completionBlock(image);
    }

}

@end
