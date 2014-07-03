//
//  JellyAlert.m
//  VBFJellyView
//
//  Created by Victor Baro on 03/07/2014.
//  Copyright (c) 2014 Victor Baro. All rights reserved.
//

#import "JellyAlert.h"

@interface JellyAlert ()
@property (nonatomic, strong) UICollisionBehavior *collisionB;
@end

@implementation JellyAlert

- (void) presentAlert {
    for (UIView *view in self.subviews) {
        view.center = CGPointMake(view.center.x, view.center.y - 300);
        [self.mainAnimator updateItemUsingCurrentState:view];
    }
    UIGravityBehavior *grav  = [[UIGravityBehavior alloc]initWithItems:self.subviews];
    grav.magnitude = 3;
    self.collisionB = [[UICollisionBehavior alloc]initWithItems:self.subviews];
    [self.collisionB addBoundaryWithIdentifier:@"hStopper" fromPoint:CGPointMake(0, self.frame.size.height/2 + 50)
                           toPoint:CGPointMake(self.frame.size.width, self.frame.size.height/2 + 50)];
    
    [self.mainAnimator addBehavior:grav];
    [self.mainAnimator addBehavior:self.collisionB];
    
    [self show];
    
    self.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.3];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    [self addGestureRecognizer:tap];
    
}

- (void) dismiss {
    [self.collisionB removeAllBoundaries];
    [self performSelector:@selector(removeFromSuperview) withObject:self afterDelay:0.8];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
