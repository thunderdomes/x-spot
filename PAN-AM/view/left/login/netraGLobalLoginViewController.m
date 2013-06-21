//
//  netraGLobalLoginViewController.m
//  PAN-AM
//
//  Created by Arie on 6/21/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "netraGLobalLoginViewController.h"

@interface netraGLobalLoginViewController ()

@end

@implementation netraGLobalLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.frame=CGRectMake(0, 0,280, 280);
		self.view.backgroundColor=[UIColor whiteColor];
		Title=[[UILabel alloc]initWithFrame:CGRectMake(20,20, 240,44)];
		Title.font=[UIFont fontWithName:@"AvenirNext-Medium" size:25];
		Title.backgroundColor=[UIColor clearColor];
		Title.textColor=[UIColor colorWithRed:0.424 green:0.424 blue:0.424 alpha:1.0];
		Title.textAlignment=NSTextAlignmentCenter;
		
		separators=[[UIView alloc]initWithFrame:CGRectMake(20, 64, 240, 1)];
		separators.backgroundColor=[UIColor colorWithRed:0.863 green:0.863 blue:0.863 alpha:1] /*#dcdcdc*/;
		
		
		username=[[UITextField alloc]initWithFrame:CGRectMake(20,80, 240,44)];
		username.tag=1;
		username.placeholder=@"Username";
		password.returnKeyType=UIReturnKeyNext;
		username.backgroundColor=[UIColor colorWithRed:0.988 green:0.988 blue:0.988 alpha:1];
		username.layer.borderWidth=1;
		username.layer.borderColor=[UIColor colorWithRed:0.886 green:0.886 blue:0.886 alpha:1].CGColor;
		username.layer.sublayerTransform = CATransform3DMakeTranslation(10, 10, 0);
		username.font=[UIFont fontWithName:@"AvenirNext-Medium" size:17];
		username.textColor=[UIColor colorWithRed:0.424 green:0.424 blue:0.424 alpha:1.0];
		username.delegate=self;
		
		password=[[UITextField alloc]initWithFrame:CGRectMake(20,140, 240,44)];
		password.backgroundColor=[UIColor colorWithRed:0.988 green:0.988 blue:0.988 alpha:1];
		password.secureTextEntry=YES;
		password.placeholder=@"Password";
		password.tag=2;
		password.layer.borderWidth=1;
		password.layer.borderColor=[UIColor colorWithRed:0.886 green:0.886 blue:0.886 alpha:1].CGColor;
		password.layer.sublayerTransform = CATransform3DMakeTranslation(10, 10, 0);
		password.font=[UIFont fontWithName:@"AvenirNext-Medium" size:17];
		password.returnKeyType=UIReturnKeyDone;
		password.delegate=self;
		
		submit=[UIButton buttonWithType:UIButtonTypeCustom];
		submit.layer.cornerRadius = 3; // this value vary as per your desire
		submit.clipsToBounds = YES;
		submit.frame=CGRectMake(20,200, 240,44);
		[submit setBackgroundImage:[UIImage imageNamed:@"login"]
						  forState:UIControlStateNormal];
		[submit setBackgroundImage:[UIImage imageNamed:@"login_push"]
						  forState:UIControlStateHighlighted];
		[submit addTarget:self action:@selector(loginTo) forControlEvents:UIControlEventTouchUpInside];
		
		[self.view addSubview:username];
		[self.view addSubview:password];
		[self.view addSubview:separators];
		[self.view addSubview:Title];
		[self.view addSubview:submit];
		
    }
    return self;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldBeginEditing");
    textField.backgroundColor = [UIColor colorWithRed:0.949 green:0.949 blue:0.949 alpha:1];
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing");
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldEndEditing");
    textField.backgroundColor=[UIColor colorWithRed:0.988 green:0.988 blue:0.988 alpha:1];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"textFieldDidEndEditing");
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"textFieldShouldReturn:");
    if (textField.tag == 1) {
		//username.backgroundColor=[UIColor colorWithRed:0.988 green:0.988 blue:0.988 alpha:1];
        UITextField *passwordTextField = (UITextField *)[self.view viewWithTag:2];
        [passwordTextField becomeFirstResponder];
    }
    else {
        [textField resignFirstResponder];
		//password.backgroundColor=[UIColor colorWithRed:0.988 green:0.988 blue:0.988 alpha:1];
    }
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:YES];
		
	Title.text=self.Status;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loginTo{
	if ([self.Status isEqualToString:@"Login Nasabah"]){
		[self loginNasabah];
	}
	else{
		[self loginMitra];
	
	}
}
-(void)loginNasabah{
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							username.text, @"userName",
							password.text, @"password",
							nil];
	
	AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:
							[NSURL URLWithString:@"http://www.panin-am.co.id:800/"]];
	
	[client postPath:@"/jsonLoginUser.aspx" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
		NSString *text = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
		NSLog(@"Response: %@", text);
		[self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideTopBottom];
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"%@", [error localizedDescription]);
	}];
}
-(void)loginMitra{
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							username.text, @"userName",
							password.text, @"password",
							nil];
	
	AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:
							[NSURL URLWithString:@"http://www.panin-am.co.id:800/"]];
	
	[client postPath:@"/jsonLoginUserMarketing.aspx" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
		NSString *text = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
		NSLog(@"Response: %@", text);
		[self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideTopBottom];
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"%@", [error localizedDescription]);
	}];

}

@end
