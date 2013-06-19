//
//  netraViewControllerRight.m
//  PAN-AM
//
//  Created by Arie on 6/18/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "netraViewControllerRight.h"
#import "rightCell.h"
@interface netraViewControllerRight ()

@end

@implementation netraViewControllerRight

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor=[UIColor colorWithRed:0.118 green:0.125 blue:0.125 alpha:1];
		netraTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
		netraTable.backgroundColor=[UIColor clearColor];
		netraTable.delegate=self;
		netraTable.dataSource=self;
		[self.view addSubview:netraTable];
		netraMutableArray=[[NSMutableArray alloc]init];
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:YES];
	[self fetchData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// Do any additional setup after loading the view.
}
-(void)fetchData{
	NSString * sURL = [NSString stringWithFormat:@"%@",tradeUrl];
	
	NSURL *URL=[NSURL URLWithString:sURL];
	NSMutableURLRequest * request = [[NSMutableURLRequest alloc] initWithURL:URL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60];
	
    AFJSONRequestOperation *operation=[[[AFJSONRequestOperation alloc] initWithRequest:request] autorelease];
	[AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
	
    //AFHTTPRequestOperation * operation =[[AFHTTPRequestOperation alloc] initWithRequest:request];
	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {

		
		for(id newsObjct in [responseObject objectForKey:@"products"]){
			netraTrading *tradings=[[netraTrading alloc] initWithDictionary:newsObjct];
			[netraMutableArray addObject:tradings];
			[tradings release];
		}
		[netraTable reloadData];
	}failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		if(error){
			//[spinner stopAnimating];
			//regional_radioList.hidden=YES;
			 NSLog(@"error: %@", [error description]);
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
	return  70;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return netraMutableArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	netraTrading  *object_draw=[netraMutableArray objectAtIndex:indexPath.row];
    static NSString *CellIdentifier = @"CountryCell";
    
    rightCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[rightCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
	cell.product.text=[NSString stringWithFormat:@"%@",object_draw.ProductName];
	
	cell.precentage.text=[NSString stringWithFormat:@"%0.2f%%", [object_draw.OneD floatValue]];
	if([object_draw.OneD floatValue]<0)
	{
		cell.precentage.textColor=[UIColor redColor];
		[cell.status setImage:[UIImage imageNamed:@"down"]];
	}
	else{
	cell.precentage.textColor=[UIColor greenColor];
		[cell.status setImage:[UIImage imageNamed:@"up"]];
	}
	cell.valueofData.text=object_draw.NABValue;

	
	cell.detailTextLabel.backgroundColor=[UIColor clearColor];
	cell.selectionStyle=UITableViewCellEditingStyleNone;
	
	
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
