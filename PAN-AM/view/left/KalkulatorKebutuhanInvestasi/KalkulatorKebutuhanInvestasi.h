//
//  KalkulatorKebutuhanInvestasi.h
//  PAM-Guide
//
//  Created by Dave Harry on 4/17/13.
//  Copyright (c) 2013 Dave Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KalkulatorKebutuhanInvestasi : UIViewController
{
    IBOutlet UILabel *labelTingkatInflasi;
    IBOutlet UILabel *labelReturnInvestasi;
    
    IBOutlet UILabel *hasilInvestasiAkhir;
    IBOutlet UILabel *hasilInvestasiSaatIni;
    
    IBOutlet UISlider *sliderTingkatInflasi;
    IBOutlet UISlider *sliderReturnInvestasi;
    IBOutlet UITextField *teksTargetNilaInvestasi;
    IBOutlet UITextField *teksJangkaWaktu;

}

@end
