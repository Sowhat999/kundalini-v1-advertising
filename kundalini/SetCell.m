//
//  SetCell.m
//  kundalini
//
//  Created by Christian Andersen on 04/09/12.
//
//

#import "SetCell.h"

@implementation SetCell
@synthesize title;
@synthesize picture;

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

- (IBAction)info:(id)sender {
}
@end
