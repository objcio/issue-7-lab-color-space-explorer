//
//  ViewController.m
//  Lab Color Space Explorer
//
//  Created by Daniel Eggert on 01/12/2013.
//  Copyright (c) 2013 objc.io. All rights reserved.
//

#import "ViewController.h"

#import "LabColor.h"
#import "KeyValueObserver.h"



@interface ViewController ()

@property (nonatomic, strong) LabColor *labColor;
@property (nonatomic, strong) id colorObserveToken;
@property (weak, nonatomic) IBOutlet UISlider *lSlider;
@property (weak, nonatomic) IBOutlet UISlider *aSlider;
@property (weak, nonatomic) IBOutlet UISlider *bSlider;

@property (weak, nonatomic) IBOutlet UIView *colorView;

@end



@implementation ViewController

- (void)viewDidLoad;
{
    [super viewDidLoad];
	self.labColor = [[LabColor alloc] init];
}

- (void)setLabColor:(LabColor *)labColor
{
    _labColor = labColor;
    self.colorObserveToken = [KeyValueObserver observeObject:labColor keyPath:@"color" target:self selector:@selector(colorDidChange:) options:NSKeyValueObservingOptionInitial];
    self.lSlider.value = self.labColor.lComponent;
    self.aSlider.value = self.labColor.aComponent;
    self.bSlider.value = self.labColor.bComponent;
}

- (IBAction)updateLComponent:(UISlider *)sender;
{
    self.labColor.lComponent = sender.value;
}

- (IBAction)updateAComponent:(UISlider *)sender;
{
    self.labColor.aComponent = sender.value;
}

- (IBAction)updateBComponent:(UISlider *)sender;
{
    self.labColor.bComponent = sender.value;
}

- (void)colorDidChange:(NSDictionary *)change;
{
    self.colorView.backgroundColor = self.labColor.color;
}

@end
