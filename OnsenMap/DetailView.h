//
//  DetailView.h
//  OnsenMap
//
//  Created by 星野嵩夫 on 2015/04/01.
//  Copyright (c) 2015年 星野嵩夫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailView : UIViewController

@property (nonatomic,strong) NSString *arpic;
@property (nonatomic,assign) int selectNum;
@property (weak, nonatomic) IBOutlet UILabel *MyLabel;
@property (nonatomic,strong) NSString *PlaceList;
@property (weak, nonatomic) IBOutlet UIImageView *MyPic;
@property (nonatomic,strong) NSString *recive;
@end
//add