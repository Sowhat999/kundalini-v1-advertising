//
//  YogaSet.h
//  kundalini
//
//  Created by Christian Andersen on 10/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YogaSet : NSObject {
    NSString *Id;
    NSString *Title;
    NSString *Info;
    NSString *Thumbnail;
    NSMutableArray *Submenu_PracticeArr;
    NSMutableArray *KeywordArr;
}

@property (nonatomic, strong) NSString *Id;
@property (nonatomic,strong ) NSString *Title;
@property (nonatomic,strong ) NSString *Info;
@property (nonatomic,strong) NSString *Thumbnail;
@property (nonatomic, strong) NSMutableArray *Submenu_PracticeArr;
@property (nonatomic, strong) NSMutableArray *KeywordArr;


@end
