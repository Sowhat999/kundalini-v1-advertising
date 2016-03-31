//
//  ViewController.m
//  kundalini
//
//  Created by Christian Andersen on 23/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "PracticeViewController.h"

@implementation MainViewController
@synthesize ImageViewYogaPas;
@synthesize ym; //Yogamenu
@synthesize portrait, landscape;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil menu:(YogaMenu *) ym
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.ym = ym;
        dispatchrunning = TRUE;
        sharedManager = [MyMusicPlayerManager sharedManager];
        [self settingDefaultOrientation];
        // Custom initialization
    }
    return self;
}


-(void) settingDefaultOrientation
{
    if (self.interfaceOrientation == UIInterfaceOrientationPortrait)
    {
        self.view = portrait;
    }
    else
    {
        self.view = landscape;
    }

}

- (IBAction)Showmeditation:(id)sender {
    [self LaunchNewWindow:yogameditation];
}


-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if( UIInterfaceOrientationIsLandscape(toInterfaceOrientation) )
    {
        self.view = landscape ;
    }
    else
    {
        self.view = portrait;
    }
}







- (IBAction)Showwarmup:(id)sender {    
    [self LaunchNewWindow:yogawarmup];
}



-(IBAction)ShowYogapas:(id)sender
{
    [self LaunchNewWindow:yogapas];
}


- (void) LaunchNewWindow:(int) launch
{
    if (launch==yogawarmup || launch==yogameditation ) //practicemenu obj
    {    
        MenuItem *menuitem = [self.ym.MenulinesArr objectAtIndex:launch];                
        
        PracticeViewController *swc = [[PracticeViewController alloc] initWithMenu:menuitem yogam:ym];
        [self.navigationController pushViewController:swc animated:YES];
    }
    else if (launch==yogapas) //set
    {
        SetViewController *swc = [[SetViewController alloc] initWithMenu:self.ym menuitem:launch];

        [self.navigationController pushViewController:swc animated:YES];


    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (UIButton *b in self.WarmUpBut) {
        [b setTitle:NSLocalizedString(@"TUNEINLABEL", nil) forState: UIControlStateNormal];
        [b setTitle:NSLocalizedString(@"TUNEINLABEL", nil) forState: UIControlStateSelected];
        [b setTitle:NSLocalizedString(@"TUNEINLABEL", nil) forState: UIControlStateHighlighted];

    }
    
    for (UIButton *b in self.AboutBut) {
        [b setTitle:NSLocalizedString(@"ABOUTLABEL", nil) forState: UIControlStateNormal];
        [b setTitle:NSLocalizedString(@"ABOUTLABEL", nil) forState: UIControlStateSelected];
        [b setTitle:NSLocalizedString(@"ABOUTLABEL", nil) forState: UIControlStateHighlighted];
        
    }
    
    
    UIColor *myColor2 = [[UIColor alloc] initWithRed:0.4545 green:.3213 blue:0.4732 alpha:1.0f];
    
    self.view.backgroundColor = myColor2;

    self.interstitialPresentationPolicy = ADInterstitialPresentationPolicyAutomatic;
        
}






- (void)buttonPressed:(UIButton *)button
{
    [button setImage:[UIImage imageNamed:@"knap2.png"] forState:UIControlStateSelected];
    [self.view addSubview:button];
}

- (void)viewDidUnload
{
    ImageViewYogaPas = nil;
    [self setPortrait:nil];
    [self setLandscape:nil];
    [self setButSpeak:nil];
    [self setWarmUpBut:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self settingDefaultOrientation];
    [self ChangeSpeakImage];
    for (UIButton *b in self.WarmUpBut) {
        b.titleLabel.text = NSLocalizedString(@"TUNEINLABEL", nil);
    }
    
    for (UIButton *b in self.AboutBut) {
        b.titleLabel.text = NSLocalizedString(@"ABOUTLABEL", nil);
    }
    
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}




- (IBAction)test:(id)sender {
}

- (IBAction)Showabout:(id)sender {
    
    AboutViewController *nextView;
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            /*Do iPhone 5 stuff here.*/
             nextView = [[AboutViewController alloc] init];        } else {
            /*Do iPhone Classic stuff here.*/
            nextView = [[AboutViewController alloc] init];
        }
    } else {
        /*Do iPad stuff here.*/
        nextView = [[AboutViewController alloc] initWithNibName:@"AboutViewControllerIpad" bundle:nil];
    }
    
//    [UIView animateWithDuration:0.75
//                     animations:^{
//                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//                         [self.navigationController  pushViewController:nextView animated:NO];
//                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
//                     }];
    
       //     [self.navigationController pushViewController:nextView animated:YES];
    
    [self presentModalViewController:nextView animated:YES];
//    [self dismissModalViewControllerAnimated:NO];
    
    
    
}


- (void) ChangeSpeakImage
{    
    UIImage *uimusicimage;
    if ([sharedManager IsMusicPlaying]) {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
                  uimusicimage = [UIImage imageNamed:@"Music_Icon3_On.png"];  
        } else {
            /*Do iPad stuff here.*/
                    uimusicimage = [UIImage imageNamed:@"Music_Icon3_On.png"];
            
        }
    }
    else {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            uimusicimage = [UIImage imageNamed:@"Music_Icon3_Off.png"];
        } else {
            /*Do iPad stuff here.*/
            uimusicimage = [UIImage imageNamed:@"Music_Icon3_Off.png"];
            
        }
    }
    //  ButMusic = [UIButton buttonWithType:UIButtonTypeCustom];
    for (UIButton *b in self.ButSpeak) {
        b.imageView.image = uimusicimage;
        [b setImage:uimusicimage forState:UIControlStateNormal];
    }
    
    
 //   [ButSpeaker setImage:uimusicimage forState:UIControlStateNormal];
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

-(BOOL)shouldAutorotate
{
    return YES;
}









- (IBAction)musicstate:(id)sender {
        
    [sharedManager Play];
    [self ChangeSpeakImage];
}
@end
