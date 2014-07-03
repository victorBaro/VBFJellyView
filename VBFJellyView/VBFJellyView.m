//
//  VBJellyView.m
//  BottomSkypeMenu
//
//  Created by Victor Baro on 01/07/2014.
//  Copyright (c) 2014 Victor Baro. All rights reserved.
//

#import "VBFJellyView.h"


@interface VBFJellyView () {
}
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic) CGSize viewSize;
@property (nonatomic) NSInteger nDivisions;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) CAShapeLayer *viewLayer;
@property (nonatomic) CGFloat elasticity;
@property (nonatomic) CGFloat density;
@property (nonatomic) CGFloat damping;
@property (nonatomic) CGFloat frequency;
@end

@implementation VBFJellyView

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame jellyViewSize:CGSizeMake(100, 100) fillColor:[UIColor greenColor]];
}


- (id)initWithFrame:(CGRect)frame
      jellyViewSize:(CGSize)viewSize
          fillColor:(UIColor *)jellyViewColor{
    return [self initWithFrame:frame
                 jellyViewSize:viewSize
                     fillColor:jellyViewColor
                    elasticity:1.2
                       density:2
                       damping:0.4
                     frequency:15];
}

- (id)initWithFrame:(CGRect)frame
      jellyViewSize:(CGSize)viewSize
          fillColor:(UIColor *)jellyViewColor
         elasticity:(CGFloat)elasticity
            density:(CGFloat)density
            damping:(CGFloat)damping
          frequency:(CGFloat)frequency {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        // Initialization code
        _viewSize = viewSize;
        _fillColor = jellyViewColor;
        _damping = damping;
        _frequency = frequency;
        _density = density;
        _elasticity = elasticity;
        [self setup];
        
    }
    return self;
}

- (void) setup {
    _nDivisions = 3;
    
    int item = 0;
    for (int i = 0; i < self.nDivisions; i++) {
        for (int k = 0; k < self.nDivisions; k++) {
            CGFloat hSeparation = self.viewSize.width/(self.nDivisions - 1);
            CGFloat vSeparation = self.viewSize.height/(self.nDivisions - 1);
            
            CGFloat hAmountToCenter = self.bounds.size.width/2 - self.viewSize.width/2;
            CGFloat vAmountToCenter = self.bounds.size.height/2 - self.viewSize.height/2;
            
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.bounds.origin.x + hAmountToCenter + hSeparation*k,
                                                                   self.bounds.origin.y + vAmountToCenter + vSeparation*i,
                                                                   10,
                                                                   10)];
            view.tag = item;
            view.backgroundColor = [UIColor clearColor];
            [self addSubview:view];
            item += 1;
        }
    }
    
    [self attachViews];
}

- (void) attachViews {
    self.mainAnimator = [[UIDynamicAnimator alloc]initWithReferenceView:self];
    CGFloat separation = self.viewSize.width/(self.nDivisions - 1);
    for (int i = 0; i < [self.subviews count]; i++) {
        UIView *view = self.subviews[i];
        for (UIView *nextView in self.subviews) {
            if ((view.center.x - nextView.center.x == separation)||(view.center.y - nextView.center.y == separation)) {
                UIAttachmentBehavior *attach = [[UIAttachmentBehavior alloc]initWithItem:view
                                                                          attachedToItem:nextView];
                attach.damping = self.damping;
                attach.frequency = self.frequency;
                [self.mainAnimator addBehavior:attach];
                
                UIDynamicItemBehavior *bh = [[UIDynamicItemBehavior alloc]initWithItems:@[view]];
                bh.elasticity = self.elasticity;
                bh.density = self.density;
                [self.mainAnimator addBehavior:bh];
            }
        }
    }
}

- (void) show {
    [self setupMainLayer];
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(reDraw:)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
}

- (void) reDraw:(CADisplayLink *)dLink {
    self.viewLayer.path = [self getViewPath].CGPath;
}


- (void) setupMainLayer {
    self.viewLayer = [CAShapeLayer layer];
    self.viewLayer.path = [self getViewPath].CGPath;
    self.viewLayer.fillColor = self.fillColor.CGColor;
    self.viewLayer.cornerRadius = 10;
    [self.layer addSublayer:self.viewLayer];
}

- (UIBezierPath *) getViewPath {
    UIBezierPath *bPath = [UIBezierPath bezierPath];
    [bPath moveToPoint:((UIView *)self.subviews[0]).center] ;
    [bPath addQuadCurveToPoint:((UIView *)self.subviews[2]).center
                  controlPoint:((UIView *)self.subviews[1]).center];
    [bPath addQuadCurveToPoint:((UIView *)self.subviews[8]).center
                  controlPoint:((UIView *)self.subviews[5]).center];
    [bPath addQuadCurveToPoint:((UIView *)self.subviews[6]).center
                  controlPoint:((UIView *)self.subviews[7]).center];
    [bPath addQuadCurveToPoint:((UIView *)self.subviews[0]).center
                  controlPoint:((UIView *)self.subviews[3]).center];
    return bPath;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//    UIBezierPath *bPath = [self getViewPath];
//    [self.fillColor setFill];
//    [bPath fill];
//    
//    
//}


@end
