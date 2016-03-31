//
//  YogaSet.m
//  kundalini
//
//  Created by Christian Andersen on 10/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "YogaSet.h"

@implementation YogaSet
@synthesize Id, Title, Thumbnail, Info;
@synthesize Submenu_PracticeArr;
@synthesize KeywordArr;

- (id)init
{
    if ((self = [super init])) {
        self.Submenu_PracticeArr = [[NSMutableArray alloc] init];
        self.KeywordArr = [[NSMutableArray alloc] init];
        self.Id =@"";
        self.Info=@"";
        self.Thumbnail=@"";
        self.Title=@"";

    }
    return self;
}

@end
