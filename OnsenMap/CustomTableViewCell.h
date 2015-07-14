//
//  CustomTableViewCell.h
//  OnsenMap
//
//  Created by 星野嵩夫 on 2015/06/13.
//  Copyright (c) 2015年 星野嵩夫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *MyLabel;

+(CGFloat)rowHeight;


@end
