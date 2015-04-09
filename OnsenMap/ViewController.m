//
//  ViewController.m
//  OnsenMap
//
//  Created by 星野嵩夫 on 2015/03/25.
//  Copyright (c) 2015年 星野嵩夫. All rights reserved.
//

#import "ViewController.h"
#import "DetailView.h"
#import "SearchResultController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *MytableView;

@property (strong,nonatomic) NSMutableArray *searchData;

@property (strong,nonatomic) UISearchController *searchController;

@property (strong,nonatomic) NSMutableArray *inf;

@property (strong,nonatomic) SearchResultController *searchResult;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSBundle *bundle=[NSBundle mainBundle];
    NSString *path=[bundle pathForResource:@"onsenPlist" ofType:@"plist"];
    NSMutableDictionary *dic1=[[NSMutableDictionary alloc]init];
    dic1=[[NSMutableDictionary dictionaryWithContentsOfFile:path]mutableCopy];
    //_searchData=[[NSMutableArray alloc]init];
    _inf=[NSMutableArray arrayWithCapacity:100];
    _inf=[dic1 objectForKey:@"place"];
    
   
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _searchResult=[sb instantiateViewControllerWithIdentifier:@"SearchResultController"];
    _searchResult.allData=_inf;
    
    _searchController=[[UISearchController alloc]initWithSearchResultsController:_searchResult];
    _searchController.searchBar.frame=CGRectMake(0, 0, self.view.bounds.size.width, 44);
    _searchController.searchBar.returnKeyType=UIReturnKeyDone;
    _searchController.searchBar.placeholder=@"Search";
    _searchController.searchBar.delegate=self;
    
    [_MytableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    _MytableView.dataSource=self;
    _MytableView.delegate=self;
    _MytableView.tableHeaderView=_searchController.searchBar;
    
    
    //_searchData=[NSMutableArray arrayWithCapacity:_inf.count];
    
    
//    UISearchBar *bar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
//    bar.delegate=self;
//    bar.searchResultsButtonSelected=self;
//
//self.MytableView.tableHeaderView=bar;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
        return _inf.count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"Cell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        
    }
    
    
        cell.textLabel.text=_inf[indexPath.row][@"NAME"];

    return cell;}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    DetailView *detail=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailView"];
    
    detail.selectNum=(int)indexPath.row;
    
    detail.arpic=_inf[indexPath.row][@"image"];
    
    detail.PlaceList=_inf[indexPath.row][@"Location"];
   
    [[self navigationController]pushViewController:detail animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

//-(void)filterContentForSearchText:(NSString *)searchString scope:(NSString *)scope{
//    [_searchData removeAllObjects];
//    
//    for(NSString *label in _inf){
//    
//        NSRange range=[label rangeOfString:searchString options:NSCaseInsensitiveSearch];
//    
//        if(range.length>0){
//        
//        [_searchData addObject:label];
//        
//        
//        }
//    
//    }
//
//}


-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
   // [_searchResult query:searchText];
  

}


//
//-(void)searchBarSearchButtonClicked:(UISearchBar *)bar{
// 
//    NSLog(@"tap");
//    
//    
//
//}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
