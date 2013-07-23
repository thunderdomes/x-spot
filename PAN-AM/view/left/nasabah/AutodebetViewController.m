//
//  AutodebetViewController.m
//  PAN-AM
//
//  Created by Arie on 7/23/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "AutodebetViewController.h"
#import "debetMX.h"
#import "autodebetCel.h"
@interface AutodebetViewController ()

@end

@implementation AutodebetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor=[UIColor whiteColor];
		netra=[[UITableView alloc]init];
        netra.frame=CGRectMake(0,0, 320, self.view.frame.size.height-44);
        netra.delegate=self;
        netra.dataSource=self;
        [self.view addSubview:netra];
        self.netrax=[[NSMutableArray alloc]init];
		
    }
    return self;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 71)];
	header.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"pam-iphone-nasabah-autodebet-header-320-71"]];
    //header.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"nyahahah"]];
    
    return header;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 104;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 71;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.netrax.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
    
    static NSString *CellIdentifier = @"CountryCell";
    
    autodebetCel *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[autodebetCel alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    if(self.netrax.count!=0){
        debetMX *object_draw = [self.netrax objectAtIndex:indexPath.row];
        cell.fundnameLabel.text=[NSString stringWithFormat:@"%@",object_draw.FundName];
        cell.everydateLabel.text=[NSString stringWithFormat:@"%@", object_draw.EveryDate];
        NSString *test =[NSString stringWithFormat:@"%@", object_draw.StartMonth];
		
        if([test isEqualToString:@"1"]){
            cell.startmonthLabel.text = @"Jan";
        }else {
            if ([test isEqualToString:@"2"]) {
                cell.startmonthLabel.text = @"Feb";
            }else {
                if ([test isEqualToString:@"3"]) {
					cell.startmonthLabel.text = @"Mar";
                } else {
                    if ([test isEqualToString:@"4"]) {
                        cell.startmonthLabel.text = @"Apr";
                    }else {
                        if ([test isEqualToString:@"5"]) {
                            cell.startmonthLabel.text = @"May";
                        }else {
                            if ([test isEqualToString:@"6"]) {
                                cell.startmonthLabel.text = @"Jun";
                            }else {
                                if ([test isEqualToString:@"7"]) {
                                    cell.startmonthLabel.text = @"Jul";
                                }else {
                                    if ([test isEqualToString:@"8"]) {
                                        cell.startmonthLabel.text = @"Aug";
                                    }else {
                                        if ([test isEqualToString:@"9"]) {
                                            cell.startmonthLabel.text = @"Sep";
                                        }else {
                                            if ([test isEqualToString:@"10"]) {
                                                cell.startmonthLabel.text = @"Oct";
                                            }else {
                                                if ([test isEqualToString:@"11"]) {
                                                    cell.startmonthLabel.text = @"Nov";
                                                }else {
                                                    if ([test isEqualToString:@"12"]) {
                                                        cell.startmonthLabel.text = @"Dec";
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
        }
		
        cell.startyearLabel.text = [NSString stringWithFormat:@"%@", object_draw.StartYear];
        
        cell.everydateLabel1.text = [NSString stringWithFormat:@"%@", object_draw.EveryDate];
        
        
        NSString *test1 = [NSString stringWithFormat:@"%@", object_draw.EndMonth];
        
        
        if([test1 isEqualToString:@"1"]){
            cell.endmonthLabel.text = @"Jan";
        }else {
            if ([test1 isEqualToString:@"2"]) {
                cell.endmonthLabel.text = @"Feb";
            }else {
                if ([test1 isEqualToString:@"3"]) {
                    cell.endmonthLabel.text = @"Mar";
                } else {
                    if ([test1 isEqualToString:@"4"]) {
                        cell.endmonthLabel.text = @"Apr";
                    }else {
                        if ([test1 isEqualToString:@"5"]) {
                            cell.endmonthLabel.text = @"May";
                        }else {
                            if ([test1 isEqualToString:@"6"]) {
                                cell.endmonthLabel.text = @"Jun";
                            }else {
                                if ([test1 isEqualToString:@"7"]) {
                                    cell.endmonthLabel.text = @"Jul";
                                }else {
                                    if ([test1 isEqualToString:@"8"]) {
                                        cell.endmonthLabel.text = @"Aug";
                                    }else {
                                        if ([test1 isEqualToString:@"9"]) {
                                            cell.endmonthLabel.text = @"Sep";
                                        }else {
                                            if ([test1 isEqualToString:@"10"]) {
                                                cell.endmonthLabel.text = @"Oct";
                                            }else {
                                                if ([test1 isEqualToString:@"11"]) {
                                                    cell.endmonthLabel.text = @"Nov";
                                                }else {
                                                    if ([test1 isEqualToString:@"12"]) {
                                                        cell.endmonthLabel.text = @"Dec";
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
        }
        
		
		
        cell.endyearLabel.text = [NSString stringWithFormat:@"%@", object_draw.EndYear];
		
        cell.feeLabel.text = [NSString stringWithFormat:@"%@", object_draw.Fee];
		
		// cell.unitbalanceLabel.text = [NSString stringWithFormat:@"%@", object_draw.unitBalance];
        
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setGroupingSeparator:@","];
        [numberFormatter setGroupingSize:3];
        [numberFormatter setUsesGroupingSeparator:YES];
        [numberFormatter setDecimalSeparator:@"."];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [numberFormatter setMaximumFractionDigits:2];
        
		
        
        
        //cell.nominalLabel.text = [NSString stringWithFormat:@"%@", object_draw.Nominal];
        float nominal = [object_draw.Nominal floatValue];
        cell.nominalLabel.text = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:nominal]];
        cell.bankNameLabel.text = [NSString stringWithFormat:@"%@", object_draw.BankName];
        cell.productnameLabel.text = [NSString stringWithFormat:@"%@", object_draw.ProductName];
        float unitbalance = nominal / (1+[cell.feeLabel.text floatValue]/100);
        NSString *theString = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:unitbalance]];
        cell.unitbalanceLabel.text = [NSString stringWithFormat:@"%@",theString];
        
		
        
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
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
	[self initNavBar];
	[self fetchData];
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
-(void)fetchData{
    
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.panin-am.co.id:800/"]];
    [httpClient setParameterEncoding:AFFormURLParameterEncoding];

    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:[common getSessionActive],@"sessionid",nil];
	
	
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST"
                                                            path:@"jsonProgramAutoDebet.aspx"
                                                      parameters:params];
    
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id responseObject) {
        // code for successful return goes here
        NSLog(@"JSON--->%@",responseObject);
        for(id objectData in [responseObject objectForKey:@"AutoDebet"]){
            debetMX *objectDatax=[[debetMX alloc] initWithDictionary:objectData];
            [self.netrax addObject:objectDatax];
        }
        
        [netra reloadData];
        
        
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


@end
