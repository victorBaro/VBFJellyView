VBFJellyView
============

VBFJellyView is a custom view made out using UIKit Dynamics and with a very funny effect when adding behaviours to it.
![JellyViewGif](http://victorbaro.com/wp-content/uploads/2014/07/jellyview.gif)


## Introduction
This view was inspired by Skype app for iOS. 
Apart from that, I have to thank @arekholko for [this post](http://holko.pl/2014/06/26/recreating-skypes-action-sheet-animation/). I took from there the trick of using CADisplayLink for changing the path of the CAShapeLayer used in this example.

Find in the following video some examples of stuff you can achieve with this view.

[![Example Video](http://img.youtube.com/vi/rzcevF0xyM4/0.jpg)](http://youtu.be/rzcevF0xyM4)

	
## How to use it
Download the project. You will find the main view called **VBFJellyView**.  This class has 2 designated initializers:

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

Use the first one for **default values**. 
You won’t see anything on the screen until you call:
	- (void) show;
By calling that method, the CAShapeLayer used for showing the JellyView will be added as a sublayer.
I have used this approach to make it easier when you subclass it (like you will see in the AlertView example).

By default, VBFJellyView class **does not have any behaviour attached to it**.

**Important**
Before knowing how you should interact with it, you should know that VBFJellyView it’s made from 9 subviews, connected to the one next to each other using UIAttachmentBehaviour. 
That means, you should add behaviours to this 9 subviews (by accessing jellyView.subviews array). The views are positioned like the figure below illustrates:

![Subview Layout](http://victorbaro.com/wp-content/uploads/2014/07/VBFJellyView-subviews.png)

There are 2 ways of interacting with it:
1. Use its public property *mainAnimator* to add behaviours (examples 1 and 4). 
2. Subclass it to create your own custom stuff (examples 2 and 3)

I extremely recommend you to visit my blog, [victorbaro.com](http://victorbaro.com/) to understand a bit better how VBFJellyView is made. 

## The project
Inside the project you will find 5 Viewcontrollers:

1. VBFJellyView with UIPanGestureRecognizer.
2. JellyButton: a pushBehaviour is applied to the control points (midpoints) when the button is tapped
3. JellyAlert: using VBFJellyView as AlertView. UIGravityBehaviour and UICollisionBehaviour are used in this example
4. VBFJellyView with gravity + panGesture + collision
5. VBFJellyView showing how its made
