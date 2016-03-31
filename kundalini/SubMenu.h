//
//  SubMenu.h
//  kundalini
//
//  Created by Christian Andersen on 16/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubMenu : NSObject {
    NSString *Id;
    NSString *Title;
    NSMutableArray *MenuItemArr;     
}

@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *Title;
@property (nonatomic, strong) NSMutableArray *MenuItemArr;


@end
