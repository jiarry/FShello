//
//  CLeftMenuViewController.m
//  FSGame
//
//  Created by cheng jia on 15/5/11.
//  Copyright (c) 2015年 cheng jia. All rights reserved.
//

#import "CLeftMenuViewController.h"
#import "CUserViewController.h"
#import "SlideNavigationController.h"
#import "CCertificateController.h"
@interface CLeftMenuViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CLeftMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    
    UIView *header=[[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH*0.4, 64.5)];
    header.backgroundColor=Nav_Color;
    [self.view addSubview:header];
    self.view.backgroundColor=Light_Gray_Color;
    
    avatarView=[[UIImageView alloc]initWithFrame:CGRectMake(10,27, 30,30)];
    avatarView.image=[UIImage imageNamed:@"profile"];
    avatarView.layer.cornerRadius=15;
    avatarView.layer.masksToBounds=true;
    [header addSubview:avatarView];
    
    userName=[[UILabel alloc]initWithFrame:CGRectMake(50, 27, DEVICEWIDTH*0.4-60, 30)];
    userName.textColor=[UIColor whiteColor];
    userName.font=[UIFont systemFontOfSize:TSIZE2];
    userName.text=@"visitor";
    userName.numberOfLines=0;
    [header addSubview:userName];
    //不同等级的裁判只能打对应级别的分数
    items=@[@"SOV",@"Certification",@"Statistics",@"Marking"];
    
    menus=[[UITableView alloc]initWithFrame:CGRectMake(0, 64.5, DEVICEWIDTH*0.4, HeightScale(44)*items.count)];
    menus.scrollEnabled=false;
    menus.backgroundColor=[UIColor whiteColor];
    menus.delegate=self;
    menus.dataSource=self;
    menus.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:menus];
    
    images=@[@"ic_sov",@"ic_certificate",@"ic_stastic",@"ic_marking"];
    
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(DEVICEWIDTH*0.4-0.5, 64.5, 1, DEVICEHIGHT-64.5)];
    line.backgroundColor=Middle_Gray_Color;//[UIColor lightGrayColor];
    [self.view addSubview:line];
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showUser)];
    [header addGestureRecognizer:tap];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return items.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HeightScale(44);
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
    
    UIImageView *imgview=[[UIImageView alloc]initWithFrame:CGRectMake(10, HeightScale(22)-10, 20, 20)];
    imgview.image=[UIImage imageNamed:images[indexPath.row]];
    [cell addSubview:imgview];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(40, HeightScale(22)-10, DEVICEWIDTH*0.4-40, 20)];
    label.text=items[indexPath.row];
    label.font=[UIFont systemFontOfSize:TSIZE3];
    label.textColor=Dark_Gray_Color;
    [cell addSubview:label];
    
    //cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==1)
    {
        CCertificateController *certificate=[[CCertificateController alloc]init];
        [[SlideNavigationController sharedInstance] switchToViewController:certificate withCompletion:nil];

    }
}

-(void)showUser
{
    CUserViewController *userVC=[[CUserViewController alloc]init];
    [[SlideNavigationController sharedInstance] switchToViewController:userVC withCompletion:nil];
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
