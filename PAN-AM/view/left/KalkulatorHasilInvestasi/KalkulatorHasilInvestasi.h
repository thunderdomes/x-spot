//
//  KalkulatorHasilInvestasi.h
//  PAM-Guide
//
//  Created by Dave Harry on 4/26/13.
//  Copyright (c) 2013 Dave Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KalkulatorHasilInvestasi : UIViewController<UITextFieldDelegate>{

    IBOutlet UILabel *labelTingkatInflasi;
    IBOutlet UITextField *teksNilaiInvestasi;
    IBOutlet UITextField *teksJangkaWaktu;
    IBOutlet UISlider *sliderTingkatInflasi;
     IBOutlet UISlider *asumsiTingkatInflasi;
     IBOutlet UILabel *perkiraanHasilInvestasi;
    IBOutlet UILabel *asumsiHasilInvestasi;

}
@end
