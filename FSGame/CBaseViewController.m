//
//  CBaseViewController.m
//  FSGame
//
//  Created by cheng jia on 15/5/11.
//  Copyright (c) 2015年 cheng jia. All rights reserved.
//

#import "CBaseViewController.h"

@interface CBaseViewController ()
{
    UILabel *titleLabel;
}
@end

@implementation CBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.translucent=false;
    
    titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WidthScale(100), 30)];
    titleLabel.text=@"";
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.font=[UIFont boldSystemFontOfSize:TSIZE2];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    self.navigationItem.titleView=titleLabel;
    
    self.title=@"";
}
-(void)setNavigationTitle:(NSString *)title
{
    titleLabel.text=title;
}
- (void)didReceiveMemoryWarning
{
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
