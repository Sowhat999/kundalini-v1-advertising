//
//  YogaPractice.h
//  kundalini
//
//  Created by Christian Andersen on 10/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YogaPractice : NSObject {
    NSString *Id;
    NSString *Title;
    NSString *Info;
    NSString *Thumbnail;
    NSString *Movieurl;
    float Moviestart;
    float Moviestop;
    BOOL Sound;
    float Snapshot;
    NSString *Recommmendtime;
    NSMutableArray *KeywordArr;
}
@property (nonatomic, strong) NSString *Id;
@property (nonatomic,strong ) NSString *Title;
@property (nonatomic,strong ) NSString *Info;
@property (nonatomic,strong) NSString *Thumbnail;
@property (nonatomic, strong) NSString *Movieurl;
@property (nonatomic, strong) NSString *Recommendtime;
@property (nonatomic) float Moviestart;
@property (nonatomic) float Moviestop;
@property (nonatomic) BOOL Sound;
@property (nonatomic) float Snapshot;
@property (nonatomic, strong) NSMutableArray *KeywordArr;
- (NSString *)GetMovieLength;

@end
