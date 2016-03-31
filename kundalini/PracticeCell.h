//
//  PracticeCell.h
//  kundalini
//
//  Created by Christian Andersen on 01/09/12.
//
//

#import <UIKit/UIKit.h>
#import "PracticeCell.h"
#import "YogaPractice.h"
#import <MediaPlayer/MediaPlayer.h>



@interface PracticeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *length;
@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UILabel *recommenedtime;
@property (weak, nonatomic) IBOutlet UIButton *infobut;
@property (weak, nonatomic) IBOutlet UIButton *playbut;
@property (weak, nonatomic) IBOutlet UIButton *repeatbut;
@property (weak, nonatomic) IBOutlet UITextView *description;

@end
