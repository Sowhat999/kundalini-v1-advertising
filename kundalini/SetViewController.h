//
//  SetViewController.h
//  kundalini
//
//  Created by Christian Andersen on 17/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YogaMenu.h"
#import "PracticeDetailedViewController.h"
#import "PracticeViewController.h"
#import "SetCell.h"
#import "MyPlayerManager.h"
#import <iAd/iAd.h>



@interface SetViewController : UITableViewController<ADBannerViewDelegate>{
    YogaMenu *ym;
    NSMutableArray *a;
    UIButton *ButMusic;
}
@property (nonatomic, strong) YogaMenu *ym;
@property (nonatomic, strong) NSMutableArray *a;
- (id)initWithMenu:(YogaMenu *) ym menuitem:(int)mi_id;

@end
