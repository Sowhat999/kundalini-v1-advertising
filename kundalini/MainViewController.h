//
//  ViewController.h
//  kundalini
//
//  Created by Christian Andersen on 23/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyImageView.h"
#import "YogaMenu.h"
#import "SetViewController.h"
#import "globals.h"
#import "AboutViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "MyPlayerManager.h"


@interface MainViewController : UIViewController
{
    
    IBOutlet MyImageView *YogaPasImageView;
    IBOutlet UIImageView *ImageViewYogaPas;
    YogaMenu *ym;
    BOOL dispatchrunning;
    dispatch_queue_t serielqueue;
    MyMusicPlayerManager *sharedManager;
    
}
@property (strong, nonatomic) IBOutlet UIView *portrait;
@property (strong, nonatomic) IBOutlet UIView *landscape;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *ButSpeak;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *WarmUpBut;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *AboutBut;



- (IBAction)Showabout:(id)sender;
- (IBAction)musicstate:(id)sender;


@property (nonatomic,retain) IBOutlet UIImageView *ImageViewYogaPas;
@property (nonatomic, strong) YogaMenu *ym;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
- (IBAction)Showmeditation:(id)sender;
- (IBAction)Showwarmup:(id)sender;

-(IBAction)ShowYogapas:(id)sender;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil menu:(YogaMenu *) ym;
- (void) LaunchNewWindow:(int) launch;
-(void) ChangeSpeakImage;

@end
