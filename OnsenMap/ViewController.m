//
//  ViewController.m
//  OnsenMap
//
//  Created by 星野嵩夫 on 2015/03/25.
//  Copyright (c) 2015年 星野嵩夫. All rights reserved.
//

#import "ViewController.h"
#import "DetailView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSBundle *bundle=[NSBundle mainBundle];
    
    NSString *path=[bundle pathForResource:@"onsenPlist" ofType:@"plist"];
    
    NSMutableDictionary *dic1=[[NSMutableDictionary alloc]init];
    
//    NSDictionary *dic=[NSDictionary dictionaryWithContentsOfFile:path];

    dic1=[[NSMutableDictionary dictionaryWithContentsOfFile:path]mutableCopy];
    
    inf=[[NSArray alloc]init];
    
    inf=[dic1 objectForKey:@"place"];
    
    
    self.MytableView.delegate=self;
    self.MytableView.dataSource=self;
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return inf.count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"Cell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text=inf[indexPath.row][@"NAME"];

    return cell;}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    DetailView *detail=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailView"];
    
    detail.selectNum=(int)indexPath.row;
    
    detail.arpic=inf[indexPath.row][@"image"];
    
    detail.PlaceList=inf[indexPath.row][@"Location"];
   
    [[self navigationController]pushViewController:detail animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
