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

#import "CustomTableViewCell.h"
#import "const.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchControllerDelegate>

{
    BOOL flag;
    
}



@property (weak, nonatomic) IBOutlet UITableView *MytableView;

@property (strong,nonatomic) NSMutableArray *searchData;

@property (strong,nonatomic) UISearchController *searchController;

//@property (strong,nonatomic) NSMutableArray *inf;

@property (strong,nonatomic) SearchResultController *searchResult;

@property (strong,nonatomic) NSMutableDictionary *dic1;

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
 
    flag=YES;
    
    if (flag) {
        
    
        self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.000 green:3.000 blue:0.000 alpha:1.000];

    

    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //CustomCell作成
    UINib *nib=[UINib nibWithNibName:Empty bundle:nil];
    [self.MytableView registerNib:nib forCellReuseIdentifier:@"Cell"];
    
    
    
    
    UIColor *tableBackGround=[UIColor blackColor];
    tableBackGround=[tableBackGround colorWithAlphaComponent:0.5];
    
    [_MytableView setBackgroundColor:tableBackGround];
    
    
    
    
    NSBundle *bundle=[NSBundle mainBundle];
    NSString *path=[bundle pathForResource:@"onsenPlist" ofType:@"plist"];
    _dic1=[[NSMutableDictionary dictionaryWithContentsOfFile:path]mutableCopy];
    //_searchData=[[NSMutableArray alloc]init];
    //_inf=[NSMutableArray arrayWithCapacity:100];
    _inf=[_dic1 objectForKey:@"place"];
    
    
    
    ///////////storyboardからViewを取得　 _infのデータを_searchResult.alldataに渡す
     ////この渡し方が間違っている？
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _searchResult=[sb instantiateViewControllerWithIdentifier:@"SearchResultController"];
    _searchResult.allData= _inf;
    
    
    ///////////searchbarの実装 searchControllerを生成
   
    _searchController.searchBar.delegate=self;
    _searchController=[[UISearchController alloc]initWithSearchResultsController:_searchResult];
    _searchController.searchBar.frame=CGRectMake(0, 0, self.view.bounds.size.width, 44);
    
    
    _searchController.searchBar.tintColor=[UIColor greenColor];
    _searchController.searchBar.barStyle=UIBarStyleDefault;
    _searchController.searchBar.returnKeyType=UIReturnKeyDone;
    _searchController.searchBar.placeholder=@"Search";
    
    
    UIImage *img=[UIImage imageNamed:@"OnsenIcon.jpg"];
    
    _MytableView.backgroundView=[[UIImageView alloc]initWithImage:img];
    
    
    
    
    
    
    //[_MytableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    _MytableView.dataSource=self;
    _MytableView.delegate=self;
    _MytableView.tableHeaderView=_searchController.searchBar;
    
    
   
    
    
  
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
        return _inf.count;
    
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    
    [_searchResult query:searchText];
    
    
    
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //static NSString *cellIdentifier=@"Cell";
    
    static NSString *const Empty=@"Cell";
    
    
    
    CustomTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:Empty];
    
//    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
//   if(cell==nil){
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//        
//    }
//    
//    cell.textLabel.text=_inf[indexPath.row][@"NAME"];
    
    [cell setBackgroundColor:[UIColor clearColor]];
    
    
    
    cell.MyLabel.text=[NSString stringWithFormat:@"%@",_inf[indexPath.row][@"NAME"]];
    
    
    
    
    
    return cell;}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    DetailView *detail=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailView"];
    //detail.selectNum=(int)indexPath.row;
    detail.arpic=_inf[indexPath.row][@"image"];
    detail.PlaceList=_inf[indexPath.row][@"Location"];
    [[self navigationController]pushViewController:detail animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
  
    
    
}





//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    cell.backgroundColor = [UIColor colorWithHue:0.61 saturation:0.09 brightness:0.99 alpha:1.0];
//
//
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [CustomTableViewCell rowHeight];
    
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
