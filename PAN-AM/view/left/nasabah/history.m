//
//  history.m
//  PAN-AM
//
//  Created by Arie on 7/22/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "history.h"
#import "HMSegmentedControlContainerView.h"
@interface history (){
    HMSegmentedControlContainerView *containerView;
}


@end

@implementation history

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor=[UIColor whiteColor];
		
		
		self.segmentedControl4 = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
		[self.segmentedControl4 setSectionTitles:@[@"Jumlah Transaksi", @"Periode Transaksi", @"Periode Tertentu"]];
		[self.segmentedControl4 setSelectedSegmentIndex:1];
		[self.segmentedControl4 setBackgroundColor:[UIColor colorWithRed:0.302 green:0.643 blue:0.69 alpha:1]];
		[self.segmentedControl4 setTextColor:[UIColor whiteColor]];
		[self.segmentedControl4 setSelectedTextColor:[UIColor whiteColor]];
		[self.segmentedControl4 setSelectionIndicatorColor:[UIColor colorWithRed:0.976 green:0.675 blue:0.09 alpha:1]];
		[self.segmentedControl4 setSelectionStyle:HMSegmentedControlSelectionStyleBox];
		[self.segmentedControl4 setSelectionLocation:HMSegmentedControlSelectionLocationUp];
		[self.segmentedControl4 setTag:3];
		
		__weak typeof(self) weakSelf = self;
		[self.segmentedControl4 setIndexChangeBlock:^(NSInteger index) {
			[weakSelf.scrollView scrollRectToVisible:CGRectMake(320 * index, 0, 320, 250) animated:YES];
		}];
		
		[self.view addSubview:self.segmentedControl4];
		
		self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, 320, 250)];
		[self.scrollView setBackgroundColor:[UIColor whiteColor]];
		[self.scrollView setPagingEnabled:YES];
		[self.scrollView setShowsHorizontalScrollIndicator:NO];
		[self.scrollView setContentSize:CGSizeMake(960, self.view.frame.size.height-94)];
		[self.scrollView scrollRectToVisible:CGRectMake(320, 0, 320, 250) animated:NO];
		[self.scrollView setDelegate:self];
		[self.view addSubview:self.scrollView];
		
		UIView *pertama=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
		pertama.backgroundColor=[UIColor whiteColor];
		UIView *kedua=[[UIView alloc]initWithFrame:CGRectMake(320, 0, 320, 200)];
		UIView *ke3=[[UIView alloc]initWithFrame:CGRectMake(640, 0, 320, 200)];
		
		pilihjml=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 320, 50)];
		pilihjml.text=@"Pilih Jumlah Transaksi";
		pilihjml.font=[UIFont fontWithName:@"AvenirNext-Medium" size:13];
		[pertama addSubview:pilihjml];
		UIStepper* stepper = [[UIStepper alloc] init];
		stepper.maximumValue=10;
		stepper.frame = CGRectMake(220, 10, 100, 10);
		[pertama addSubview: stepper];
		
		pilihPeriod=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
		pilihPeriod.text=@"Pilih Periode Transaksi";
		[kedua addSubview:pilihPeriod];
		[self.scrollView addSubview:pertama];
		[self.scrollView addSubview:kedua];
		cari=[UIButton buttonWithType:UIButtonTypeCustom];
		[cari setFrame:CGRectMake(48.5, 180, 223, 44)];
		[cari addTarget:self action:@selector(jumpP) forControlEvents:UIControlEventTouchUpInside];
		[cari setBackgroundImage:[UIImage imageNamed:@"laporan"] forState:UIControlStateNormal];
		[self.scrollView addSubview:cari];

		
		

    }
    return self;
}
- (void)setApperanceForLabel:(UILabel *)label {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    [label setBackgroundColor:color];
    [label setTextColor:[UIColor whiteColor]];
    [label setFont:[UIFont systemFontOfSize:21.0f]];
    [label setTextAlignment:NSTextAlignmentCenter];
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
	NSLog(@"Selected index %i (via UIControlEventValueChanged)", segmentedControl.selectedSegmentIndex);
}

- (void)uisegmentedControlChangedValue:(UISegmentedControl *)segmentedControl {
	NSLog(@"Selected index %i", segmentedControl.selectedSegmentIndex);
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
-(void)lefbuttonPush{
	//[searchbar resignFirstResponder];
	[self.sidePanelController showLeftPanel:YES];
}

- (void)rightbuttonPush {
	//	[searchbar resignFirstResponder];
	[self.sidePanelController showRightPanel:YES];
}
@end
