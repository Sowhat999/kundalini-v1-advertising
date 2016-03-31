//
//  AppDelegate.m
//  kundalini
//
//  Created by Christian Andersen on 23/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "MainViewController.h"
@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize myYogaMenu;
@synthesize xmlParser;
@synthesize rootElement;
@synthesize currentElementPointer;
@synthesize ym;
@synthesize navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{ 
    
   // YogaMenu *ym;
    
    
    //build XML
    NSBundle *bundle = [NSBundle mainBundle];
    if (bundle) 
    {
        NSString * locale = [[NSLocale preferredLanguages] objectAtIndex:0];
        NSLocale * curentLocale = [NSLocale currentLocale];
        NSString * localekeyboard = [curentLocale displayNameForKey:NSLocaleIdentifier
                                  value:[curentLocale localeIdentifier]];
                
        NSString *xmlFile;
        if ([locale isEqualToString:@"da"] || [localekeyboard isEqualToString:@"dansk (Danmark)"] )
            xmlFile = [[NSBundle mainBundle] pathForResource:@"menuDK" ofType:@"xml"];
        else
            xmlFile = [[NSBundle mainBundle] pathForResource:@"menuUK" ofType:@"xml"];    
        
        NSData *xml = [[NSData alloc] initWithContentsOfFile:xmlFile];
        
        self.xmlParser = [[NSXMLParser alloc] initWithData:xml];
        self.xmlParser.delegate = self;
        if ([self.xmlParser parse])
        {                
            ym = [[YogaMenu alloc] initWithXML:self.rootElement];
            NSLog(@"the xml is parsed");
        }
        else
            NSLog(@"the xml is not parsed");                     
        
        
    }
    

//    dispatch_queue_t serielqueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//    //dispatch_queue_create("com.snakeapp.serialQueue1", 0);
//    dispatch_async(serielqueue,^(void)
//                   {
//                       NSString * locale = [[NSLocale preferredLanguages] objectAtIndex:0];
//                       NSString *xmlFile;
//                       if ([locale isEqualToString:@"da"])
//                           xmlFile = [[NSBundle mainBundle] pathForResource:@"menuDK" ofType:@"xml"];
//                       else if ([locale isEqualToString:@"de"])
//                           xmlFile = [[NSBundle mainBundle] pathForResource:@"menuDE" ofType:@"xml"];
//                       else
//                           xmlFile = [[NSBundle mainBundle] pathForResource:@"menuUK" ofType:@"xml"];
//                       
//                       NSData *xml = [[NSData alloc] initWithContentsOfFile:xmlFile];
//                       
//                       self.xmlParser = [[NSXMLParser alloc] initWithData:xml];
//                       self.xmlParser.delegate = self;
//                       if ([self.xmlParser parse])
//                       {                
//                           ym = [[YogaMenu alloc] initWithXML:self.rootElement];
//                           NSLog(@"the xml is parsed");
//                       }
//                       else
//                           NSLog(@"the xml is not parsed");
//                   });
//    
    
    
    
    
    
    [[AVAudioSession sharedInstance] setDelegate: self];
    NSError *setCategoryError = nil;
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: &setCategoryError];
    if (setCategoryError)
        NSLog(@"Error setting category! %@", setCategoryError);
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            /*Do iPhone 5 stuff here.*/
                self.viewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil menu:ym ];
        } else {
            /*Do iPhone Classic stuff here.*/
                self.viewController = [[MainViewController alloc] initWithNibName:@"MainViewControllerIphone4" bundle:nil menu:ym ];
            
        }
    } else {
        /*Do iPad stuff here.*/
        self.viewController = [[MainViewController alloc] initWithNibName:@"MainViewControllerIpad" bundle:nil menu:ym ];
    }

         
    navigationController =
    [[OrientationNavigationController alloc] initWithRootViewController:self.viewController];
    navigationController.toolbarHidden = TRUE;

    
    [navigationController.toolbar setBarStyle:UIBarStyleBlackTranslucent];
    [navigationController.toolbar setTranslucent:TRUE];
    navigationController.navigationBarHidden=TRUE;
       
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = navigationController;//
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
    
}





- (IBAction)Showmeditation:(id)sender {
    [self LaunchNewWindow:yogameditation];
}



- (IBAction)Showwarmup:(id)sender {
    [self LaunchNewWindow:yogawarmup];
}



-(IBAction)Yogapas:(id)sender
{
    [self LaunchNewWindow:yogapas];
}

- (void) LaunchNewWindow:(int) launch
{
    if ( launch==yogawarmup || launch==yogameditation ) //practicemenu obj
    {
        MenuItem *menuitem = [ym.MenulinesArr objectAtIndex:launch];
        
        PracticeViewController *swc = [[PracticeViewController alloc] initWithMenu:menuitem yogam:ym];
        [navigationController pushViewController:swc animated:YES];
    }
    else if (launch==yogapas) //set
    {
        SetViewController *swc = [[SetViewController alloc] initWithMenu:self.ym menuitem:launch];
        
        [self.navigationController pushViewController:swc animated:YES];
        
        
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    MyMusicPlayerManager *sharedManager = [MyMusicPlayerManager sharedManager];
    [sharedManager ChkPaused];
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    MyMusicPlayerManager *sharedManager = [MyMusicPlayerManager sharedManager];
    [sharedManager ChkPaused];
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /* Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}



- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([self.currentElementPointer.text length] > 0) {
        self.currentElementPointer.text = [self.currentElementPointer.text stringByAppendingString:string];
    }
    else {
        self.currentElementPointer.text = string;
    }

}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if (self.rootElement == nil) {
//        
        self.rootElement = [[XMLElement alloc] init];
        self.currentElementPointer = self.rootElement;
    } else {
        XMLElement *newElement = [[XMLElement alloc] init];
        newElement.parent = self.currentElementPointer;
        [self.currentElementPointer.subElements addObject:newElement];
        self.currentElementPointer = newElement;
       
    }
    self.currentElementPointer.name = elementName;
    self.currentElementPointer.attributes = attributeDict;
 //   NSLog(@"%@",elementName);
        
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    self.currentElementPointer = self.currentElementPointer.parent;
}

-(void) parserDidEndDocument:(NSXMLParser *)parser
{
    self.currentElementPointer = nil;
}

-(void) parserDidStartDocument:(NSXMLParser *)parser
{
    self.rootElement = nil;
    self.currentElementPointer = nil;
}


@end
