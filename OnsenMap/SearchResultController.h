//
//  SearchResultController.h
//  OnsenMap
//
//  Created by 星野嵩夫 on 2015/04/09.
//  Copyright (c) 2015年 星野嵩夫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) NSMutableArray *allData;
@property (strong,nonatomic,readonly) NSMutableArray *searchedResult;
-(void)query:(NSString *)query;
@property (strong,nonatomic) NSMutableArray *inf2;


//add

@end
