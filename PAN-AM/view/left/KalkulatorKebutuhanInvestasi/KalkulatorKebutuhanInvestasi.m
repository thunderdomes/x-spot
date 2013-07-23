//
//  KalkulatorKebutuhanInvestasi.m
//  PAM-Guide
//
//  Created by Dave Harry on 4/17/13.
//  Copyright (c) 2013 Dave Harry. All rights reserved.
//

#import "KalkulatorKebutuhanInvestasi.h"

#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

@interface KalkulatorKebutuhanInvestasi ()

@end

@implementation KalkulatorKebutuhanInvestasi

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
    
    [sliderReturnInvestasi setMinimumTrackImage:minImage forState:UIControlStateNormal];
    [sliderReturnInvestasi setMaximumTrackImage:maxImage forState:UIControlStateNormal];
    

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
-(IBAction)slide {
	[self.sidePanelController showLeftPanel:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)sliderchange:(id)sender
{
    
    NSNumber *slidevalue = [[NSNumber alloc] initWithFloat:((UISlider*)sender).value];
    
    switch ([(UISlider*)sender tag]) {
        case 1:
            labelTingkatInflasi.text = [NSString stringWithFormat:@"%d", [slidevalue intValue]];
            break;
        case 2:
            labelReturnInvestasi.text = [NSString stringWithFormat:@"%d", [slidevalue intValue]];
            break;
            
    }
    
    ((UISlider*)sender).value = [slidevalue intValue];
}

- (IBAction)back{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"closefader" object:self];
    [self.view removeFromSuperview];
    
}

- (IBAction)hitung:(id)sender
{
    
    NSString *targetInvestasi = teksTargetNilaInvestasi.text;
    NSString *jangkawaktu = teksJangkaWaktu.text;
    CGFloat strFloat = (CGFloat)[jangkawaktu floatValue];
    CGFloat strTargetInvestasi = (CGFloat)[targetInvestasi floatValue];
    float slidetingkatinvestasiplussatu= 1 + [sliderTingkatInflasi value] /100;
    float slidereturninvestasiplussatu = 1 + [sliderReturnInvestasi value] /100;
    
    float targetinvestasiakhir = pow(slidetingkatinvestasiplussatu,strFloat) * strTargetInvestasi;
    
    
    float hasilinvestasisaatini = targetinvestasiakhir/pow(slidereturninvestasiplussatu,strFloat);
    NSLog(@"hasil investasi saat ini %f",hasilinvestasisaatini);
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle: NSNumberFormatterDecimalStyle];
    [numberFormatter setMaximumFractionDigits:2];

    NSString *numberAsString = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:targetinvestasiakhir]];

    hasilInvestasiAkhir.text = numberAsString;
    

    NSString *numberAsString2 = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:hasilinvestasisaatini]];
    
    hasilInvestasiSaatIni.text = numberAsString2;
        
    
}

@end
