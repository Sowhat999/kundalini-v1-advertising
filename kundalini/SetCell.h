//
//  SetCell.h
//  kundalini
//
//  Created by Christian Andersen on 04/09/12.
//
//

#import <UIKit/UIKit.h>

@interface SetCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UIButton *infobut;
- (IBAction)info:(id)sender;

@end
