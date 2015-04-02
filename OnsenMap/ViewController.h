//
//  ViewController.h
//  OnsenMap
//
//  Created by 星野嵩夫 on 2015/03/25.
//  Copyright (c) 2015年 星野嵩夫. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{NSArray *inf;}
@property (weak, nonatomic) IBOutlet UITableView *MytableView;


@end

