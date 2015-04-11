//
//  DetailView.m
//  OnsenMap
//
//  Created by 星野嵩夫 on 2015/04/01.
//  Copyright (c) 2015年 星野嵩夫. All rights reserved.
//

#import "DetailView.h"
#import "ViewController.h"
#import "SearchResultController.h"

@interface DetailView ()

@end

@implementation DetailView


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    self.MyLabel.text=[NSString stringWithFormat:@"%@",self.PlaceList];
    
    
    //配列を渡している訳では、なく文字列を渡しているのでこの記述
    self.MyPic.image=[UIImage imageNamed:_arpic];
    
    UIButton *btn=[[UIButton alloc]init];
    
    btn.frame=CGRectMake(190, 510, 60, 60);
    
    
    UIImage *btn_1=[UIImage imageNamed:@"oomoriyu.jpg"];
    
    [btn setBackgroundImage:btn_1 forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(pushed_btn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
}



-(void)pushed_btn: (id)sender{
    
    
    NSLog(@"tap");
    
    
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
