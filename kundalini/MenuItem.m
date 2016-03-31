//
//  MenuItem.m
//  kundalini
//
//  Created by Christian Andersen on 10/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem
@synthesize Id;
@synthesize Title;
@synthesize Submenu_Set_PractizeArr;

- (id)init
{
    if ((self = [super init])) {
        self.Submenu_Set_PractizeArr = [[NSMutableArray alloc] init];        
    }
    return self;
}
@end
