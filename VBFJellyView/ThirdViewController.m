//
//  ViewController.m
//  VBFJellyView
//
//  Created by Victor Baro on 03/07/2014.
//  Copyright (c) 2014 Victor Baro. All rights reserved.
//

#import "ThirdViewController.h"
#import "JellyAlert.h"

@interface ThirdViewController ()
@property (nonatomic, strong) JellyAlert *alert;
@end

@implementation ThirdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)buttonPressed:(id)sender {
    self.alert = [[JellyAlert alloc]initWithFrame:self.view.frame
                                    jellyViewSize:CGSizeMake(150, 100)
                                        fillColor:[UIColor redColor]];
    [self.view addSubview:self.alert];
    [self.alert presentAlert];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
