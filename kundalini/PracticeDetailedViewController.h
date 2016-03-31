//
//  PracticeDetailedViewController.h
//  kundalini
//
//  Created by Christian Andersen on 23/08/12.
//
//

#import <UIKit/UIKit.h>
#import "YogaPractice.h"
#import "YogaSet.h"
#import "GLTapLabelDelegate.h"
#import "GLTapLabel.h"
#import "YogaMenu.h"
#import "PracticeViewController.h"




@interface PracticeDetailedViewController : UIViewController <GLTapLabelDelegate>
{
        YogaPractice *yogap;
        YogaSet *yogas;
}
@property (nonatomic, strong) YogaPractice *yogap;
@property (nonatomic, strong) YogaSet *yogas;

@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UIScrollView *scroller;
@property (weak, nonatomic) IBOutlet UITextView *text;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, strong) YogaMenu *ym; 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil practice:(YogaPractice *) yp yogam:(YogaMenu *) yogam;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil yogaset:(YogaSet *) ys yogam:(YogaMenu *) yogam;

@end
