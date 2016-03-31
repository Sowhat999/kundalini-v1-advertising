//
//  PracticeViewController.h
//  kundalini
//
//  Created by Christian Andersen on 17/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YogaMenu.h"
#import "YogaSet.h"
#import "PracticeDetailedViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "PracticeCell.h"
#import "MyPlayerManager.h"
#import "MoviePlayerViewController.h"
#import <AVKit/AVKit.h> 
#import <iAd/iAd.h>


@interface PracticeViewController : UITableViewController<ADBannerViewDelegate>
{
    NSMutableArray *practicearray;
    NSMutableArray *requestThumbnail;
    NSMutableArray *imagesarr;

    AVPlayerViewController *avmovieplayer;
    UIButton *ButMusic;
}
@property (nonatomic, strong) YogaMenu *yogam;
@property (retain) AVPlayerViewController *avmovieplayer;
- (id)initWithMenu:(MenuItem *) ym yogam:(YogaMenu *) yogame;
- (id)initWithSet:(YogaSet *) ys yogam:(YogaMenu *) yogame;


@end
