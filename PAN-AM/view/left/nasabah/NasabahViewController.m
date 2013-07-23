//
//  NasabahViewController.m
//  PAN-AM
//
//  Created by Arie on 7/22/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "NasabahViewController.h"
#import "netraAppDelegate.h"

@interface NasabahViewController () {
    NSString *nasabahText;
    NSString *CIFText;
    NSString *tgl_lahirText;
    NSString *alamatText;
    NSString *teleponText;
    NSString *emailText;
    NSString *expiredText;
    NSString *mktkdText;
    NSString *namaText;
}

@end

@implementation NasabahViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        netraAppDelegate *appDelegate = (netraAppDelegate *)[[UIApplication sharedApplication] delegate];
        
        
		self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"pam-iphone-nasabah-page"]];
		nasabah=[[UILabel alloc]initWithFrame:CGRectMake(0, 35,320, 22)];
		nasabah.backgroundColor=[UIColor clearColor];
		nasabah.font=[UIFont fontWithName:@"AvenirNext-DemiBold" size:14];
		nasabah.text=appDelegate.nasabahText;
		nasabah.textColor=[UIColor whiteColor];
		nasabah.textAlignment=NSTextAlignmentCenter;
        
        
		
		CIF=[[UILabel alloc]initWithFrame:CGRectMake(130, 75,200, 22)];
		CIF.backgroundColor=[UIColor clearColor];
		CIF.font=[UIFont fontWithName:@"AvenirNext-DemiBold" size:12];
		CIF.text=appDelegate.CIFText;
		CIF.textColor=[UIColor whiteColor];
		CIF.textAlignment=NSTextAlignmentLeft;
		
		tgl_lahir=[[UILabel alloc]initWithFrame:CGRectMake(130, 100,200, 22)];
		tgl_lahir.backgroundColor=[UIColor clearColor];
		tgl_lahir.font=[UIFont fontWithName:@"AvenirNext-DemiBold" size:12];
		tgl_lahir.text=appDelegate.tgl_lahirText;
		tgl_lahir.textColor=[UIColor whiteColor];
		tgl_lahir.textAlignment=NSTextAlignmentLeft;
		
		alamat=[[UILabel alloc]initWithFrame:CGRectMake(130, 125,200, 44)];
		alamat.backgroundColor=[UIColor clearColor];
		alamat.font=[UIFont fontWithName:@"AvenirNext-DemiBold" size:12];
		alamat.text=appDelegate.alamatText1;
		alamat.numberOfLines=2;
		
		alamat.textColor=[UIColor whiteColor];
		alamat.textAlignment=NSTextAlignmentLeft;
		
		telepon=[[UILabel alloc]initWithFrame:CGRectMake(130, 168,200, 22)];
		telepon.backgroundColor=[UIColor clearColor];
		telepon.font=[UIFont fontWithName:@"AvenirNext-DemiBold" size:12];
		telepon.text=appDelegate.teleponText1;
		telepon.textColor=[UIColor whiteColor];
		telepon.textAlignment=NSTextAlignmentLeft;
		
		email=[[UILabel alloc]initWithFrame:CGRectMake(130, 193,200, 22)];
		email.backgroundColor=[UIColor clearColor];
		email.font=[UIFont fontWithName:@"AvenirNext-DemiBold" size:12];
		email.text=appDelegate.emailText;
		email.textColor=[UIColor whiteColor];
		email.textAlignment=NSTextAlignmentLeft;
		
		expired=[[UILabel alloc]initWithFrame:CGRectMake(130, 218,200, 22)];
		expired.backgroundColor=[UIColor clearColor];
		expired.font=[UIFont fontWithName:@"AvenirNext-DemiBold" size:12];
		expired.text=appDelegate.expiredText;
		expired.textColor=[UIColor whiteColor];
		expired.textAlignment=NSTextAlignmentLeft;
		
		
		marketting_kd=[[UILabel alloc]initWithFrame:CGRectMake(130, 283,200, 22)];
		marketting_kd.backgroundColor=[UIColor clearColor];
		marketting_kd.font=[UIFont fontWithName:@"AvenirNext-DemiBold" size:12];
		marketting_kd.text=appDelegate.mktkdText;
		marketting_kd.textColor=[UIColor whiteColor];
		marketting_kd.textAlignment=NSTextAlignmentLeft;
		
		nama=[[UILabel alloc]initWithFrame:CGRectMake(130, 310,200, 22)];
		nama.backgroundColor=[UIColor clearColor];
		nama.font=[UIFont fontWithName:@"AvenirNext-DemiBold" size:12];
		nama.text=appDelegate.namaText;
		nama.textColor=[UIColor whiteColor];
		nama.textAlignment=NSTextAlignmentLeft;
		
		kontak=[[UILabel alloc]initWithFrame:CGRectMake(130, 335,200, 22)];
		kontak.backgroundColor=[UIColor clearColor];
		kontak.font=[UIFont fontWithName:@"AvenirNext-DemiBold" size:12];
		kontak.text=appDelegate.mktContactext;
		kontak.textColor=[UIColor whiteColor];
		kontak.textAlignment=NSTextAlignmentLeft;
		
		m_email=[[UILabel alloc]initWithFrame:CGRectMake(130, 365,200, 22)];
		m_email.backgroundColor=[UIColor clearColor];
		m_email.font=[UIFont fontWithName:@"AvenirNext-DemiBold" size:12];
		m_email.text=appDelegate.mktContactext;
		m_email.textColor=[UIColor whiteColor];
		m_email.textAlignment=NSTextAlignmentLeft;
		
		cabang=[[UILabel alloc]initWithFrame:CGRectMake(130, 390,200, 22)];
		cabang.backgroundColor=[UIColor clearColor];
		cabang.font=[UIFont fontWithName:@"AvenirNext-DemiBold" size:12];
		cabang.text=appDelegate.mktContactext;
		cabang.textColor=[UIColor whiteColor];
		cabang.textAlignment=NSTextAlignmentLeft;
		
		[self.view addSubview:nasabah];
		[self.view addSubview:CIF];
		[self.view addSubview:tgl_lahir];
		[self.view addSubview:alamat];
		[self.view addSubview:telepon];
		[self.view addSubview:email];
		[self.view addSubview:kontak];
		
		[self.view addSubview:expired];
		[self.view addSubview:marketting_kd];
		[self.view addSubview:nama];
		[self.view addSubview:m_email];
		[self.view addSubview:cabang];
		
		
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
-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:YES];
	[self initNavBar];
}
-(void)initNavBar{
	[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar1_"] forBarMetrics:UIBarMetricsDefault];
	UIImage* image = [UIImage imageNamed:@"left_"];
	CGRect frame = CGRectMake(-5, 0, 44, 44);
	UIButton* leftbutton = [[UIButton alloc] initWithFrame:frame];
	[leftbutton setBackgroundImage:image forState:UIControlStateNormal];
	//[leftbutton setBackgroundImage:[UIImage imageNamed:@"left-push"] forState:UIControlStateHighlighted];
	[leftbutton addTarget:self action:@selector(lefbuttonPush) forControlEvents:UIControlEventTouchUpInside];
	
	UIView *leftbuttonView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
	leftbuttonView.backgroundColor=[UIColor clearColor];
	[leftbuttonView addSubview:leftbutton];
	UIBarButtonItem* leftbarbutton = [[UIBarButtonItem alloc] initWithCustomView:leftbuttonView];
	
	
	UIImage* image3 = [UIImage imageNamed:@"right_"];
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
	
	TitleBig.textAlignment=NSTextAlignmentCenter;
	TitleBig.backgroundColor=[UIColor clearColor];
	[TitleBig setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:19]];
	TitleBig.textColor = [UIColor whiteColor];
	TitleBig.hidden=NO;
	[top_label addSubview:TitleBig];
	[self.navigationController.navigationBar addSubview:top_label];
	
}
-(void)fetchdata{
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
