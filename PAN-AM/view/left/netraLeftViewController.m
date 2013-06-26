//
//  netraLeftViewController.m
//  PAN-AM
//
//  Created by Arie on 6/18/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "netraLeftViewController.h"
#import "netraGLobalLoginViewController.h"
@interface netraLeftViewController ()

@end

@implementation netraLeftViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.view.backgroundColor=[UIColor colorWithRed:0.118 green:0.125 blue:0.125 alpha:1];
		netraTable=[[UITableView alloc]init];
		netraTable.backgroundColor=[UIColor clearColor];
		netraTable.separatorColor=[UIColor colorWithRed:0.263 green:0.263 blue:0.263 alpha:1];
		netraTable.delegate=self;
		netraTable.dataSource=self;
		[self.view addSubview:netraTable];
		netraMutableArray=[[NSMutableArray alloc]init];
		
		[self setMenu:Nil];
		dataPass=[[NSMutableArray alloc]init];
		
		pam_login_Nasabah=[UIButton buttonWithType:UIButtonTypeCustom];
		[pam_login_Nasabah setFrame:CGRectMake(10, self.view.frame.size.height-160, 223, 82)];
		[pam_login_Nasabah addTarget:self action:@selector(LoginNasabah) forControlEvents:UIControlEventTouchUpInside];
		[pam_login_Nasabah setBackgroundImage:[UIImage imageNamed:@"login_nasabah"] forState:UIControlStateNormal];
		[self.view addSubview:pam_login_Nasabah];
		
		pam_login_mitra=[UIButton buttonWithType:UIButtonTypeCustom];
		[pam_login_mitra addTarget:self action:@selector(loginMitra) forControlEvents:UIControlEventTouchUpInside];
		[pam_login_mitra setFrame:CGRectMake(10, self.view.frame.size.height-85, 223, 82)];
		[pam_login_mitra setBackgroundImage:[UIImage imageNamed:@"login_mitra"] forState:UIControlStateNormal];
		[self.view addSubview:pam_login_mitra];

		
        // Custom initialization
    }
    return self;
}
-(void)ifLoginTrue{
	[self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
}
-(void)setMenu:(NSString*)object{
	if(object==nil){
		[self.arForTable removeAllObjects];
		NSDictionary *dTmp= [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"leftWindow" ofType:@"plist"]];
		self.arrayOriginal=[dTmp valueForKey:@"biasa"];
		pam_login_mitra.hidden=NO;
		pam_login_Nasabah.hidden=NO;
		self.arForTable=[[NSMutableArray alloc] init];
		[self.arForTable addObjectsFromArray:self.arrayOriginal];
		netraTable.frame=CGRectMake(0, 0, 320, self.view.frame.size.height-180);
		[netraTable reloadData];

		
	}
	else if([object isEqualToString:@"mitra"]){
		[self.arForTable removeAllObjects];
		NSDictionary *dTmp= [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"leftWindow" ofType:@"plist"]];
		self.arrayOriginal=[dTmp valueForKey:object];
		pam_login_mitra.hidden=YES;
		pam_login_Nasabah.hidden=YES;
		self.arForTable=[[NSMutableArray alloc] init];
		[self.arForTable addObjectsFromArray:self.arrayOriginal];
		netraTable.frame=CGRectMake(0, 0, 320, self.view.frame.size.height);
		[netraTable reloadData];
	}
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
{
    return 44;
}
-(void)LoginNasabah{
	loginWindow=[[netraGLobalLoginViewController alloc]init];
	loginWindow.Status=@"Login Nasabah";
	[self presentPopupViewController:loginWindow animationType:MJPopupViewAnimationSlideBottomBottom];

}
-(void)loginMitra{
	loginWindow=[[netraGLobalLoginViewController alloc]init];
	loginWindow.Status=@"Login Mitra";
	[self presentPopupViewController:loginWindow animationType:MJPopupViewAnimationSlideBottomBottom];
}
- (UIView*) tableView: (UITableView*) tableView viewForHeaderInSection: (NSInteger) section
{
	/* assumes your tableview is 320 wide, makes a section header 80 pixels high */
	UIView *customView = [[[UIView alloc] initWithFrame: CGRectMake(0.0, 0.0, 320.0, 60)] autorelease];
	
	
	customView.backgroundColor = [UIColor colorWithRed:0.118 green:0.125 blue:0.125 alpha:1];
	
	UIView *border=[[UIView alloc]initWithFrame:CGRectMake(0, 44, 320,1)];
	border.backgroundColor=[UIColor colorWithRed:0.976 green:0.675 blue:0.09 alpha:1];
	
	UIView *border_top=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320,1)];
	border_top.backgroundColor=[UIColor blackColor];
	
	UILabel *reksa=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 130, 36)];
	reksa.backgroundColor=[UIColor clearColor];
	reksa.numberOfLines=2;
	reksa.lineBreakMode=NSLineBreakByCharWrapping;
	reksa.textColor=[UIColor whiteColor];
	reksa.font=[UIFont fontWithName:@"AvenirNext-Medium" size:15];
	reksa.text=@"Reksa Dana Panin";
	
	[customView addSubview:reksa];
	[customView addSubview: border];
	[customView addSubview: border_top];
	
	return customView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arForTable count];
}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
	    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
	
	NSString *cellValue = [[self.arForTable objectAtIndex:indexPath.row]objectForKey:@"name"];
	cell.textLabel.text=cellValue;
	cell.textLabel.textAlignment=NSTextAlignmentLeft;
	cell.textLabel.textColor=[UIColor whiteColor];
	cell.textLabel.font=[UIFont fontWithName:@"AvenirNext-Medium" size:14];
    //myTag = [[[self.arForTable objectAtIndex:indexPath.row] objectForKey:@"tag"]integerValue];
	cell.indentationLevel=[[[self.arForTable objectAtIndex:indexPath.row] objectForKey:@"level"]integerValue];
	NSLog(@"level->%d",[[[self.arForTable objectAtIndex:indexPath.row] objectForKey:@"level"]integerValue]);
	if([[[self.arForTable objectAtIndex:indexPath.row] objectForKey:@"level"]integerValue]>0){
		cell.textLabel.textColor=[UIColor redColor];
	}
	UIView *selectionColor = [[UIView alloc] init];
	selectionColor.backgroundColor =[UIColor colorWithRed:0 green:0.486 blue:0.557 alpha:1] ;
    cell.selectedBackgroundView = selectionColor;
	
	
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
	
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	if(cell.tag==0){
		cell.backgroundColor=[UIColor clearColor];
		
	}
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	//[self jumper:cell.textLabel.text];
	BOOL isAlreadyInserted=NO;
	NSDictionary *d=[self.arForTable objectAtIndex:indexPath.row];
	
	if(cell.tag==0){
		cell.backgroundColor=[UIColor colorWithRed:0 green:0.486 blue:0.557 alpha:1];
		
	}
	
	
	if([d valueForKey:@"Object"]) {
		NSArray *ar=[d valueForKey:@"Object"];
		
		isAlreadyInserted=NO;
		
		for(NSDictionary *dInner in ar ){
			NSInteger index=[self.arForTable indexOfObjectIdenticalTo:dInner];
			
			isAlreadyInserted=(index>0 && index!=NSIntegerMax);
			if(isAlreadyInserted) break;
			
			
		}
		
		if(isAlreadyInserted) {
			[self miniMizeThisRows:ar];
		} else {
			NSUInteger count=indexPath.row+1;
			NSMutableArray *arCells=[NSMutableArray array];
			for(NSDictionary *dInner in ar ) {
				[arCells addObject:[NSIndexPath indexPathForRow:count inSection:0]];
				
				[self.arForTable insertObject:dInner atIndex:count++];
				
			}
			[tableView insertRowsAtIndexPaths:arCells withRowAnimation:UITableViewRowAnimationFade];
			tableView.tag=[arCells objectAtIndex:0];
			
			
		}
	}

	
	/////passing calculator
	if([cell.textLabel.text isEqualToString:@"Berita"]){
		[dataPass addObject:@"netraViewController"];
		[[NSNotificationCenter defaultCenter] postNotificationName:@"dealNotification" object:dataPass];
		
		[self.sidePanelController showCenterPanel:YES];
		[dataPass removeAllObjects];
		
		
	}
	else if([cell.textLabel.text isEqualToString:@"Hasil Investasi"]){
		[dataPass addObject:@"netraHasilInvestasiViewController"];
		[[NSNotificationCenter defaultCenter] postNotificationName:@"dealNotification" object:dataPass];
		
		[self.sidePanelController showCenterPanel:YES];
		[dataPass removeAllObjects];
		

	}
	else if([cell.textLabel.text isEqualToString:@"Hasil Investasi Berkala"]){
		[dataPass addObject:@"netraBerkalaViewController"];
		[[NSNotificationCenter defaultCenter] postNotificationName:@"dealNotification" object:dataPass];
		[self.sidePanelController showCenterPanel:YES];
		[dataPass removeAllObjects];
		
		
	}
	else if([cell.textLabel.text isEqualToString:@"Kebutuhan Investasi"]){
		[dataPass addObject:@"netraKebutuhanViewController"];
		[[NSNotificationCenter defaultCenter] postNotificationName:@"dealNotification" object:dataPass];
		
		[self.sidePanelController showCenterPanel:YES];
		[dataPass removeAllObjects];
		
		
	}
	else if([cell.textLabel.text isEqualToString:@"Logout"]){
		[self setMenu:nil];
		
	}
	
	
	
}
-(void)miniMizeThisRows:(NSArray*)ar{
	for(NSDictionary *dInner in ar ) {
		NSUInteger indexToRemove=[self.arForTable indexOfObjectIdenticalTo:dInner];
		NSArray *arInner=[dInner valueForKey:@"Objects"];
		if(arInner && [arInner count]>0){
			[self miniMizeThisRows:arInner];
		}
		
		if([self.arForTable indexOfObjectIdenticalTo:dInner]!=NSNotFound) {
			[self.arForTable removeObjectIdenticalTo:dInner];
			[netraTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:
											  [NSIndexPath indexPathForRow:indexToRemove inSection:0]
											  ]
							withRowAnimation:UITableViewRowAnimationFade];
		}
	}
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(afterLogin:)
												name:@"AfterLogin"
											  object:nil];
	[dataPass release];
	// Do any additional setup after loading the view.
}
-(void)afterLogin:(NSNotification*)notification{
	NSMutableArray *dict = (NSMutableArray*)notification.object;
	NSLog(@"dict-->%@",[dict objectAtIndex:0]);
	sessionId=[dict objectAtIndex:0];
	[self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
	[loginWindow release];
	[self setMenu:[dict objectAtIndex:1]];
}
-(void)dealloc{
	[super dealloc];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
