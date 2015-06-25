//
//  CLeftMenuViewController.h
//  FSGame
//
//  Created by cheng jia on 15/5/11.
//  Copyright (c) 2015年 cheng jia. All rights reserved.
//

#import "CBaseViewController.h"

@interface CLeftMenuViewController : CBaseViewController
{
    UIImageView *avatarView;
    UILabel *userName;
    
    UITableView *menus;
    NSArray *items;
    NSArray *images;
}
@end
