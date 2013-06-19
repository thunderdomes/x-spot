//
//  newsCell.h
//  PAN-AM
//
//  Created by Arie on 6/19/13.
//  Copyright (c) 2013 vootobox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newsCell : UITableViewCell
{
}

@property(nonatomic,strong) UILabel *title;
@property(nonatomic,strong) UILabel *excerpt;
@property(nonatomic,strong) UILabel *date;

@end
