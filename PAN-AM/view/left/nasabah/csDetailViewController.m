//
//  csDetailViewController.m
//  PAN-AM
//
//  Created by Arie on 7/22/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "csDetailViewController.h"
#import "saldoMX.h"
#import "csCell.h"
@interface csDetailViewController ()

@end

@implementation csDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor=[UIColor whiteColor];
		detail=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height-44)];
		detail.delegate=self;
		detail.dataSource=self;
		UIView *header=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
		header.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"cs_saldo"]];
		//header.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"nyahahah"]];
		UIView *footer=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 227)];
		footer.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"csfooter"]];
		//header.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"nyahahah"]];


		detail.tableHeaderView=header;
		detail.tableFooterView=footer;
		
		[self.view addSubview:detail];
		Dfundname=[[UILabel alloc]initWithFrame:CGRectMake(0, 65, 320, 22)];
		Dfundname.textAlignment=NSTextAlignmentCenter;
		Dfundname.font=[UIFont fontWithName:@"Avenir-Medium" size:14];
		Dfundname.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		Dfundname.backgroundColor=[UIColor clearColor];
		
		Dunit=[[UILabel alloc]initWithFrame:CGRectMake(0, 65+30, 90, 31)];
		Dunit.textAlignment=NSTextAlignmentCenter;
		Dunit.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		Dunit.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		Dunit.backgroundColor=[UIColor clearColor];
        Dunit.textAlignment=NSTextAlignmentCenter;
		
		DaverageNAv=[[UILabel alloc]initWithFrame:CGRectMake(107, 65+30, 90, 31)];
		DaverageNAv.textAlignment=NSTextAlignmentCenter;
		DaverageNAv.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		DaverageNAv.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		DaverageNAv.backgroundColor=[UIColor clearColor];
        DaverageNAv.textAlignment=NSTextAlignmentCenter;
		
		DclosingNAV=[[UILabel alloc]initWithFrame:CGRectMake(204, 65+30, 90, 31)];
		DclosingNAV.textAlignment=NSTextAlignmentCenter;
		DclosingNAV.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		DclosingNAV.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		DclosingNAV.backgroundColor=[UIColor clearColor];
        DclosingNAV.textAlignment=NSTextAlignmentCenter;
		
		/////
		DfundValue=[[UILabel alloc]initWithFrame:CGRectMake(0, 65+60, 90, 31)];
		DfundValue.textAlignment=NSTextAlignmentCenter;
		DfundValue.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		DfundValue.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		DfundValue.backgroundColor=[UIColor clearColor];
        DfundValue.textAlignment=NSTextAlignmentCenter;
		
		gDfundValue=[[UILabel alloc]initWithFrame:CGRectMake(0, 65+130, 90, 31)];
		gDfundValue.textAlignment=NSTextAlignmentCenter;
		gDfundValue.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		gDfundValue.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		gDfundValue.backgroundColor=[UIColor clearColor];
        gDfundValue.textAlignment=NSTextAlignmentCenter;
		
		DmarketValue=[[UILabel alloc]initWithFrame:CGRectMake(107, 65+60, 90, 31)];
		DmarketValue.textAlignment=NSTextAlignmentCenter;
		DmarketValue.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		DmarketValue.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		DmarketValue.backgroundColor=[UIColor clearColor];
        DmarketValue.textAlignment=NSTextAlignmentCenter;
		gDmarketValue=[[UILabel alloc]initWithFrame:CGRectMake(107, 65+130, 90, 31)];
		gDmarketValue.textAlignment=NSTextAlignmentCenter;
		gDmarketValue.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		gDmarketValue.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		gDmarketValue.backgroundColor=[UIColor clearColor];
        gDmarketValue.textAlignment=NSTextAlignmentCenter;

		
		DgainOrLost=[[UILabel alloc]initWithFrame:CGRectMake(204, 65+60, 90, 31)];
		DgainOrLost.textAlignment=NSTextAlignmentCenter;
		DgainOrLost.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		DgainOrLost.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		DgainOrLost.backgroundColor=[UIColor clearColor];
        DgainOrLost.textAlignment=NSTextAlignmentCenter;
		data=[[NSMutableArray alloc]init];
		
		gDainOrLostPercentage=[[UILabel alloc]initWithFrame:CGRectMake(204, 65+130, 90, 31)];
		gDainOrLostPercentage.textAlignment=NSTextAlignmentCenter;
		gDainOrLostPercentage.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		gDainOrLostPercentage.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		gDainOrLostPercentage.backgroundColor=[UIColor clearColor];
        gDainOrLostPercentage.textAlignment=NSTextAlignmentCenter;
		data=[[NSMutableArray alloc]init];
		
		gtDfundValue=[[UILabel alloc]initWithFrame:CGRectMake(0, 30, 90, 31)];
		gtDfundValue.textAlignment=NSTextAlignmentCenter;
		gtDfundValue.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		gtDfundValue.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		gtDfundValue.backgroundColor=[UIColor clearColor];
        gtDfundValue.textAlignment=NSTextAlignmentCenter;

		gtDmarketValue=[[UILabel alloc]initWithFrame:CGRectMake(107, 30, 90, 31)];
		gtDmarketValue.textAlignment=NSTextAlignmentCenter;
		gtDmarketValue.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		gtDmarketValue.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		gtDmarketValue.backgroundColor=[UIColor clearColor];
        gtDmarketValue.textAlignment=NSTextAlignmentCenter;

		gtDainOrLostPercentage=[[UILabel alloc]initWithFrame:CGRectMake(204, 5, 90, 31)];
		gtDainOrLostPercentage.textAlignment=NSTextAlignmentCenter;
		gtDainOrLostPercentage.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		gtDainOrLostPercentage.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		gtDainOrLostPercentage.backgroundColor=[UIColor clearColor];
        gtDainOrLostPercentage.textAlignment=NSTextAlignmentCenter;
		
		gtDgainOrLost=[[UILabel alloc]initWithFrame:CGRectMake(204, 65+130, 15, 31)];
		gtDgainOrLost.textAlignment=NSTextAlignmentCenter;
		gtDgainOrLost.font=[UIFont fontWithName:@"Avenir-Medium" size:12];
		gtDgainOrLost.textColor=[UIColor colorWithRed:0 green:0.561 blue:0.631 alpha:1];
		gtDgainOrLost.backgroundColor=[UIColor clearColor];
        gtDgainOrLost.textAlignment=NSTextAlignmentCenter;
		
		data=[[NSMutableArray alloc]init];
	//	
		
		[footer addSubview:Dfundname];
		[footer addSubview:Dunit];
		[footer addSubview:DaverageNAv];
		[footer addSubview:DclosingNAV];
		[footer addSubview:DfundValue];
		[footer addSubview:DmarketValue];
		[footer addSubview:DgainOrLost];
		[footer addSubview:gDfundValue];
		[footer addSubview:gDmarketValue];
		[footer addSubview:gDainOrLostPercentage];
		
		[footer addSubview:gtDfundValue];
		[footer addSubview:gtDmarketValue];
		[footer addSubview:gtDgainOrLost];
		[footer addSubview:gtDainOrLostPercentage];
		
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
	[self initbar];
	[self fetchData];
}

- (void) goBack
{
    [self.navigationController popViewControllerAnimated:YES];
    
	[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
}
-(void)initbar{
	UIImage* image_ = [UIImage imageNamed:@"back_"];
	CGRect frame_ = CGRectMake(-5, 0, 44, 44);
	UIButton* leftbutton = [[UIButton alloc] initWithFrame:frame_];
	[leftbutton setBackgroundImage:image_ forState:UIControlStateNormal];
	//[leftbutton setBackgroundImage:[UIImage imageNamed:@"left-push"] forState:UIControlStateHighlighted];
	[leftbutton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
	
	UIView *leftbuttonView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
	leftbuttonView.backgroundColor=[UIColor clearColor];
	[leftbuttonView addSubview:leftbutton];
	UIBarButtonItem* leftbarbutton = [[UIBarButtonItem alloc] initWithCustomView:leftbuttonView];
	
	UIImage* image2 = [UIImage imageNamed:@"add-button"];
	CGRect frame2 = CGRectMake(50, 0, 44, 44);
	UIButton* rightbutton = [[UIButton alloc] initWithFrame:frame2];
	[rightbutton setBackgroundImage:image2 forState:UIControlStateNormal];
	//[rightbutton setBackgroundImage:[UIImage imageNamed:@"right-push"] forState:UIControlStateHighlighted];
	[rightbutton addTarget:self action:@selector(rightbuttonPush) forControlEvents:UIControlEventTouchUpInside];
	
	
	UIView *RightbuttonView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 88, 44)];
	RightbuttonView.backgroundColor=[UIColor clearColor];
	[RightbuttonView addSubview:rightbutton];
	
	
	
	UIBarButtonItem* rightbarButton = [[UIBarButtonItem alloc] initWithCustomView:RightbuttonView];
	
	
	//[self.navigationItem setRightBarButtonItem:rightbarButton];
	[self.navigationItem setLeftBarButtonItem:leftbarbutton];
	
	
	[rightbarButton release];
	[rightbutton release];
	[leftbarbutton release];
	[leftbutton release];
	[self.navigationItem setLeftBarButtonItem:leftbarbutton];
}
-(void)fetchData{
	
    
    [data removeAllObjects];
    
	
    
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.panin-am.co.id:800/"]];
    [httpClient setParameterEncoding:AFFormURLParameterEncoding];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            [common dateStart],@"date",
							[common getSessionActive],@"sessionid",
							@"Currency",@"IDR",
							nil];
	
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST"
                                                            path:@"jsonCheckBalance.aspx"
                                                      parameters:params];
    
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id responseObject) {
        // code for successful return goes here
        NSLog(@"JSON--->%@",responseObject);
		for(id objectData in [responseObject objectForKey:@"Balance"]){
			
            saldoMX *objectDatax=[[saldoMX alloc] initWithDictionary:objectData];
			if(![data containsObject:objectData]){
				[data addObject:objectDatax];
			}
			
        }
		[self doDirty];
		// [netra reloadData];
	
        
        
        // do something with return data
    }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        // code for failed request goes here
        [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
        if(error){
            NSLog(@"error-->%@",error);
        }
        // do something on failure
    }];
    
    //self.filteredArray = [NSMutableArray arrayWithCapacity:netrax.count];
    
    [operation start];
	
}
-(void)doDirty{
	for (int i=0; i<data.count; i++) {
		NSLog(@"data Count00=>%d",data.count);
		saldoMX *object_draw = [data objectAtIndex:i];
		NSLog(@"object-->%@",object_draw.fundname);
		if([object_draw.fundname isEqualToString:@"Panin Dana US Dollar"]){
			NSNumberFormatter* decimalFormatter = [[NSNumberFormatter alloc] init];
			[decimalFormatter setNumberStyle: NSNumberFormatterDecimalStyle];
			[decimalFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
			[decimalFormatter setMaximumFractionDigits:2];
			[decimalFormatter setMinimumFractionDigits:0];
			decimalFormatter.usesGroupingSeparator = YES;
			decimalFormatter.groupingSeparator = @",";
			[decimalFormatter setAlwaysShowsDecimalSeparator:NO];
			
			NSNumberFormatter*  numberFormatter = [[NSNumberFormatter alloc] init];
			[numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
			[numberFormatter setMaximumFractionDigits:0];
			[numberFormatter setMinimumFractionDigits:0];
			[decimalFormatter setAlwaysShowsDecimalSeparator:NO];
			[numberFormatter setCurrencySymbol:@""];
			
			
			NSNumberFormatter*  percentFormatter = [[NSNumberFormatter alloc] init];
			[percentFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
			[percentFormatter setCurrencySymbol:@""];
			[percentFormatter setMaximumFractionDigits:2];
			[percentFormatter setMinimumFractionDigits:0];
			[percentFormatter setAlwaysShowsDecimalSeparator:YES];
			Dfundname.text=object_draw.fundname;
			Dunit.text=[decimalFormatter stringFromNumber:[NSNumber numberWithFloat:[object_draw.unit floatValue]]];
			DaverageNAv.text=[decimalFormatter stringFromNumber:[NSNumber numberWithFloat:[object_draw.averageNAv floatValue]]];
			DclosingNAV.text=[decimalFormatter stringFromNumber:[NSNumber numberWithFloat:[object_draw.closingNAV floatValue]]];
			DfundValue.text=[decimalFormatter stringFromNumber:[NSNumber numberWithFloat:[object_draw.fundValue floatValue]]];
			gDfundValue.text=[decimalFormatter stringFromNumber:[NSNumber numberWithFloat:[object_draw.fundValue floatValue]]];
			DmarketValue.text=[decimalFormatter stringFromNumber:[NSNumber numberWithFloat:[object_draw.marketValue floatValue]]];
			gDmarketValue.text=[decimalFormatter stringFromNumber:[NSNumber numberWithFloat:[object_draw.marketValue floatValue]]];
			DgainOrLost.text=[decimalFormatter stringFromNumber:[NSNumber numberWithFloat:[object_draw.gainOrLostPercentage floatValue]]];
			gDainOrLostPercentage.text=[decimalFormatter stringFromNumber:[NSNumber numberWithFloat:[object_draw.gainOrLostPercentage floatValue]]];
			[data removeObjectAtIndex:i];
			[self hitungGrandTotal];
		}
		/*else {
			Dfundname.text=object_draw.fundname;
			Dunit.text=@"-";
			DaverageNAv.text=@"-";
			DclosingNAV.text=@"-";
			DfundValue.text=@"-";
			
			DmarketValue.text=@"-";
			DgainOrLost.text=@"-";
			
        }*/
	}
	[detail reloadData];


}
-(void)hitungGrandTotal{
	NSNumberFormatter* decimalFormatter = [[NSNumberFormatter alloc] init];
	[decimalFormatter setNumberStyle: NSNumberFormatterDecimalStyle];
	[decimalFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
	[decimalFormatter setMaximumFractionDigits:2];
	[decimalFormatter setMinimumFractionDigits:0];
	decimalFormatter.usesGroupingSeparator = YES;
	decimalFormatter.groupingSeparator = @",";
	[decimalFormatter setAlwaysShowsDecimalSeparator:NO];
	
	NSNumberFormatter*  numberFormatter = [[NSNumberFormatter alloc] init];
	[numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
	[numberFormatter setMaximumFractionDigits:0];
	[numberFormatter setMinimumFractionDigits:0];
	[decimalFormatter setAlwaysShowsDecimalSeparator:NO];
	[numberFormatter setCurrencySymbol:@""];
	
	
	NSNumberFormatter*  percentFormatter = [[NSNumberFormatter alloc] init];
	[percentFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
	[percentFormatter setCurrencySymbol:@""];
	[percentFormatter setMaximumFractionDigits:2];
	[percentFormatter setMinimumFractionDigits:0];
	[percentFormatter setAlwaysShowsDecimalSeparator:YES];
	float sum = 0;
	float sum2=0;
	float sum3=0;
	float sum4=0;
	for (int i=0; i<data.count; i++) {
	
		saldoMX *object_draw = [data objectAtIndex:i];
		sum += [object_draw.fundValue floatValue];
		sum2 += [object_draw.marketValue floatValue];
		sum3 +=[object_draw.gainOrLostPercentage floatValue];
		sum4 +=[object_draw.gainOrLost floatValue];
			

	}
	gtDfundValue.text=[decimalFormatter stringFromNumber:[NSNumber numberWithFloat:sum]];
	gtDmarketValue.text=[decimalFormatter stringFromNumber:[NSNumber numberWithFloat:sum2]];
	gtDainOrLostPercentage.text=[decimalFormatter stringFromNumber:[NSNumber numberWithFloat:sum3]];
	gtDgainOrLost.text=[decimalFormatter stringFromNumber:[NSNumber numberWithFloat:sum4]];

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 96;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return data.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    saldoMX *object_draw = [data objectAtIndex:indexPath.row];
    //static NSString *CellIdentifier = @"CountryCell";
    
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%d",indexPath.section];
    
    csCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    
    if (cell == nil) {
        cell = [[csCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    
    }
	 NSNumberFormatter* decimalFormatter = [[NSNumberFormatter alloc] init];
	[decimalFormatter setNumberStyle: NSNumberFormatterDecimalStyle];
	[decimalFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
	[decimalFormatter setMaximumFractionDigits:2];
	[decimalFormatter setMinimumFractionDigits:0];
	decimalFormatter.usesGroupingSeparator = YES;
	decimalFormatter.groupingSeparator = @",";
	[decimalFormatter setAlwaysShowsDecimalSeparator:NO];
	
	NSNumberFormatter*  numberFormatter = [[NSNumberFormatter alloc] init];
	[numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
	[numberFormatter setMaximumFractionDigits:0];
	[numberFormatter setMinimumFractionDigits:0];
	[decimalFormatter setAlwaysShowsDecimalSeparator:NO];
	[numberFormatter setCurrencySymbol:@""];
	
	
	NSNumberFormatter*  percentFormatter = [[NSNumberFormatter alloc] init];
	[percentFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
	[percentFormatter setCurrencySymbol:@""];
	[percentFormatter setMaximumFractionDigits:2];
	[percentFormatter setMinimumFractionDigits:0];
	[percentFormatter setAlwaysShowsDecimalSeparator:YES];
	
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	cell.contentView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"content"]];
	cell.fundname.text=object_draw.fundname;
	cell.unit.text=[decimalFormatter stringFromNumber:[NSNumber numberWithFloat:[object_draw.unit floatValue]]];
	cell.averageNAv.text=[decimalFormatter stringFromNumber:[NSNumber numberWithFloat:[object_draw.averageNAv floatValue]]];
	cell.closingNAV.text=[decimalFormatter stringFromNumber:[NSNumber numberWithFloat:[object_draw.closingNAV floatValue]]];
	cell.fundValue.text=[decimalFormatter stringFromNumber:[NSNumber numberWithFloat:[object_draw.fundValue floatValue]]];
	
	cell.marketValue.text=[decimalFormatter stringFromNumber:[NSNumber numberWithFloat:[object_draw.marketValue floatValue]]];
	cell.gainOrLost.text=[decimalFormatter stringFromNumber:[NSNumber numberWithFloat:[object_draw.gainOrLostPercentage floatValue]]];
	
    return cell;
    
}

@end
