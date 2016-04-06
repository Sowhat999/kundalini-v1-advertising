//
//  YogaMenu.m
//  kundalini
//
//  Created by Christian Andersen on 10/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "YogaMenu.h"



@implementation YogaMenu
@synthesize MenulinesArr;
@synthesize FileName;
@synthesize MenuXml;




- (id)initWithXML:(XMLElement *) startelement
{
    if ((self = [super init])) {
        _startMenu=FALSE;
        _startYogaSet=FALSE;
        _startPractice=FALSE;
        
         //build yoga menu object
        [self BuildYogaMenu:startelement MenuObj:nil]; 
    }
    return self;
}

//to do få enum til at virke
-(MenuType)GetMenuType:(int) menuid
{    
    MenuItem *m = [self.MenulinesArr objectAtIndex:(menuid)];
    id obj= [m.Submenu_Set_PractizeArr objectAtIndex:0];
    if ( [obj isKindOfClass: [SubMenu class]] == YES )
    {
        return yogasubmenu;
    }
    else if ( [obj isKindOfClass: [YogaSet class]] == YES )
    {
        return yogaset;
    }
    else if ( [obj isKindOfClass: [YogaPractice class]] == YES )
    {    
        return yogapractice;
    }
    return invalid;
}


-(void) BuildYogaMenu:(XMLElement *) start MenuObj:(id) menuObj
{
  //  NSLog(@"%@", start.name );
    if ([[start.name uppercaseString] isEqualToString: @"MENU"]) 
    {
        // initialise Menu Obj
        self.MenulinesArr = [[NSMutableArray alloc] init ];
        //
        for (XMLElement *sub in start.subElements) 
        {
            [self BuildYogaMenu:sub MenuObj:nil];
        }
    }
    else if ([[start.name uppercaseString] isEqualToString:@"MENUITEM"]) 
    {
        MenuItem *mi = [[MenuItem alloc] init];
        if ([[start.parent.name uppercaseString] isEqualToString:@"MENU"])
            [self.MenulinesArr addObject:mi];
        else //Submenu 
        {
            SubMenu *si = (SubMenu *) menuObj;
            [si.MenuItemArr addObject:mi];
        }
        for (XMLElement *sub in start.subElements) 
        {
            
            if ([[sub.name uppercaseString] isEqualToString: @"ID"])
                mi.Id = sub.text;
            else if ([[sub.name uppercaseString] isEqualToString: @"TITLE"])
                mi.Title = sub.text;
            else if (([[sub.name uppercaseString] isEqualToString:@"SET"] ) || ([[sub.name uppercaseString] isEqualToString:@"PRACTICE"] ) || ([[sub.name uppercaseString] isEqualToString:@"SUBMENU"] ))
            {
                [self BuildYogaMenu:sub MenuObj:mi];            
            }
        }
    }  
    else if ([[start.name uppercaseString] isEqualToString:@"SUBMENU"]) 
    {
        SubMenu *sm = [[SubMenu alloc] init];
        if ( [menuObj isKindOfClass: [MenuItem class]] == YES ) {
            MenuItem *ys = (MenuItem *) menuObj;
            [ys.Submenu_Set_PractizeArr addObject:sm];
        }
        else
        {
            YogaSet *ys = (YogaSet *) menuObj;
            [ys.Submenu_PracticeArr addObject:sm];
            
        }

        for (XMLElement *sub in start.subElements) 
        {
            
            if ([[sub.name uppercaseString] isEqualToString: @"ID"])
                sm.Id = sub.text;
            else if ([[sub.name uppercaseString] isEqualToString: @"TITLE"])
                sm.Title = sub.text;
            else if ([[sub.name uppercaseString] isEqualToString:@"MENUITEM"]  )
            {
                [self BuildYogaMenu:sub MenuObj:sm];            
            }
        }
    }  
    else if ([[start.name uppercaseString] isEqualToString: @"SET"]) 
    {
        YogaSet *ys = [[YogaSet alloc] init];        
        MenuItem *mi = (MenuItem *) menuObj;
        [mi.Submenu_Set_PractizeArr addObject:(YogaSet *) ys];
        
        for (XMLElement *sub in start.subElements) 
        {
            if ([[sub.name uppercaseString] isEqualToString: @"ID"])
                ys.Id = sub.text;
            else if ([[sub.name uppercaseString] isEqualToString: @"TITLE"])
                ys.Title = sub.text;
            else if ([[sub.name uppercaseString] isEqualToString: @"INFO"])
                ys.Info = sub.text;
            else if ([[sub.name uppercaseString] isEqualToString: @"THUMBNAILIMAGE"])
                ys.Thumbnail = sub.text;           
            else if (([[sub.name uppercaseString] isEqualToString:@"PRACTICE"] )
                || ([[sub.name uppercaseString] isEqualToString:@"SUBMENU"] ))
            {
                [self BuildYogaMenu:sub MenuObj:ys];            
            }
            else if ([[sub.name uppercaseString] isEqualToString:@"KEYWORDS"] )
            {
                [self BuildYogaMenu:sub MenuObj:ys];
            }
        }
        
    }
    else if ([[start.name uppercaseString] isEqualToString: @"PRACTICE"]) 
    {
        YogaPractice *yp = [[YogaPractice alloc] init];        
        
        if ( [menuObj isKindOfClass: [MenuItem class]] == YES ) {
            MenuItem *ys = (MenuItem *) menuObj;
                            [ys.Submenu_Set_PractizeArr addObject:yp];
        }
        else
        {
            YogaSet *ys = (YogaSet *) menuObj;
                            [ys.Submenu_PracticeArr addObject:yp];
            
        }

        for (XMLElement *sub in start.subElements) 
        {
            if ([[sub.name uppercaseString] isEqualToString: @"ID"])
                yp.Id = sub.text;
            else if ([[sub.name uppercaseString] isEqualToString: @"TITLE"])
                yp.Title = sub.text;
            else if ([[sub.name uppercaseString] isEqualToString: @"INFO"])
                yp.Info = sub.text;
            else if ([[sub.name uppercaseString] isEqualToString: @"THUMBNAILIMAGE"])
                yp.Thumbnail = sub.text;           
            else if ([[sub.name uppercaseString] isEqualToString: @"URL"])
                yp.Movieurl = sub.text;
            else if ([[sub.name uppercaseString] isEqualToString: @"MOVIESTART"])
                yp.Moviestart = [sub.text floatValue];
            else if ([[sub.name uppercaseString] isEqualToString: @"MOVIESTOP"])
                yp.Moviestop = [sub.text floatValue];
            else if ([[sub.name uppercaseString] isEqualToString: @"SOUND"])
                yp.Sound = [sub.text boolValue];
            else if ([[sub.name uppercaseString] isEqualToString: @"SNAPSHOT"])
                yp.Snapshot = [sub.text floatValue];
            else if ([[sub.name uppercaseString] isEqualToString: @"RECOMMENDEDTIME"])
                yp.Recommendtime = sub.text;
            else if ([[sub.name uppercaseString] isEqualToString:@"KEYWORDS"] )
            {
                [self BuildYogaMenu:sub MenuObj:yp];
            }
            
        }

    }        
    else if ([[start.name uppercaseString] isEqualToString: @"KEYWORDS"])
    {
        Keyword *key;                 
        for (XMLElement *sub in start.subElements)
        {
            if ([[sub.name uppercaseString] isEqualToString: @"KEY"])
            {   key= [[Keyword alloc] init];
                key.Key = sub.text;
            }
            else if ([[sub.name uppercaseString] isEqualToString: @"LINK"])
            {    key.Link = sub.text;
                if ( [menuObj isKindOfClass: [YogaPractice class]] == YES ) {
                    YogaPractice *yp = (YogaPractice *) menuObj;
                    if (key )
                        [yp.KeywordArr addObject:key];
                }
                else
                {
                    YogaSet *ys = (YogaSet *) menuObj;
                    if (key)
                        [ys.KeywordArr addObject:key];
                    
                }
            }
        }
    }
    
}





@end
