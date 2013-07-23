//
//  netraViewController.m
//  PAN-AM
//
//  Created by Arie on 6/18/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "netraViewController.h"
#import "newsCell.h"
#import "SVModalWebViewController.h"
@interface netraViewController ()

@end

@implementation netraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor=[UIColor whiteColor];
		newsViewController=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-44)];
		newsViewController.dataSource=self;
		newsViewController.delegate=self;
		newsViewController.separatorColor=[UIColor colorWithRed:0.976 green:0.675 blue:0.09 alpha:1];
		[self.view addSubview:newsViewController];
		
		///
		netraMutableArray=[[NSMutableArray alloc]init];
		
		
	
		
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self fetchData];
	// Do any additional setup after loading the view.
}
-(void)fetchData{
	NSString * sURL = [NSString stringWithFormat:@"%@",newsUrl];
	
	
	NSURL *URL=[NSURL URLWithString:sURL];
	NSMutableURLRequest * request = [[NSMutableURLRequest alloc] initWithURL:URL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60];
	
    AFJSONRequestOperation *operation=[[[AFJSONRequestOperation alloc] initWithRequest:request] autorelease];
	[AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
	
    //AFHTTPRequestOperation * operation =[[AFHTTPRequestOperation alloc] initWithRequest:request];
	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
		
		for(id newsObjct in [responseObject objectForKey:@"listNews"]){
		netraNewsObject *news=[[netraNewsObject alloc] initWithDictionary:newsObjct];
			[netraMutableArray addObject:news];
			
			[news release];
		}
		
		[newsViewController reloadData];
	}failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		if(error){
			//[spinner stopAnimating];
			//regional_radioList.hidden=YES;
		}
        NSLog(@"error: %@", [error description]);
		
	}];
	[operation start];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return  90;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return netraMutableArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	netraNewsObject  *object_draw=[netraMutableArray objectAtIndex:indexPath.row];
    static NSString *CellIdentifier = @"CountryCell";
    
    newsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[newsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
 	
	cell.title.text=object_draw.title;
	cell.excerpt.text=object_draw.shortDesc;
	cell.date.text=object_draw.modifiedDate;
	
	cell.detailTextLabel.backgroundColor=[UIColor clearColor];
	cell.selectionStyle=UITableViewCellEditingStyleNone;
	
	
    return cell;
}
-(void)viewWillAppear:(BOOL)animated{

	[super viewWillAppear:YES];
	[self initNavBar];
}
-(void)initNavBar{
	[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar1_"] forBarMetrics:UIBarMetricsDefault];
	//UIImage* image = [UIImage imageNamed:@"left"];
	CGRect frame = CGRectMake(-5, 0, 44, 44);
	UIButton* leftbutton = [[UIButton alloc] initWithFrame:frame];
	//[leftbutton setBackgroundImage:image forState:UIControlStateNormal];
	[leftbutton setBackgroundImage:[UIImage imageNamed:@"left_"] forState:UIControlStateNormal];
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
   
        //
        netraNewsObject  *object_draw=[netraMutableArray objectAtIndex:indexPath.row];
		
        
        NSString *str = [object_draw.newsLink stringByReplacingOccurrencesOfString:@"&#47"
																 withString:@"/"];
        NSLog(@"str:%@",str);
		
        
        NSString *newAddress = [[NSString alloc]initWithFormat:@"http://www.readability.com/m?url=%@",str];
        
        SVModalWebViewController *browser = [[SVModalWebViewController alloc] initWithAddress:newAddress];
        [self presentModalViewController:browser animated:YES];
		NSLog(@"link: %@",newAddress);

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
