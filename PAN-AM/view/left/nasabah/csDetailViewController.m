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
		UIView *footer=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 227)];
		footer.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"csfooter"]];
		//header.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"nyahahah"]];


		detail.tableHeaderView=header;
		detail.tableFooterView=footer;
		
		[self.view addSubview:detail];
		
		data=[[NSMutableArray alloc]init];
		
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
		saldoMX *object_draw = [data objectAtIndex:i];
		NSLog(@"object-->%@",object_draw.fundname);
		if([object_draw.fundname isEqualToString:@"Panin Dana US Dollar"]){
			[data removeObjectAtIndex:i];
		} else {
            //
			
        }
	}
	[detail reloadData];


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
	cell.gainOrLost.text=[decimalFormatter stringFromNumber:[NSNumber numberWithFloat:[object_draw.gainOrLost floatValue]]];
	
    return cell;
    
}

@end
