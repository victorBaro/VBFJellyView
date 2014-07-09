//
//  FifthViewController.m
//  VBFJellyView
//
//  Created by Victor Baro on 03/07/2014.
//  Copyright (c) 2014 Victor Baro. All rights reserved.
//

#import "FifthViewController.h"
#import "VBFJellyView.h"

@interface FifthViewController ()
@property (nonatomic, strong) VBFJellyView *jelly;
@end

@implementation FifthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.jelly= [[VBFJellyView alloc]initWithFrame:self.view.frame
                                     jellyViewSize:CGSizeMake(150, 150)
                                         fillColor:[UIColor colorWithRed:0.7 green:0.12 blue:0.1 alpha:0.4]
                                        elasticity:0
                                           density:1
                                           damping:0.3
                                         frequency:5];
    [self.view addSubview:self.jelly];
    for (UIView *subview in self.jelly.subviews) {
        subview.backgroundColor = [UIColor greenColor];
    }
    self.jelly.userInteractionEnabled = NO;
    [self.jelly show];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesture:)];
    [self.view addGestureRecognizer:panGesture];
}

- (void) panGesture:(UIPanGestureRecognizer *)gesture {
    CGPoint translation = [gesture translationInView:self.view];
    
    for (UIView *sView in self.jelly.subviews) {
        if (sView.tag % 2 == 0) {
            //Drag only the corner points, mdpoints will be pulled by corner points
            sView.center = CGPointMake(sView.center.x + translation.x, sView.center.y + translation.y);
            [self.jelly.mainAnimator updateItemUsingCurrentState:sView];
        }
    }
    [gesture setTranslation:CGPointZero inView:self.view];
}


@end
