//
//  LabColor.m
//  Lab Color Space Explorer
//
//  Created by Daniel Eggert on 01/12/2013.
//  Copyright (c) 2013 objc.io. All rights reserved.
//

#import "LabColor.h"


static double inverseF(double const t);
static double D65TristimulusValues[3] = {95.047, 100.0, 108.883};

@implementation LabColor

- (id)init
{
    self = [super init];
    if (self) {
        self.lComponent = 75 + (arc4random_uniform(200) * 0.1 - 10.);
        self.aComponent = 0 + (arc4random_uniform(200) * 0.1 - 10.);
        self.bComponent = 0 + (arc4random_uniform(200) * 0.1 - 10.);
    }
    return self;
}

- (NSString *)description;
{
    return [NSString stringWithFormat:@"<%@: %p> {%g, %g, %g}", [self class], self, self.lComponent, self.aComponent, self.bComponent];
}

+ (NSSet *)keyPathsForValuesAffectingRedComponent
{
    return [NSSet setWithObject:@"lComponent"];
}

- (double)redComponent;
{
    return D65TristimulusValues[0] * inverseF(1./116. * (self.lComponent + 16));
}

+ (NSSet *)keyPathsForValuesAffectingGreenComponent
{
    return [NSSet setWithObjects:@"lComponent", @"aComponent", nil];
}

- (double)greenComponent
{
    return D65TristimulusValues[1] * inverseF(1./116. * (self.lComponent + 16) + 1./500.*self.aComponent);
}

+ (NSSet *)keyPathsForValuesAffectingBlueComponent
{
    return [NSSet setWithObjects:@"lComponent", @"bComponent", nil];
}

- (double)blueComponent
{
    return D65TristimulusValues[2] * inverseF(1./116. * (self.lComponent + 16) - 1./200.*self.bComponent);
}

+ (NSSet *)keyPathsForValuesAffectingColor
{
    return [NSSet setWithObjects:@"redComponent", @"greenComponent", @"blueComponent", nil];
}

- (UIColor *)color
{
    return [UIColor colorWithRed:self.redComponent * 0.01 green:self.greenComponent * 0.01 blue:self.blueComponent * 0.01 alpha:1.];
}

@end



static double inverseF(double const t)
{
    return ((t > 6./29.) ?
            t*t*t :
            3.*(6./29.)*(6./29.)*(t-4./29.));
}
