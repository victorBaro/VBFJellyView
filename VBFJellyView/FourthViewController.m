//
//  FourthViewController.m
//  VBFJellyView
//
//  Created by Victor Baro on 03/07/2014.
//  Copyright (c) 2014 Victor Baro. All rights reserved.
//

#import "FourthViewController.h"
#import "VBFJellyView.h"

@interface FourthViewController ()
@property (nonatomic, strong) VBFJellyView *jelly;
@end

@implementation FourthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.jelly = [[VBFJellyView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 350)
                                                   jellyViewSize:CGSizeMake(100, 100)
                                                       fillColor:[UIColor redColor]
                                                      elasticity:1
                                                         density:5
                                                         damping:0.3
                                                       frequency:8];
    self.jelly.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.jelly];
    [self.jelly show];
    
    UICollisionBehavior *collision = [[UICollisionBehavior alloc]initWithItems:self.jelly.subviews];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.jelly.mainAnimator addBehavior:collision];
    
    UIGravityBehavior *grav = [[UIGravityBehavior alloc]initWithItems:self.jelly.subviews];
    grav.magnitude = 2;
    [self.jelly.mainAnimator addBehavior:grav];
    
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
