//
//  csViewController.m
//  PAN-AM
//
//  Created by Arie on 7/22/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "csViewController.h"
#import "csDetailViewController.h"
@interface csViewController ()

@end

@implementation csViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization     // Custom initialization
		
		UITapGestureRecognizer *singleFingerTap =
		[[UITapGestureRecognizer alloc] initWithTarget:self
												action:@selector(tampilkan)];
		
		
		self.view.backgroundColor=[UIColor whiteColor];
		pilihCal=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 55)];
		pilihCal.backgroundColor=[UIColor clearColor];
		UIImageView *cal=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
		[cal setImage:[UIImage imageNamed:@"calendar"]];
		UIImageView *cal2=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
		[cal2 setImage:[UIImage imageNamed:@"calendar"]];
		[pilihCal addSubview:cal2];
		[pilihCal addGestureRecognizer:singleFingerTap];
		[singleFingerTap release];
		pilihCal2=[[UIView alloc]initWithFrame:CGRectMake(0, 57, 320, 55)];
		pilihCal2.backgroundColor=[UIColor clearColor];
		[pilihCal2 addSubview:cal];
		tanggal1=[[UILabel alloc]initWithFrame:CGRectMake(50, 7, 280, 44)];
		tanggal1.text=@"Pilih tanggal Mulai";
		[pilihCal addSubview:tanggal1];
		
		tanggal2=[[UILabel alloc]initWithFrame:CGRectMake(50, 7, 280, 44)];
		tanggal1.backgroundColor=[UIColor clearColor];
		tanggal2.backgroundColor=[UIColor clearColor];
		[pilihCal2 addSubview:tanggal2];
		divider=[[UIView alloc]initWithFrame:CGRectMake(0, 55, 320, 1)];
		divider.backgroundColor=[UIColor lightGrayColor];
		
		divider2=[[UIView alloc]initWithFrame:CGRectMake(0, 111, 320, 1)];
		divider2.backgroundColor=[UIColor lightGrayColor];
		
		cari=[UIButton buttonWithType:UIButtonTypeCustom];
		[cari setFrame:CGRectMake(48.5, 80, 223, 44)];
		[cari addTarget:self action:@selector(jumpP) forControlEvents:UIControlEventTouchUpInside];
		[cari setBackgroundImage:[UIImage imageNamed:@"laporan"] forState:UIControlStateNormal];
		[self.view addSubview:cari];
		[self.view addSubview:pilihCal];
		//[self.view addSubview:pilihCal2];
		[self.view addSubview:divider];
		//[self.view addSubview:divider2];

    }
    return self;
}
-(void)jumpP{
	csDetailViewController *details=[[csDetailViewController alloc]init];
	
	[self.navigationController pushViewController:details animated:YES];
	
}
-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:YES];
	[self initNavBar];
	if([common dateStart]){
		tanggal1.text=[common dateStart];
		
	}
	if([common dateEnd]){
		tanggal2.text=[common dateEnd];
		
	}
	if(![common dateEnd]){
		tanggal2.text=[common dateEnd];
	}
	
}
-(void)tampilkan{
	calwins=[[calendarPic alloc]init];
	
	UINavigationController *a=[[UINavigationController alloc]initWithRootViewController:calwins];
	[self presentViewController:a animated:YES completion:nil];
	
	
	
	
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
