//
//  DetailCustomer.m
//  PAN-AM
//
//  Created by Arie on 6/27/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "DetailCustomer.h"

@interface DetailCustomer ()

@end

@implementation DetailCustomer

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"card"]];
		self.view.frame=CGRectMake(0, 0, 280, 280);
		self.view.layer.cornerRadius = 5;
		self.view.layer.masksToBounds = YES;
		
		Name =[[UILabel alloc]initWithFrame:CGRectMake(10, 80, self.view.frame.size.width-20, 30)];
		Name.textAlignment=NSTextAlignmentCenter;
		Name.font=[UIFont fontWithName:@"HelveticaNeue" size:13];
		Name.textColor=[UIColor darkGrayColor];
		
		Money =[[UILabel alloc]initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20, 30)];
		Money.textAlignment=NSTextAlignmentCenter;
		Money.font=[UIFont fontWithName:@"HelveticaNeue-Medium" size:24];
		Money.textColor=[UIColor blackColor];
		Money.backgroundColor=[UIColor clearColor];

		
		
		[self.view addSubview:Name];
		[self.view addSubview:Money];
		
		
		
    }
    return self;
}
-(void)fetchDetails:(NSString*)CIF{
	NSArray *personsWhoHave22 = [Mitra MR_findByAttribute:@"customerNo" withValue:[NSString stringWithFormat:@"%@",CIF]];
	NSMutableArray *data = [NSMutableArray arrayWithArray:personsWhoHave22];
	Mitra *dataxxxxx=[data objectAtIndex:0];
	Name.text=dataxxxxx.customerName;
	NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
	[numberFormatter setGroupingSeparator:@","];
	[numberFormatter setGroupingSize:3];
	[numberFormatter setUsesGroupingSeparator:YES];
	[numberFormatter setDecimalSeparator:@"."];
	[numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
	[numberFormatter setMaximumFractionDigits:2];
	
	NSString *ar = [NSString stringWithFormat:@"%@", dataxxxxx.totalAmountNonUSD];
	CGFloat myNumber = (CGFloat)[ar floatValue];

	Money.text=[NSString stringWithFormat:@"Rp %@",[numberFormatter stringFromNumber:[NSNumber numberWithFloat:myNumber]]];;


}
- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
		NSLog(@"selllf CIF--->%@",self.CIF);
	[self fetchDetails:self.CIF];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
