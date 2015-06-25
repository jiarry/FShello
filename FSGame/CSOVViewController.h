//
//  CSOVViewController.h
//  FSGame
//
//  Created by cheng jia on 15/5/11.
//  Copyright (c) 2015年 cheng jia. All rights reserved.
//

#import "CBaseViewController.h"

@interface CSOVViewController : CBaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *eleArray;
    UITableView *table;
}

@end
