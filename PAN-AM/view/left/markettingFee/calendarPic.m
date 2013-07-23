//
//  calendarPic.m
//  PAN-AM
//
//  Created by Arie on 7/20/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import "calendarPic.h"

@interface calendarPic ()<DSLCalendarViewDelegate>
@end

@implementation calendarPic

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor=[UIColor whiteColor];
		calendarView=[[DSLCalendarView alloc]initWithFrame:CGRectMake(0, 0, 320, 300)];
		calendarView.delegate = self;
		[self.view addSubview:calendarView];
		self.title=@"Pilih Tanggal";
		
		UIButton *cari=[UIButton buttonWithType:UIButtonTypeCustom];
		[cari setFrame:CGRectMake(48.5, 340, 223, 44)];
		[cari addTarget:self action:@selector(tampilkan) forControlEvents:UIControlEventTouchUpInside];
		[cari setBackgroundImage:[UIImage imageNamed:@"laporan"] forState:UIControlStateNormal];
		
		[self.view addSubview:cari];
    }
    return self;
}
-(void)tampilkan{
	
	[self dismissViewControllerAnimated:YES completion:nil];
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

- (void)calendarView:(DSLCalendarView *)calendarView didSelectRange:(DSLCalendarRange *)range {
    if (range != nil) {
      //  NSLog( @"Selected %d/%d - %d/%d", range.startDay.ye, range.startDay.month, range.endDay.day, range.endDay.month);
		dateStart=[NSString stringWithFormat:@"%d-%d-%d",range.startDay.year,range.startDay.month,range.startDay.day];
		dateEnd=[NSString stringWithFormat:@"%d-%d-%d",range.endDay.year,range.endDay.month,range.endDay.day];
		[common setStart:dateStart dateE:dateEnd];
    }
    else {
        NSLog( @"No selection" );
    }
}

- (DSLCalendarRange*)calendarView:(DSLCalendarView *)calendarView didDragToDay:(NSDateComponents *)day selectingRange:(DSLCalendarRange *)range {
    if (NO) { // Only select a single day
        return [[DSLCalendarRange alloc] initWithStartDay:day endDay:day];
    }
    else if (NO) { // Don't allow selections before today
        NSDateComponents *today = [[NSDate date] dslCalendarView_dayWithCalendar:calendarView.visibleMonth.calendar];
        
        NSDateComponents *startDate = range.startDay;
        NSDateComponents *endDate = range.endDay;
        
        if ([self day:startDate isBeforeDay:today] && [self day:endDate isBeforeDay:today]) {
            return nil;
        }
        else {
            if ([self day:startDate isBeforeDay:today]) {
                startDate = [today copy];
            }
            if ([self day:endDate isBeforeDay:today]) {
                endDate = [today copy];
            }
            
            return [[DSLCalendarRange alloc] initWithStartDay:startDate endDay:endDate];
        }
    }
    
    return range;
}
-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:YES];
	[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar1"] forBarMetrics:UIBarMetricsDefault];
	//change back button image
	
	
	UIButton *backButton = [[[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 44.0, 44.0)] autorelease];
	[backButton setBackgroundImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
	[backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
	
	UIBarButtonItem * backButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:backButton] autorelease];
		self.navigationItem.leftBarButtonItem = backButtonItem;

   
}
- (void)calendarView:(DSLCalendarView *)calendarView willChangeToVisibleMonth:(NSDateComponents *)month duration:(NSTimeInterval)duration {
    NSLog(@"Will show %@ in %.3f seconds", month, duration);
}

- (void)calendarView:(DSLCalendarView *)calendarView didChangeToVisibleMonth:(NSDateComponents *)month {
    NSLog(@"Now showing %@", month);
}

- (BOOL)day:(NSDateComponents*)day1 isBeforeDay:(NSDateComponents*)day2 {
    return ([day1.date compare:day2.date] == NSOrderedAscending);
}
- (void) goBack
{
    [self.navigationController dismissModalViewControllerAnimated:YES];
}
@end
