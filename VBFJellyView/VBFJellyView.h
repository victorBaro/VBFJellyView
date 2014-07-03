//
//  VBJellyView.h
//  BottomSkypeMenu
//
//  Created by Victor Baro on 01/07/2014.
//  Copyright (c) 2014 Victor Baro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VBFJellyView : UIView

@property (nonatomic, strong) UIDynamicAnimator *mainAnimator;

//DESIGNATED INITALIZER FOR DEFAULT VALUES
- (id)initWithFrame:(CGRect)frame
      jellyViewSize:(CGSize)viewSize
          fillColor:(UIColor *)jellyViewColor;

//DESIGNATED INITALIZER SETTING YOUR OWN VALUES
- (id) initWithFrame:(CGRect)frame
       jellyViewSize:(CGSize)viewSize
           fillColor:(UIColor *)jellyViewColor
          elasticity:(CGFloat)elasticity
             density:(CGFloat)density
             damping:(CGFloat)damping
           frequency:(CGFloat)frequency;

//Call this method to draw the CAShapeLayer, otherwise you won't see anything on the screen
- (void) show;

@end
