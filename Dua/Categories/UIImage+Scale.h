//
//  UIImage+Scale.h
//  Dua
//
//  Created by Sameer Siddiqui on 11/18/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GradientType) {
    GradientTypeTopToBottom = 0,
    GradientTypeLeftToRight = 1,
    GradientTypeUpleftToLowright = 2,
    GradientTypeUprightToLowleft = 3,
};
@interface UIImage(Scale)

+ (UIImage *)getImage:(NSString *)imageName andScale:(CGSize)size;

+ (UIImage *)image:(NSString *)imageName withCut:(CGRect)rect;

+ (UIImage *)getImage:(NSString *)imageName cutAndScaleTo:(CGSize)size;
- (UIImage *)scaleImageToSize:(CGSize)size;
- (UIImage *)exactZoomScaleAndCutSizeInCenter:(CGSize)size;
- (UIImage *)backgroundZoomScaleAndCutSizeInCenter:(CGSize)size;

- (UIImage *)setAlpha:(CGFloat)alpha;
- (UIImage *)cutImage:(CGRect) rect;
- (UIImage *)cutImageInCenter:(CGSize)size;

- (UIImage *)roundCornerImageWithsize:(CGSize)size;
- (UIImage *)roundCornerImageWithsize:(CGSize)size cutourDegree:(float)degree;
- (UIImage *)roundCornerImageWithsize:(CGSize)size radius:(float)radius;

- (CGImageRef)imageRotatedByDegrees:(CGFloat)degrees;

+ (UIImage *)imageFromLayer:(CALayer *)layer;
- (UIImage *)convertImageToGrayScale;

- (UIImage *)invertColor;

+ (UIImage *)gradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize;

@end
