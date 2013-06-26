//
//  customerPortfolio.m
//  PAN-AM
//
//  Created by Arie on 6/27/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "customerPortfolio.h"

@interface customerPortfolio ()

@end

@implementation customerPortfolio

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor=[UIColor whiteColor];
		customer=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
		wrapper=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
		wrapper.backgroundColor=[UIColor colorWithRed:0.976 green:0.976 blue:0.976 alpha:1];
		
		nasabah=[[UIView alloc]initWithFrame:CGRectMake(0, 0, (self.view.frame.size.width/2)-0.5f, 120)];
		nasabah.backgroundColor=[UIColor colorWithRed:0.918 green:0.918 blue:0.918 alpha:1.0];
		
		investment=[[UIView alloc]initWithFrame:CGRectMake((self.view.frame.size.width/2)+0.5, 0, (self.view.frame.size.width/2)-0.5f, 120)];
		investment.backgroundColor=[UIColor colorWithRed:0.918 green:0.918 blue:0.918 alpha:1.0] ;
		
		nasabah_atas=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, nasabah.frame.size.width, 30)];
		nasabah_atas.backgroundColor=[UIColor clearColor];
		nasabah_atas.font=[UIFont fontWithName:@"AvenirNext-Medium" size:15];
		nasabah_atas.textAlignment=NSTextAlignmentCenter;
		nasabah_atas.textColor=[UIColor colorWithRed:0 green:0.431 blue:0.514 alpha:1.0];
		nasabah_atas.text=@"Jumlah Nasabah";
		
		nasabah_total=[[UILabel alloc]initWithFrame:CGRectMake(0, 22, nasabah.frame.size.width, 90)];
		nasabah_total.backgroundColor=[UIColor clearColor];
		nasabah_total.font=[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:80];
		nasabah_total.textAlignment=NSTextAlignmentCenter;
		nasabah_total.textColor=[UIColor colorWithRed:0.482 green:0.482 blue:0.482 alpha:1];
		
		investment_total=[[UILabel alloc]initWithFrame:CGRectMake(0, 22, nasabah.frame.size.width, 80)];
		investment_total.backgroundColor=[UIColor clearColor];
		investment_total.font=[UIFont fontWithName:@"HelveticaNeue" size:18];
		investment_total.numberOfLines = 1;
		investment_total.minimumFontSize = 8.;
		investment_total.adjustsFontSizeToFitWidth = YES;
		investment_total.textAlignment=NSTextAlignmentCenter;
		investment_total.textColor=[UIColor colorWithRed:0.482 green:0.482 blue:0.482 alpha:1];
		
		investment_atas=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, nasabah.frame.size.width, 30)];
		investment_atas.backgroundColor=[UIColor clearColor];
		investment_atas.font=[UIFont fontWithName:@"AvenirNext-Medium" size:15];
		investment_atas.textAlignment=NSTextAlignmentCenter;
		investment_atas.textColor=[UIColor colorWithRed:0 green:0.431 blue:0.514 alpha:1.0];
		investment_atas.text=@"Total Investasi";
		
		[self.view addSubview:wrapper];
		[wrapper addSubview:nasabah];
		[wrapper addSubview:investment];
		[nasabah addSubview:nasabah_atas];
		[nasabah addSubview:nasabah_total];
		[investment addSubview:investment_atas];
		[investment addSubview:investment_total];
		//[self.view addSubview:customer];
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
	[self fetchData];
}
-(void)fetchData{
    
	AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.panin-am.co.id:800/"]];
	[httpClient setParameterEncoding:AFFormURLParameterEncoding];
	NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST"
															path:@"jsonCustomerPortfolio.aspx"
													  parameters:@{@"sessionid":[common getSessionActive]}];
    
	[AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
	AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id responseObject) {
		[nasabah_total setText:[NSString stringWithFormat:@"%d",[[responseObject objectForKey:@"ListCustomerPortfolio"] count]]];
		
		total_investment=0.0;
		for(int i=0;i<[[responseObject objectForKey:@"ListCustomerPortfolio"] count];i++){
			
			total_investment=total_investment+[[[[responseObject objectForKey:@"ListCustomerPortfolio"]objectAtIndex:i]objectForKey:@"TotalAmountNonUSD"]floatValue];
		}
		[self setTotalInvestmen:total_investment];
        /*
		for(id objectData in [responseObject objectForKey:@"ListCustomerPortfolio"]){
			
			netraMX *objectDatax=[[netraMX alloc] initWithDictionary:objectData];
			[netrax addObject:objectDatax];
		}
		
		if([[responseObject objectForKey:@"ListCustomerPortfolio"] count] ==netrax.count){
			[self insertIntoArrayScope];
			NSMutableArray *dataPass=[[NSMutableArray alloc]init];
			[dataPass addObject:@"mitra"];
			[[NSNotificationCenter defaultCenter] postNotificationName:@"hideButton" object:dataPass];
			[self.sidePanelController showCenterPanel:YES];
			[dataPass removeAllObjects];
			
		}
		 */
		//[netra reloadData];
		
		//[self insertIntoArrayScope];
        //NSMutableArray *dataPass=[[NSMutableArray alloc]init];
		//[dataPass addObject:@"mitra"];
		//[[NSNotificationCenter defaultCenter] postNotificationName:@"hideButton" object:dataPass];
		//[self.sidePanelController showCenterPanel:YES];
		//[dataPass removeAllObjects];
		
        // do something with return data
    }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        // code for failed request goes here
        [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
		if(error){
			NSLog(@"error-->%@",error);
		}
        // do something on failure
    }];
    
   // self.filteredArray = [NSMutableArray arrayWithCapacity:netrax.count];
	
    [operation start];
	
}
-(void)setTotalInvestmen:(float)investments{
	NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
	[numberFormatter setGroupingSeparator:@","];
	[numberFormatter setGroupingSize:3];
	[numberFormatter setUsesGroupingSeparator:YES];
	[numberFormatter setDecimalSeparator:@"."];
	[numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
	[numberFormatter setMaximumFractionDigits:2];
	
	NSString *ar = [NSString stringWithFormat:@"%f", investments];
	CGFloat myNumber = (CGFloat)[ar floatValue];
	[investment_total setText:[numberFormatter stringFromNumber:[NSNumber numberWithFloat:myNumber]]];
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
	TitleBig.text=@"Customer Portfolio";
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
