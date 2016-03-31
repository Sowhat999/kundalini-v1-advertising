//
//  PracticeCell.m
//  kundalini
//
//  Created by Christian Andersen on 01/09/12.
//
//

#import "PracticeCell.h"

@implementation PracticeCell
@synthesize title;
@synthesize length;
@synthesize picture;
@synthesize recommenedtime;
@synthesize description;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
