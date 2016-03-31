//
//  SubMenu.m
//  kundalini
//
//  Created by Christian Andersen on 16/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SubMenu.h"

@implementation SubMenu
@synthesize Id;
@synthesize Title;
@synthesize MenuItemArr;

- (id)init
{
    if ((self = [super init])) {
        self.MenuItemArr = [[NSMutableArray alloc] init];        
    }
    return self;
}

@end
