//
//  UIImage+Scale.m
//  Dua
//
//  Created by Sameer Siddiqui on 11/18/15.
//  Copyright © 2015 Sameer Siddiqui. All rights reserved.
//

#import "UIImage+Scale.h"


CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;};
CGFloat RadiansToDegrees(CGFloat radians) {return radians * 180/M_PI;};

@implementation UIImage(Scale)

+ (UIImage *)getImage:(NSString *)imageName andScale:(CGSize)size {
    if (!imageName) {
        return nil;
    }
    
    UIImage *image = [UIImage imageNamed:imageName];
    if (!image) {
        return nil;
    }
    
    return [image scaleImageToSize:size];
}

+ (UIImage *)image:(NSString *)imageName withCut:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:imageName];
    return [image cutImage:rect];
}

- (UIImage *)setAlpha:(CGFloat)alpha {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, self.size.width, self.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextSetAlpha(ctx, alpha);
    
    CGContextDrawImage(ctx, area, self.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)cutImage:(CGRect) rect {
    CGRect fromRect = CGRectMake(rect.origin.x * self.scale,
                                 rect.origin.y * self.scale,
                                 rect.size.width * self.scale,
                                 rect.size.height * self.scale);
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, fromRect);
    UIImage *crop = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return crop;
}

+ (UIImage *)getImage:(NSString *)imageName cutAndScaleTo:(CGSize)size {
    if (!imageName) {
        return nil;
    }
    
    UIImage *image = [UIImage imageNamed:imageName];
    if (!image) {
        return nil;
    }
    
    CGRect rect = CGRectMake(0, (image.size.height-image.size.width) / 2 , image.size.width, image.size.width);
    image = [image cutImage:rect];
    
    CGSize _size = CGSizeMake(size.width, size.height);
    
    UIGraphicsBeginImageContext(_size);
    [image drawInRect:CGRectMake(0, 0, _size.width, _size.height)];
    UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return retImage;
}

- (UIImage *)scaleImageToSize:(CGSize)size {
    
    CGRect rect = CGRectMake(0, (self.size.height - self.size.width) / 2 , self.size.width, self.size.width);
    UIImage *image = [self cutImage:rect];
    
    CGSize _size = CGSizeMake(size.width, size.height);
    
    UIGraphicsBeginImageContext(_size);
    [image drawInRect:CGRectMake(0, 0, _size.width, _size.height)];
    UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return retImage;
}

- (UIImage *)exactZoomScaleAndCutSizeInCenter:(CGSize)size {
    UIImage *image;
    float verticalRadio = size.height*1.0/self.size.height;
    float horizontalRadio = size.width*1.0/self.size.width;
    
    float radio = 1;
    radio = verticalRadio > horizontalRadio ? horizontalRadio : verticalRadio;
    CGFloat width = self.size.width*radio;
    CGFloat height = self.size.height*radio;
    CGSize scaledSize = CGSizeMake(width,height);
    image = [self scaleImageToSize:scaledSize];
    image = [image cutImageInCenter:size];
    
    return image;
}

- (UIImage *)backgroundZoomScaleAndCutSizeInCenter:(CGSize)size {
    
    UIImage *image;
    
    if (self.size.width > self.size.height) {
        CGFloat dashboardScale = self.size.height / size.height;
        CGSize scaledSize = CGSizeMake((size.width<self.size.width)?(self.size.width/dashboardScale):(self.size.width*dashboardScale), size.height);
        if (scaledSize.width < size.width) {
            scaledSize.width = size.width;
        }
        image = [self scaleImageToSize:scaledSize];
    }
    else {
        CGFloat dashboardScale = self.size.width / size.width;
        CGSize scaledSize = CGSizeMake(size.width, (size.height<self.size.height)?(self.size.height/dashboardScale):(self.size.height*dashboardScale));
        if (scaledSize.height < size.height) {
            scaledSize.height = size.height;
        }
        image = [self scaleImageToSize:scaledSize];
    }
    image = [image cutImageInCenter:size];
    
    return image;
}

- (UIImage *)cutImageInCenter:(CGSize)size {
    CGRect rect = CGRectMake((self.size.width - size.width) / 2, (self.size.height - size.height) / 2 , size.width, size.height);
    return [self cutImage:rect];
}

static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth, float ovalHeight) {
    float fw, fh;
    if (ovalWidth == 0 || ovalHeight == 0) {
        CGContextAddRect(context, rect);
        return;
    }
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    
    CGContextMoveToPoint(context, fw, fh / 2);  // Start at lower right corner
    CGContextAddArcToPoint(context, fw, fh, fw / 2, fh, 1);  // Top right corner
    CGContextAddArcToPoint(context, 0, fh, 0, fh / 2, 1); // Top left corner
    CGContextAddArcToPoint(context, 0, 0, fw / 2, 0, 1); // Lower left corner
    CGContextAddArcToPoint(context, fw, 0, fw, fh / 2, 1); // Back to lower right
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}

- (UIImage *)roundCornerImageWithsize:(CGSize)size {
    return [self roundCornerImageWithsize:size radius:size.width / 2];
}

- (UIImage *)roundCornerImageWithsize:(CGSize)size cutourDegree:(float)degree {
    UIImage *image = [self roundCornerImageWithsize:size radius:size.width / 2];
    image = [image cutImageInCenter:CGSizeMake(size.width - 10, size.height - 10)];
    return image;
}

- (UIImage *)roundCornerImageWithsize:(CGSize)size radius:(float)radius {
    // the size of CGContextRef
    int w = size.width;
    int h = size.height;
    CGRect rect = CGRectMake(0, 0, w, h);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextBeginPath(contextRef);
    addRoundedRectToPath(contextRef, rect, radius, radius);
    CGContextClosePath(contextRef);
    CGContextClip(contextRef);
    
    [self drawInRect:rect];
    
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newPic;
}

- (CGImageRef)imageRotatedByDegrees:(CGFloat)degrees {
    CGImageRef imgRef = self.CGImage;
    
    CGFloat angleInRadians = degrees * (M_PI / 180);
    CGFloat width = CGImageGetWidth(imgRef);
    CGFloat height = CGImageGetHeight(imgRef);
    
    CGRect imgRect = CGRectMake(0, 0, width, height);
    CGAffineTransform transform = CGAffineTransformMakeRotation(angleInRadians);
    CGRect rotatedRect = CGRectApplyAffineTransform(imgRect, transform);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef bmContext = CGBitmapContextCreate(NULL,
                                                   rotatedRect.size.width,
                                                   rotatedRect.size.height,
                                                   8,
                                                   0,
                                                   colorSpace,
                                                   (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    CGContextSetAllowsAntialiasing(bmContext, YES);
    CGContextSetShouldAntialias(bmContext, YES);
    CGContextSetInterpolationQuality(bmContext, kCGInterpolationHigh);
    CGColorSpaceRelease(colorSpace);
    CGContextTranslateCTM(bmContext,
                          + (rotatedRect.size.width / 2),
                          + (rotatedRect.size.height / 2));
    CGContextRotateCTM(bmContext, angleInRadians);
    CGContextTranslateCTM(bmContext,
                          - (rotatedRect.size.width / 2),
                          - (rotatedRect.size.height / 2));
    CGContextDrawImage(bmContext, CGRectMake(0, 0,
                                             rotatedRect.size.width,
                                             rotatedRect.size.height), imgRef);
    
    CGImageRef rotatedImage = CGBitmapContextCreateImage(bmContext);
    CFRelease(bmContext);
    
    return rotatedImage;
}

+ (UIImage *)imageFromLayer:(CALayer *)layer {
    UIGraphicsBeginImageContext(layer.frame.size);
    
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return outputImage;
}

- (UIImage *)convertImageToGrayScale {
    CGFloat scale = [[UIScreen mainScreen] scale];
    
    CGSize size = [self size];
    int width = size.width *scale;
    int height = size.height *scale;
    
    // the pixels will be painted to this array
    uint32_t *pixels = (uint32_t *) malloc(width * height * sizeof(uint32_t));
    
    // clear the pixels so any transparency is preserved
    memset(pixels, 0, width * height * sizeof(uint32_t));
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // create a context with RGBA pixels
    CGContextRef context = CGBitmapContextCreate(pixels, width, height, 8, width * sizeof(uint32_t), colorSpace,
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);
    
    // paint the bitmap to our context which will fill in the pixels array
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), [self CGImage]);
    
    for (int y = 0; y < height; y++) {
        for(int x = 0; x < width; x++) {
            uint8_t *rgbaPixel = (uint8_t *) &pixels[y * width + x];
            
            // convert to grayscale using recommended method: http://en.wikipedia.org/wiki/Grayscale#Converting_color_to_grayscale
            uint32_t gray = 0.3 * rgbaPixel[3] + 0.59 * rgbaPixel[2] + 0.11 * rgbaPixel[1];
            
            // set the pixels to gray
            rgbaPixel[3] = gray;
            rgbaPixel[2] = gray;
            rgbaPixel[1] = gray;
        }
    }
    
    // create a new CGImageRef from our context with the modified pixels
    CGImageRef image = CGBitmapContextCreateImage(context);
    
    // we're done with the context, color space, and pixels
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    free(pixels);
    
    // make a new UIImage to return
    UIImage *resultUIImage = [UIImage imageWithCGImage:image scale:scale orientation:UIImageOrientationUp];
    
    // we're done with image now too
    CGImageRelease(image);
    
    return resultUIImage;
}

-(UIImage*)makeUIImageFromCIImage:(CIImage*)ciImage {
    CIContext *cicontext = [CIContext contextWithOptions:nil];
    UIImage * returnImage;
    
    CGImageRef processedCGImage = [cicontext createCGImage:ciImage fromRect:[ciImage extent]];
    
    returnImage = [UIImage imageWithCGImage:processedCGImage scale:[[UIScreen mainScreen] scale] orientation:UIImageOrientationUp];
    CGImageRelease(processedCGImage);
    
    return returnImage;
}

- (UIImage *)invertColor {
    //    CGFloat scale = [[UIScreen mainScreen] scale];
    
    CIImage *coreImage = [CIImage imageWithCGImage:self.CGImage];
    CIFilter *filter = [CIFilter filterWithName:@"CIColorInvert"];
    [filter setValue:coreImage forKey:kCIInputImageKey];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    //    return [UIImage imageWithCIImage:result scale:scale orientation:UIImageOrientationUp];
    return [self makeUIImageFromCIImage:result];
}

+ (UIImage *)gradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize {
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(imgSize, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    
    CGFloat locations[2] = {0.0, 1.0};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, locations);
    CGPoint start;
    CGPoint end;
    switch (gradientType) {
        case GradientTypeTopToBottom:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
        case GradientTypeLeftToRight:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, 0.0);
            break;
        case GradientTypeUpleftToLowright:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, imgSize.height);
            break;
        case GradientTypeUprightToLowleft:
            start = CGPointMake(imgSize.width, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
        default:
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}



@end
