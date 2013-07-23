//
//  COFCoverMenu.m
//  PAM-Guide
//
//  Created by Panin Sekuritas 2 on 5/30/13.
//  Copyright (c) 2013 Dave Harry. All rights reserved.
//

#import "COFCoverMenu.h"
#import "SubClassHajj.h"
#import "SubClassHoliday.h"
#import "SubClassEntrepreneur.h"
#import "SubClassRumah.h"
#import "SubClassPostDegree.h"
#import "SubClassMarried.h"
#import "SubClassHoliday.h"
#import "SubClassKendaraan.h"
#import "SubClassPensiun.h"
#import "SubClassPendidikan.h"


@interface COFCoverMenu ()

@end

@implementation COFCoverMenu
@synthesize subv,txtscroll;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    txtscroll.contentSize = CGSizeMake(250, 2500);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:YES];
	[self initNavBar];
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

- (IBAction)openSubMenu:(id)sender
{
        switch ([(UIButton*)sender tag]){
            case 1:
                self.subv = [[SubClassHoliday alloc] initWithNibName:@"SubClassHoliday" bundle:nil] ;
                break;
            case 2:
                self.subv = [[SubClassEntrepreneur alloc] initWithNibName:@"SubClassEntrepreneur" bundle:nil] ;
                break;
            case 3:
                self.subv = [[SubClassRumah alloc] initWithNibName:@"SubClassRumah" bundle:nil] ;
                break;
            case 4:
                self.subv = [[SubClassPendidikan alloc] initWithNibName:@"SubClassPendidikan" bundle:nil] ;
                break;
            case 6:
               self.subv = [[SubClassHoliday alloc] initWithNibName:@"SubClassHoliday" bundle:nil] ;
                break;
            case 5:
                self.subv = [[SubClassHajj alloc] initWithNibName:@"SubClassHajj" bundle:nil] ;
                break;
            //case 6:
                //self.subv = [[Chapter_4_1_1 alloc] initWithNibName:@"Chapter_4_1_6_ipad" bundle:nil] ;
                //break;
            case 7:
                self.subv = [[SubClassPostDegree alloc] initWithNibName:@"SubClassPostDegree" bundle:nil] ;
                break;
            case 8:
                self.subv = [[SubClassMarried alloc] initWithNibName:@"SubClassMarried" bundle:nil] ;
                break;
            case 9:
                self.subv = [[SubClassKendaraan alloc] initWithNibName:@"SubClassKendaraan" bundle:nil] ;
                break;
            case 10:
                self.subv = [[SubClassPensiun alloc] initWithNibName:@"SubClassPensiun" bundle:nil] ;
                break;
            default:
                self.subv = nil;
                break;
        }
//fader.hidden = NO;
//[[NSNotificationCenter defaultCenter] postNotificationName:@"photoshow" object:self];
//[[NSNotificationCenter defaultCenter] postNotificationName:@"hidepager" object:self]; remove by request
//[self presentPopupViewController:subv animationType:MJPopupViewAnimationFade];
//    subv.view.center = self.view.center;
//    [self.view addSubview:subv.view];

//    CGFloat parentWidth = self.view.bounds.size.width;
//    CGRect frame = CGRectMake(floor((parentWidth - 1024)/2),
//                              0,
//                              1024,
//                              768);
//    subv.view.frame = frame;

    [self.view addSubview:subv.view];
}

- (IBAction)back:(id)sender{
    [self.view removeFromSuperview];
}

@end
