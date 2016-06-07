//
//  ImageDownloader.h
//  Dua
//
//  Created by Sameer Siddiqui on 5/29/16.
//  Copyright © 2016 Sameer Siddiqui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^CompletionBlock)(id responseData);

@interface ImageDownloader : NSObject
+ (void)retrieveImageWithName:(NSString *)name withCompletionBlock:(CompletionBlock)completionBlock;
@end
