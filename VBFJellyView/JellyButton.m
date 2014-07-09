//
//  JellyButton.m
//  VBFJellyView
//
//  Created by Victor Baro on 03/07/2014.
//  Copyright (c) 2014 Victor Baro. All rights reserved.
//

#import "JellyButton.h"

@implementation JellyButton


- (void)show {
    [super show];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttonTapped:)];
    [self addGestureRecognizer:tapGesture];
}

- (void) buttonTapped:(UITapGestureRecognizer *)tapGesture {
    for (UIView *view in self.subviews) {
        if (view.tag % 2 != 0) {
            //Apply push behav on control points
            UIPushBehavior *pushB = [[UIPushBehavior alloc]initWithItems:@[view] mode:UIPushBehaviorModeInstantaneous];
            UIView *centerView = self.subviews[4];
            
            pushB.pushDirection = CGVectorMake(view.center.x - centerView.center.x,
                                               view.center.y - centerView.center.y);
            if (!self.pushMagnitude) {
                self.pushMagnitude = 0.1;
            }
            pushB.magnitude = self.pushMagnitude;
            [self.mainAnimator addBehavior:pushB];
        } else {
            //Add massive ressistance so the button won't move around
            UIDynamicItemBehavior *bh = [[UIDynamicItemBehavior alloc]initWithItems:@[view]];
            bh.density = 1000;
            [self.mainAnimator addBehavior:bh];
        }
        
    }
    
    
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
