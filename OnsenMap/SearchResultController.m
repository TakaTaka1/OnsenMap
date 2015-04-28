//
//  SearchResultController.m
//  OnsenMap
//
//  Created by 星野嵩夫 on 2015/04/09.
//  Copyright (c) 2015年 星野嵩夫. All rights reserved.
//

#import "SearchResultController.h"
#import "ViewController.h"
#import "DetailView.h"

@interface SearchResultController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTable;

@property (strong,nonatomic) UINavigationController *nav;

@property (nonatomic, retain) UIWindow *window;


@end

@implementation SearchResultController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _searchedResult=[NSMutableArray arrayWithCapacity:100];
    

    
    [_myTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    _myTable.dataSource=self;
    _myTable.delegate=self;
    //self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    _nav=[[UINavigationController alloc]initWithRootViewController:self];
    
    [self.window addSubview:_nav.view];
    [self.window makeKeyAndVisible];
//    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return  _searchedResult.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    NSString *row=[_searchedResult objectAtIndex:indexPath.row];
    UITableViewCell *cell=[_myTable dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text=row;
    return cell;


}


-(void)query:(NSString *)query{
    
    NSLog(@"tap");
    
    [_searchedResult removeAllObjects];
    
    /////////エラー箇所　NSString型からNSDictionary型に
    for (NSDictionary *Result in _allData) {
        NSRange range=[Result[@"NAME"] rangeOfString:query];
        
        if (range.location !=NSNotFound) {
            [_searchedResult addObject:Result[@"NAME"]];
            
        }
        
    }
    
    [_myTable reloadData];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//  
//    DetailView *detail2=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailView"];
//    detail2.arpic=_allData[indexPath.row][@"image"];
//    detail2.PlaceList=_allData[indexPath.row][@"Location"];
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    [[self navigationController]pushViewController:detail2 animated:YES];
//
    
    
    //値が渡らず　
    [self performSegueWithIdentifier:@"hoge" sender:self];


    NSLog(@"tap");
  
   
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

   // DetailView *detail2=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailView"];
    
    //detail2.PlaceList=[self.myTable indexPathForSelectedRow].row;
    
    
    
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
