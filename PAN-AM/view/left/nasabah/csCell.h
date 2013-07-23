//
//  csCell.h
//  PAN-AM
//
//  Created by Arie on 7/22/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface csCell : UITableViewCell
@property (nonatomic, retain) UILabel * fundname;
@property (nonatomic, retain) UILabel * unit;
@property (nonatomic, retain) UILabel * averageNAv;
@property (nonatomic, retain) UILabel * closingNAV;
@property (nonatomic, retain) UILabel * fundValue;
@property (nonatomic, retain) UILabel * marketValue;
@property (nonatomic, retain) UILabel * gainOrLost;
@property (nonatomic, retain) UILabel * gainOrLostPercentage;
@property (nonatomic, retain) UILabel * custodianID;
@property (nonatomic, retain) UILabel * Currency;
@property (nonatomic, retain) UILabel * CurrencyIDR;

@end
