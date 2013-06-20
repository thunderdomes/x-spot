//
//  netraNasabahViewController.m
//  PAN-AM
//
//  Created by Arie on 6/21/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "netraNasabahViewController.h"

@interface netraNasabahViewController ()

@end

@implementation netraNasabahViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.view.backgroundColor=[UIColor whiteColor];
        // Custom initialization
		username=[[UITextField alloc]initWithFrame:CGRectMake(20,20, 280,44)];
		username.tag=1;
		password.returnKeyType=UIReturnKeyNe;
		username.backgroundColor=[UIColor colorWithRed:0.953 green:0.953 blue:0.953 alpha:1.0];
		username.layer.borderWidth=1;
		username.layer.borderColor=[UIColor colorWithRed:0.784 green:0.784 blue:0.784 alpha:1.0].CGColor;
		username.layer.sublayerTransform = CATransform3DMakeTranslation(10, 10, 0);
		username.font=[UIFont fontWithName:@"AvenirNext-Medium" size:17];
		username.textColor=[UIColor colorWithRed:0.424 green:0.424 blue:0.424 alpha:1.0];
		username.delegate=self;
		
		password=[[UITextField alloc]initWithFrame:CGRectMake(20,80, 280,44)];
		password.backgroundColor=[UIColor colorWithRed:0.953 green:0.953 blue:0.953 alpha:1.0];
		password.secureTextEntry=YES;
		password.tag=2;
		password.layer.borderWidth=1;
		password.layer.borderColor=[UIColor colorWithRed:0.784 green:0.784 blue:0.784 alpha:1.0].CGColor;
		password.layer.sublayerTransform = CATransform3DMakeTranslation(10, 10, 0);
		password.font=[UIFont fontWithName:@"AvenirNext-Medium" size:17];
		password.returnKeyType=UIReturnKeyDone;
		password.delegate=self;
		
		[self.view addSubview:username];
		[self.view addSubview:password];
    }
    return self;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldBeginEditing");
    textField.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0f];
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing");
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldEndEditing");
    textField.backgroundColor = [UIColor whiteColor];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"textFieldDidEndEditing");
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"textFieldShouldReturn:");
    if (textField.tag == 1) {
		username.backgroundColor=[UIColor colorWithRed:0.953 green:0.953 blue:0.953 alpha:1.0];
        UITextField *passwordTextField = (UITextField *)[self.view viewWithTag:2];
        [passwordTextField becomeFirstResponder];
    }
    else {
        [textField resignFirstResponder];
		password.backgroundColor=[UIColor colorWithRed:0.953 green:0.953 blue:0.953 alpha:1.0];
    }
    return YES;
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
-(void)viewWillAppear:(BOOL)animated{
	
	[super viewWillAppear:YES];
	[self initNavBar];
}
-(void)initNavBar{
	[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
	UIImage* image = [UIImage imageNamed:@"left"];
	CGRect frame = CGRectMake(-5, 0, 44, 44);
	UIButton* leftbutton = [[UIButton alloc] initWithFrame:frame];
	[leftbutton setBackgroundImage:image forState:UIControlStateNormal];
	//[leftbutton setBackgroundImage:[UIImage imageNamed:@"left-push"] forState:UIControlStateHighlighted];
	[leftbutton addTarget:self action:@selector(lefbuttonPush) forControlEvents:UIControlEventTouchUpInside];
	
	UIView *leftbuttonView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
	leftbuttonView.backgroundColor=[UIColor clearColor];
	[leftbuttonView addSubview:leftbutton];
	UIBarButtonItem* leftbarbutton = [[UIBarButtonItem alloc] initWithCustomView:leftbuttonView];
	
	
	UIImage* image3 = [UIImage imageNamed:@"right"];
	CGRect frame3 = CGRectMake(5, 0, 44, 44);
	UIButton *searchbutton = [[UIButton alloc] initWithFrame:frame3];
	[searchbutton setBackgroundImage:image3 forState:UIControlStateNormal];
	//[searchbutton setBackgroundImage:[UIImage imageNamed:@"search-button-pressed"] forState:UIControlStateHighlighted];
	[searchbutton addTarget:self action:@selector(rightbuttonPush) forControlEvents:UIControlEventTouchUpInside];
	
	UIView *RightbuttonView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
	RightbuttonView.backgroundColor=[UIColor clearColor];
	[RightbuttonView addSubview:searchbutton];
	
	
	UIBarButtonItem* rightbarButton = [[UIBarButtonItem alloc] initWithCustomView:RightbuttonView];
	
	
	[self.navigationItem setRightBarButtonItem:rightbarButton];
	[self.navigationItem setLeftBarButtonItem:leftbarbutton];
	
	[rightbarButton release];
	[leftbarbutton release];
	
	UIView *top_label=[[[UIView alloc]initWithFrame:CGRectMake(45, 0, 230, 44)] autorelease];
	top_label.backgroundColor=[UIColor clearColor];
	
	UILabel *TitleBig=[[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 230, 44)] autorelease];
	TitleBig.text=@"Login Nasabah";
	TitleBig.textAlignment=NSTextAlignmentCenter;
	TitleBig.backgroundColor=[UIColor clearColor];
	[TitleBig setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:19]];
	TitleBig.textColor = [UIColor whiteColor];
	TitleBig.hidden=NO;
	[top_label addSubview:TitleBig];
	[self.navigationController.navigationBar addSubview:top_label];
	
}
-(void)lefbuttonPush{
	//[searchbar resignFirstResponder];
	[self.sidePanelController showLeftPanel:YES];
}

- (void)rightbuttonPush {
	//	[searchbar resignFirstResponder];
	[self.sidePanelController showRightPanel:YES];
}
@end
