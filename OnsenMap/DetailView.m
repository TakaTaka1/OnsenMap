//
//  DetailView.m
//  OnsenMap
//
//  Created by 星野嵩夫 on 2015/04/01.
//  Copyright (c) 2015年 星野嵩夫. All rights reserved.
//

#import "DetailView.h"
#import "ViewController.h"

@interface DetailView ()

@end

@implementation DetailView

-(void)viewWillAppear:(BOOL)animated{

   
    self.MyPic.image=[UIImage imageNamed:_arpic];
    



}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    self.MyLabel.text=[NSString stringWithFormat:@"%@",self.PlaceList];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
