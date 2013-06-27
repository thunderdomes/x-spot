//
//  customerPortfolio.m
//  PAN-AM
//
//  Created by Arie on 6/27/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "customerPortfolio.h"
#import "customerCell.h"
@interface customerPortfolio ()

@end
	bool isFiltered=false;
@implementation customerPortfolio

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		
		netrax=[[NSMutableArray alloc]init];
		//coreData=[[NSMutableArray alloc]init];
		self.view.backgroundColor=[UIColor whiteColor];
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

		investment_bawah=[[UILabel alloc]initWithFrame:CGRectMake(0, investment.frame.size.height-30, nasabah.frame.size.width, 30)];
		investment_bawah.backgroundColor=[UIColor clearColor];
		investment_bawah.font=[UIFont fontWithName:@"AvenirNext-Medium" size:13];
		investment_bawah.textAlignment=NSTextAlignmentCenter;
		investment_bawah.textColor=[UIColor darkGrayColor];
		investment_bawah.text=@"(Dalam Rupiah)";
		
		wrapper_atas=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 120)];
		wrapper_atas.backgroundColor=[UIColor clearColor];
		
		customerTable =[[UITableView alloc]initWithFrame:CGRectMake(0, 50, 320, self.view.frame.size.height-88)];
		customerTable.delegate=self;
		customerTable.dataSource=self;
		
		searchbarContainer=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
		searchbarContainer.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"searchbar"]];
		paddingView = [[[UIView alloc] initWithFrame:CGRectMake(40, 0, 5, 20)] autorelease];
		
		
		searchForm=[[UITextField alloc]initWithFrame:CGRectMake(30, 7, 280, 30)];
		searchForm.backgroundColor=[UIColor clearColor];
		searchForm.layer.sublayerTransform = CATransform3DMakeTranslation(5, 3, 0);
		searchForm.leftViewMode = UITextFieldViewModeAlways;
		searchForm.leftView = paddingView;
		searchForm.placeholder=@"Cari Nasabah / CIF";
		//searchForm.delegate=self;
		searchForm.clearButtonMode = UITextFieldViewModeWhileEditing;
		searchForm.autocorrectionType=UITextAutocorrectionTypeNo;
		searchForm.leftViewMode = UITextFieldViewModeAlways;
		searchForm.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
		[searchForm setFont:[UIFont fontWithName:@"OpenSans-Semibold" size:16]];
		searchForm.textColor=[UIColor colorWithRed:0.275 green:0.275 blue:0.275 alpha:1] ;
		searchForm.returnKeyType=UIReturnKeyDone;
		
		[searchbarContainer addSubview:searchForm];
		[self.view addSubview:wrapper];
		
		[wrapper addSubview:searchbarContainer];
		[wrapper  addSubview:customerTable];
		[wrapper_atas addSubview:nasabah];
		[wrapper_atas addSubview:investment];
		[nasabah addSubview:nasabah_atas];
		[nasabah addSubview:nasabah_total];
		[investment addSubview:investment_atas];
		[investment addSubview:investment_total];
		[investment addSubview:investment_bawah];
		[customerTable setTableHeaderView:wrapper_atas];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return  60;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return netrax.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CellIdentifier = @"CountryCell";
    
    customerCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[customerCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
	if(!isFiltered){
		customer  *object_draw=[netrax objectAtIndex:indexPath.row];
		NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setGroupingSeparator:@","];
        [numberFormatter setGroupingSize:3];
        [numberFormatter setUsesGroupingSeparator:YES];
        [numberFormatter setDecimalSeparator:@"."];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [numberFormatter setMaximumFractionDigits:2];
        
        NSString *ar = [NSString stringWithFormat:@"%@", object_draw.TotalAmountNonUSD];
        CGFloat myNumber = (CGFloat)[ar floatValue];

		cell.nama.text=object_draw.CustomerName;
		NSLog(@"ar----->%@",ar);
		cell.balance.text=[NSString stringWithFormat:@"Rp %@",[numberFormatter stringFromNumber:[NSNumber numberWithFloat:myNumber]]];
		//cell.detailTextLabel.text=object_draw.Fund;
		
	}
	else{
		NSLog(@"dataKosong");
	}
	

    return cell;
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
	[self fetchData];
	[self initNavBar];
	
}
-(void)fetchData{
    
	AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.panin-am.co.id:800/"]];
	[httpClient setParameterEncoding:AFFormURLParameterEncoding];
	NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST"
															path:@"jsonCustomerPortfolio.aspx"
													  parameters:@{@"sessionid":[common getSessionActive]}];
    
	[AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
	AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id responseObject) {
		NSLog(@"response-->%@",responseObject);
		[nasabah_total setText:[NSString stringWithFormat:@"%d",[[responseObject objectForKey:@"ListCustomerPortfolio"] count]]];
		
		total_investment=0.0;
		for(int i=0;i<[[responseObject objectForKey:@"ListCustomerPortfolio"] count];i++){
			
			total_investment=total_investment+[[[[responseObject objectForKey:@"ListCustomerPortfolio"]objectAtIndex:i]objectForKey:@"TotalAmountNonUSD"]floatValue];
		}
		[self setTotalInvestmen:total_investment];
	
		for(id objectData in [responseObject objectForKey:@"ListCustomerPortfolio"]){
			
			customer *objectDatax=[[customer alloc] initWithDictionary:objectData];
			[netrax addObject:objectDatax];
		}
	///lakukan insert ke Coredata
		if([[responseObject objectForKey:@"ListCustomerPortfolio"] count] ==netrax.count){
			NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
			Mitra *nasabahData;
			[Mitra MR_truncateAll];
			for (int i=0; i<netrax.count; i++) {
				
				nasabahData = [Mitra MR_createInContext:localContext];
				customer *object_draw = [netrax objectAtIndex:i];
				nasabahData.date=[NSDate date];
				nasabahData.customerNo=[NSString stringWithFormat:@"%@",object_draw.CustomerNo];
				nasabahData.customerName=[NSString stringWithFormat:@"%@",object_draw.CustomerName];
				if([object_draw.BirthDate hasPrefix:@"/"]){
					nasabahData.birthDate = [NSString stringWithFormat:@"-"];
				}else {
					nasabahData.birthDate = [NSString stringWithFormat:@"%@", object_draw.BirthDate];
				}
				
				if([object_draw.LastTransDate hasPrefix:@"/"]){
					nasabahData.LastTransDate = [NSString stringWithFormat:@"-"];
				}else {
					nasabahData.LastTransDate = [NSString stringWithFormat:@"%@", object_draw.LastTransDate];
				}
				nasabahData.fund=[NSString stringWithFormat:@"%@", object_draw.Fund];
				nasabahData.totalAmountUSD=[NSString stringWithFormat:@"%@", object_draw.TotalAmountNonUSD];
				nasabahData.totalAmountNonUSD=[NSString stringWithFormat:@"%@", object_draw.TotalAmountUSD];
				
				
				
			}
			[localContext MR_saveNestedContexts];
			///because coredata slow to ride
			
			
			[self performSelector:@selector(fetchToTable) withObject:nil afterDelay:1];

		}
		
		
		
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
-(void)fetchToTable{

	coreData=[NSMutableArray arrayWithArray:[Mitra MR_findAllSortedBy:@"date" ascending:YES]];
	NSLog(@"coredata-->%d",coreData.count);
	[customerTable reloadData];
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
