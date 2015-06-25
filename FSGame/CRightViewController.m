//
//  CRightViewController.m
//  FSGame
//
//  Created by 程 佳 on 15/6/20.
//  Copyright (c) 2015年 cheng jia. All rights reserved.
//

#import "CRightViewController.h"
#import "CPopMenuView.h"
@interface CRightViewController ()<CPopMenuViewDelegate>
{
    CPopMenuView *menus;
}
@end

@implementation CRightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *header=[[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 64.5)];
    header.backgroundColor=Nav_Color;
    [self.view addSubview:header];
    self.view.backgroundColor=Light_Gray_Color;
    
    UILabel *title=[[UILabel alloc]initWithFrame:CGRectMake(DEVICEWIDTH*0.6, 20, DEVICEWIDTH*0.4, 44)];
    title.text=@"Categories";
    title.textColor=[UIColor whiteColor];
    title.textAlignment=NSTextAlignmentCenter;
    title.font=[UIFont systemFontOfSize:TSIZE3];
    [self.view addSubview:title];
    
    MenuItem *item1=[[MenuItem alloc]init:@"Jump"];
    item1.isSelected=true;
    MenuItem *item2=[[MenuItem alloc]init:@"Spin"];
    MenuItem *item3=[[MenuItem alloc]init:@"Step"];
    MenuItem *item4=[[MenuItem alloc]init:@"Throw"];
    MenuItem *item5=[[MenuItem alloc]init:@"Lift"];
    MenuItem *item6=[[MenuItem alloc]init:@"Twist"];
    MenuItem *item7=[[MenuItem alloc]init:@"Death Spiral"];
    
    menus=[[CPopMenuView alloc]initWithFrame:CGRectMake(DEVICEWIDTH*0.6, 64.5,DEVICEWIDTH*0.4, DEVICEHIGHT-64.5) items:@[item1,item2,item3,item4,item5,item6,item7]];
    menus.delegate=self;
    [self.view addSubview:menus];
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
-(void)menuItemSelected:(NSInteger)index
{
    NSLog(@"%d",index);
}

@end
