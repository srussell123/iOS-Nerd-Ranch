//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Scott Russell on 6/5/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self) {
        //Set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";
        
        //Create a UIImage from a file
        UIImage *image = [UIImage imageNamed:@"Hypno.png"];  //Will choose Hypno@2x.png on retina!!
        
        //Put that image on the tab bar
        self.tabBarItem.image = image;
    }
    
    return self;
}

- (void)loadView
{
    //Create a view
    CGRect frame = [UIScreen mainScreen].bounds;
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] initWithFrame:frame];
    
    self.view = backgroundView;
}

//Report first load, will not message again after swaps
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Give Hypnosis a segmented control for colors
    NSArray *segControlValues = [NSArray arrayWithObjects:@"Red", @"Green", @"Blue", nil];
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:segControlValues];
    NSLog(@"%f", [UIScreen mainScreen].bounds.size.width - 175);
    self.segmentedControl.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 170.0),
                                             (30.0),
                                             150, 20);
    [self.segmentedControl setOpaque:NO];
    self.segmentedControl.selectedSegmentIndex = 0;
    [self.segmentedControl addTarget:self action:@selector(changeSegment:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmentedControl];
    
    NSLog(@"BNRHypnosisViewController loaded its view");
}

-(void)changeSegment:(UISegmentedControl*)sender
{
    for (int i=0; i<[sender.subviews count]; i++)
    {
        UIColor *tintcolor;
        if ([[sender.subviews objectAtIndex:i]isSelected] )
        {
            tintcolor=[UIColor redColor];
            [[sender.subviews objectAtIndex:i] setTintColor:tintcolor];
        }
        
        if (![[sender.subviews objectAtIndex:i]isSelected]){
            tintcolor=[UIColor grayColor];
            [[sender.subviews objectAtIndex:i] setTintColor:tintcolor];
        }
    }
}

@end
