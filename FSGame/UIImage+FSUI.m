// Copyright 2013 Ziyong Luo
// Use of this file is governed by the Apache License, Version 2.0 that can be found in the LICENSE
// file.

#import "UIImage+FSUI.h"

@implementation UIImage (FSUI)

+ (id)imageWithColor:(UIColor*)color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

- (UIImage *)resizedImageWithSize:(CGSize)size {
    return [self resizedImageWithSize:size contentMode:UIViewContentModeScaleAspectFill];
}

- (UIImage *)resizedImageWithSize:(CGSize)size contentMode:(UIViewContentMode)contentMode {
    CGFloat horizontalRatio = size.width / self.size.width;
    CGFloat verticalRatio = size.height / self.size.height;
    CGFloat ratio = 1.0f;
    CGFloat x = 0.0f;
    CGFloat y = 0.0f;
    
    switch (contentMode) {
        case UIViewContentModeScaleAspectFit:
            ratio = MIN(horizontalRatio, verticalRatio);
            break;
        case UIViewContentModeScaleAspectFill:
            ratio = MAX(horizontalRatio, verticalRatio);
            break;
        default:
            break;
    }
    
    switch (contentMode) {
        case UIViewContentModeScaleAspectFit:
        case UIViewContentModeScaleAspectFill:
        case UIViewContentModeCenter:
        case UIViewContentModeTop:
        case UIViewContentModeBottom:
            x = floor((size.width - self.size.width * ratio) / 2);
            break;
        case UIViewContentModeRight:
        case UIViewContentModeTopRight:
        case UIViewContentModeBottomRight:
            x = size.width - self.size.width;
            break;
        default:
            break;
    }
    
    switch (contentMode) {
        case UIViewContentModeScaleAspectFit:
        case UIViewContentModeScaleAspectFill:
        case UIViewContentModeCenter:
        case UIViewContentModeLeft:
        case UIViewContentModeRight:
            y = floor((size.height - self.size.height * ratio) / 2);
            break;
        case UIViewContentModeBottom:
        case UIViewContentModeBottomLeft:
        case UIViewContentModeBottomRight:
            y = size.height - self.size.height;
            break;
        default:
            break;
    }
    
    CGRect rect;
    if (contentMode == UIViewContentModeScaleToFill) {
        rect = CGRectMake(x, y, ceil(self.size.width * horizontalRatio), ceil(self.size.height * verticalRatio));
    } else {
        rect = CGRectMake(x, y, ceil(self.size.width * ratio), ceil(self.size.height * ratio));
    }
    
    UIGraphicsBeginImageContext(size);
    
    // Instead of CGContextDrawImage, use [image drawInRect:] in the middle of your begin/end CGcontext methods.
    // This will draw the image with the correct orientation into your current image context.
    [self drawInRect:rect];
    
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
