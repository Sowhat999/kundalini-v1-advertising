//
//  AppDelegate.h
//  kundalini
//
//  Created by Christian Andersen on 23/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YogaMenu.h"
#import "XmlElement.h"
#import "OrientationNavigationController.h"
@class MainViewController;



@interface AppDelegate : UIResponder <UIApplicationDelegate, NSXMLParserDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) YogaMenu *myYogaMenu;
@property (strong, strong) NSXMLParser *xmlParser;
@property (strong, nonatomic) XMLElement *rootElement;
@property (strong, nonatomic) XMLElement *currentElementPointer;
@property (strong, strong) YogaMenu *ym; 
@property (strong, nonatomic) MainViewController *viewController;
@property (strong, nonatomic) UINavigationController *navigationController;
@end
