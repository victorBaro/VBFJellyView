//
//  SecondViewController.m
//  VBFJellyView
//
//  Created by Victor Baro on 03/07/2014.
//  Copyright (c) 2014 Victor Baro. All rights reserved.
//

#import "SecondViewController.h"
#import "JellyButton.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    JellyButton *jButton = [[JellyButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)
                                               jellyViewSize:CGSizeMake(100, 50)
                                                   fillColor:[UIColor orangeColor]
                                                  elasticity:0
                                                     density:1
                                                     damping:0.1
                                                   frequency:3];
    [self.view addSubview:jButton];
    [jButton show];
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
