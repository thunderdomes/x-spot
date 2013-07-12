//
//  ProductPrima.m
//  PAM-Guide
//
//  Created by Panin Sekuritas 2 on 6/20/13.
//  Copyright (c) 2013 Dave Harry. All rights reserved.
//

#import "ProductUtamaPlus2.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

@interface ProductUtamaPlus2 ()

@end

@implementation ProductUtamaPlus2

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
    scrollBankKustodi.hidden = YES;
    scrollBiaya.hidden = YES;
    scrollKarakteristik.hidden = YES;
    scrollKinerja.hidden = YES;
    scrollPengharagaan.hidden = YES;
    scrollRingkasan.hidden = NO;
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.panin-am.co.id:800/json.aspx"]];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    
    [request setRequestMethod:@"POST"];
    [request addRequestHeader:@"Accept" value:@"application/json"];
    [request addRequestHeader:@"content-type" value:@"application/x-www-form-urlencoded"];
    
    
    [request setDelegate:self];
    [request startAsynchronous];

}

-(IBAction)slide {
    
	[self.sidePanelController showLeftPanel:YES];
}


- (void)requestFinished:(ASIFormDataRequest *)request
{
    
    NSString *responseString = [request responseString];
    NSLog(@"hasil response :%@",responseString);
    
    
    NSData *responseData = [request responseData];
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData //1
                          
                          options:kNilOptions
                          error:&error];
    
    NSArray *saldo = [json objectForKey:@"products"]; //2
    NSLog(@"Saldo :%d",saldo.count);
    
    NSDictionary *tempDict = [saldo objectAtIndex:9];
    NAB.text = [[tempDict objectForKey:@"NABValue"]stringValue];
    
    
    perubahanPercent.text = [[tempDict objectForKey:@"OneD"]stringValue];
    NSString *oneDV = [[tempDict objectForKey:@"OneDV"]stringValue];
    
    CGFloat strFloat1 = (CGFloat)[NAB.text floatValue];
    CGFloat strFloat2 = (CGFloat)[oneDV floatValue];
    float harian = strFloat1-strFloat2;
    perubahanRP.text = [NSString stringWithFormat:@"%2.2f",harian];
    
    NAB.text  = [NSString stringWithFormat:@"%.02f", strFloat1];
    
    if([perubahanPercent.text hasPrefix:@"-"] && [perubahanRP.text hasPrefix:@"-"] )  {
        perubahanPercent.textColor = [UIColor redColor];
        backIndex.image = [UIImage imageNamed:@"pam-ipad-down-13x11.png"];
        perubahanRP.textColor = [UIColor redColor];
    } else {
        perubahanPercent.textColor = [UIColor greenColor];
        perubahanRP.textColor = [UIColor greenColor];
        backIndex.image = [UIImage imageNamed:@"pam-ipad-up-13x11.png"];
    }

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openSub:(id)sender
{
    switch ([(UIButton*)sender tag]) {
        case 1:scrollRingkasan.hidden = NO;
            scrollBankKustodi.hidden = YES;
            scrollBiaya.hidden = YES;
            scrollKarakteristik.hidden = YES;
            scrollKinerja.hidden = YES;
            scrollPengharagaan.hidden = YES;
            break;
        case 2:scrollKinerja.hidden = NO;
            scrollBankKustodi.hidden = YES;
            scrollBiaya.hidden = YES;
            scrollKarakteristik.hidden = YES;
            scrollPengharagaan.hidden = YES;
            scrollRingkasan.hidden = YES;
            break;
        case 3:scrollBiaya.hidden = NO;
            scrollBankKustodi.hidden = YES;
            scrollKarakteristik.hidden = YES;
            scrollKinerja.hidden = YES;
            scrollPengharagaan.hidden = YES;
            scrollRingkasan.hidden = YES;
            break;
        case 4:scrollBankKustodi.hidden = NO;
            scrollBiaya.hidden = YES;
            scrollKarakteristik.hidden = YES;
            scrollKinerja.hidden = YES;
            scrollPengharagaan.hidden = YES;
            scrollRingkasan.hidden = YES;
            break;
        case 5:scrollPengharagaan.hidden = NO;
            scrollBankKustodi.hidden = YES;
            scrollBiaya.hidden = YES;
            scrollKarakteristik.hidden = YES;
            scrollKinerja.hidden = YES;
            scrollRingkasan.hidden = YES;
            break;
        case 6:scrollKarakteristik.hidden = NO;
            scrollBankKustodi.hidden = YES;
            scrollBiaya.hidden = YES;
            scrollKinerja.hidden = YES;
            scrollPengharagaan.hidden = YES;
            scrollRingkasan.hidden = YES;
            break;
    }
}
@end
