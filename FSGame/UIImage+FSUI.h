// Copyright 2013 Ziyong Luo
// Use of this file is governed by the Apache License, Version 2.0 that can be found in the LICENSE
// file.

#import <UIKit/UIKit.h>

@interface UIImage (FSUI)

+ (id)imageWithColor:(UIColor*)color;

- (UIImage *)resizedImageWithSize:(CGSize)size; // contentMode: UIViewContentModeScaleAspectFill 
- (UIImage *)resizedImageWithSize:(CGSize)size contentMode:(UIViewContentMode)contentMode;

@end
