//
//  KalkulatorHasilInvestasi.m
//  PAM-Guide
//
//  Created by Dave Harry on 4/26/13.
//  Copyright (c) 2013 Dave Harry. All rights reserved.
//

#import "KalkulatorHasilInvestasiBerkala.h"

#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

@interface KalkulatorHasilInvestasiBerkala ()

@end

@implementation KalkulatorHasilInvestasiBerkala

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
    UIImage *minImage = [UIImage imageNamed:@"pam-ipad-investor-slider1-296.png"];
    UIImage *maxImage = [UIImage imageNamed:@"pam-ipad-investor-slider-296.png"];
    
    
    minImage=[minImage stretchableImageWithLeftCapWidth:10.0 topCapHeight:5.0];
    maxImage=[maxImage stretchableImageWithLeftCapWidth:10.0 topCapHeight:5.0];
    
    // Setup the FX slider
    [sliderTingkatInflasi setMinimumTrackImage:minImage forState:UIControlStateNormal];
    [sliderTingkatInflasi setMaximumTrackImage:maxImage forState:UIControlStateNormal];

   

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


-(BOOL) textFieldShouldReturn: (UITextField *) textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)slide {
	[self.sidePanelController showLeftPanel:YES];
}

- (IBAction)hitung:(id)sender
{
    
    NSString *nilaiInvestasi = teksNilaiInvestasi.text;
    NSString *jangkawaktu = teksJangkaWaktu.text;
    CGFloat strFloat = (CGFloat)[jangkawaktu floatValue];
    CGFloat strnilaInvestasi = (CGFloat)[nilaiInvestasi floatValue];
    float slidetingkatinvestasiplussatu= 1 + [sliderTingkatInflasi value] /100;
    
    //float perkiraaninvestasiakhir = pow(slidetingkatinvestasiplussatu,strFloat) * strnilaInvestasi;
    
    
    //hitung investasi per bulan
    float strfloatM = strFloat*12;
    float slidediv = ([sliderTingkatInflasi value]/100)/12;
    float part10 = 1 + slidediv;
    float part11 = (pow(part10,strfloatM)-1); //OK
    float part12 = part11/slidediv*part10;
    
    float hasilinvestasiperbulan = strnilaInvestasi*part12;
    
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle: NSNumberFormatterDecimalStyle];
    [numberFormatter setMaximumFractionDigits:2];
    
    NSString *numberAsString = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:hasilinvestasiperbulan]];
    
    perkiraanHasilInvestasi.text = numberAsString;
    
    
}

-(IBAction)sliderchange:(id)sender
{
    
    NSNumber *slidevalue = [[NSNumber alloc] initWithFloat:((UISlider*)sender).value];
    

    labelTingkatInflasi.text = [NSString stringWithFormat:@"%d", [slidevalue intValue]];
    

    ((UISlider*)sender).value = [slidevalue intValue];
}

- (IBAction)back{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"closefader" object:self];
    [self.view removeFromSuperview];
    
}




@end
