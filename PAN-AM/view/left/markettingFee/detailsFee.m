//
//  detailsFee.m
//  PAN-AM
//
//  Created by Arie on 7/20/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "detailsFee.h"
#import "msfObject.h"
#import "msCell.h"
@interface detailsFee ()

@end

@implementation detailsFee

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor=[UIColor whiteColor];
		details_array=[[NSMutableArray alloc]init];
		
		detail_fee=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height-44)];
		detail_fee.delegate=self;
		detail_fee.dataSource=self;
		[self.view addSubview:detail_fee];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:YES];
	self.navigationItem.hidesBackButton = YES;
	[self initbar];
	[self fetchdata];
	
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
-(void)fetchdata{
	
    [details_array removeAllObjects];
    
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.panin-am.co.id:800/"]];
    [httpClient setParameterEncoding:AFFormURLParameterEncoding];
	
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys: [common dateStart], @"startdate",  [common dateEnd], @"enddate",[common getSessionActive],@"sessionid",nil];
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST"
                                                            path:@"jsonMarketingSellingFee.aspx"
                                                      parameters:params];
    NSLog(@"%@,%@,%@",[common dateStart],[common dateEnd],[common getSessionActive]);
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id responseObject) {
        // code for successful return goes here
        NSLog(@"JSON--->%@",responseObject);
        for(id objectData in [responseObject objectForKey:@"ListSellingFee"]){
            msfObject *objectDatax=[[msfObject alloc] initWithDictionary:objectData];
            [details_array addObject:objectDatax];
        }
        
        [detail_fee reloadData];
        
        
        // do something with return data
    }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        // code for failed request goes here
        [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
        if(error){
            NSLog(@"error-->%@",error);
        }
        // do something on failure
    }];
    
    [operation start];


}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
	return details_array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	msfObject  *object_draw=[details_array objectAtIndex:indexPath.row];
	
    static NSString *CellIdentifier = @"CountryCell";
    
    msCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[msCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
	if(indexPath.row % 2==0){
		cell.contentView.backgroundColor=[UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1];
	}
	else{
		cell.contentView.backgroundColor=[UIColor colorWithRed:0.922 green:0.922 blue:0.922 alpha:1];
	}
	cell.nasabahName.text=object_draw.Customer;
	cell.type.text=object_draw.VoucherSts;
	cell.tanggal.text=object_draw.TransDate;
	cell.jumlah.text=[NSString stringWithFormat:@"%@",object_draw.NetAmount];
	cell.fee.text=[NSString stringWithFormat:@"%@",object_draw.SellingFeePercent];
	cell.rp.text=[NSString stringWithFormat:@"%@",object_draw.SellingFeeAmount];
    cell.contentView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"mse"]];
	return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 58.5)];
	headerView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"msfheader"]];
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 58.5;
}
@end
