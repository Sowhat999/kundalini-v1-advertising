//
//  YogaPractice.m
//  kundalini
//
//  Created by Christian Andersen on 10/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "YogaPractice.h"

@implementation YogaPractice
@synthesize Id, Title, Info,Thumbnail,Movieurl,Moviestart,Moviestop,Sound;
@synthesize Snapshot, Recommendtime, KeywordArr;

- (id)init
{
    if ((self = [super init])) {
        self.Id =@"";
        self.Info=@"";
        self.Moviestart=-1;
        self.Moviestop=-1;
        self.Movieurl =@"";
        self.Snapshot=-1;
        self.Sound = FALSE;
        self.Thumbnail=@"";
        self.KeywordArr = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString *) GetMovieLength
{
    int total = self.Moviestop - self.Moviestart;
    if (total <=0)
        return @"Invalid movielength value";
    
    int minutes = total / 60;
    
    if (minutes >0)
    {   int seconds = total % 60;
        if (seconds > 0)
            return [NSString stringWithFormat:@"%d:%.02d min", minutes, seconds];
        else
            return [NSString stringWithFormat:@"%d min", minutes]; 
    }
    else
        return [NSString stringWithFormat:@"%d sec", total];
    
}





@end
