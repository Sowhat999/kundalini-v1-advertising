//
//  MenuItem.h
//  kundalini
//
//  Created by Christian Andersen on 10/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItem : NSObject
{
    NSString *Id;
    NSString *Title;
    NSMutableArray *Submenu_Set_PractizeArr; 
}
@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *Title;
@property (nonatomic, strong) NSMutableArray *Submenu_Set_PractizeArr;
@end
