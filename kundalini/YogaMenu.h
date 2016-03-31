//
//  YogaMenu.h
//  kundalini
//
//  Created by Christian Andersen on 10/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuItem.h"
#import "YogaSet.h"
#import "YogaPractice.h"
#import "XmlElement.h"
#import "SubMenu.h"
#import "globals.h"
#import "Keyword.h"


@interface YogaMenu : NSObject  <NSXMLParserDelegate>
{
    BOOL _startMenu;
    BOOL _startYogaSet;
    BOOL _startPractice;
    NSMutableArray *MenulinesArr;
    
}

@property (nonatomic, strong) NSString *FileName;
@property (nonatomic, strong) XMLElement *MenuXml;

@property (strong, nonatomic) NSMutableArray *MenulinesArr;

- (id)initWithXML:(XMLElement *) startelement;
-(void) BuildYogaMenu:(XMLElement *) start MenuObj:(id) menuObj;
-(MenuType)GetMenuType:(int) menuid;


@end
