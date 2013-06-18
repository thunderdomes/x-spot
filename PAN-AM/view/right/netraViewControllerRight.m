//
//  netraViewControllerRight.m
//  PAN-AM
//
//  Created by Arie on 6/18/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "netraViewControllerRight.h"

@interface netraViewControllerRight ()

@end

@implementation netraViewControllerRight

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		netraTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
		netraTable.backgroundColor=[UIColor whiteColor];
		
		[self.view addSubview:netraTable];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
