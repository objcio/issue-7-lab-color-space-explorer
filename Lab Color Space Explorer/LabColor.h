//
//  LabColor.h
//  Lab Color Space Explorer
//
//  Created by Daniel Eggert on 01/12/2013.
//  Copyright (c) 2013 objc.io. All rights reserved.
//

#import <Foundation/Foundation.h>


/// (Pseudo) CIE 1976 (L*, a*, b*) color space
/// C.f. <https://en.wikipedia.org/wiki/Lab_color_space>
///
@interface LabColor : NSObject

/// The @b L component in LAB color space
@property (nonatomic) double lComponent;
/// The @b a component in LAB color space
@property (nonatomic) double aComponent;
/// The @b b component in LAB color space
@property (nonatomic) double bComponent;

/// The @b red component in sRGB color space
@property (nonatomic, readonly) double redComponent;
/// The @b green component in sRGB color space
@property (nonatomic, readonly) double greenComponent;
/// The @b blue component in sRGB color space
@property (nonatomic, readonly) double blueComponent;

@property (nonatomic, strong, readonly) UIColor *color;

@end
