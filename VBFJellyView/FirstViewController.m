//
//  FirstViewController.m
//  VBFJellyView
//
//  Created by Victor Baro on 03/07/2014.
//  Copyright (c) 2014 Victor Baro. All rights reserved.
//

#import "FirstViewController.h"
#import "VBFJellyView.h"

@interface FirstViewController ()
@property (nonatomic, strong) VBFJellyView *jelly;
@end

@implementation FirstViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.jelly= [[VBFJellyView alloc]initWithFrame:self.view.frame
                                               jellyViewSize:CGSizeMake(150, 150)
                                                   fillColor:[UIColor colorWithRed:0.7 green:0.12 blue:0.1 alpha:1]
                                                  elasticity:0
                                                     density:1
                                                     damping:0.3
                                                   frequency:5];
    [self.view addSubview:self.jelly];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
