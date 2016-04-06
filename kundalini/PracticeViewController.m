 //
//  PracticeViewController.m
//  kundalini
//
//  Created by Christian Andersen on 17/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PracticeViewController.h"



@implementation PracticeViewController;

@synthesize yogam, avmovieplayer;

- (id)initWithMenu:(MenuItem *) mi yogam:(YogaMenu *) yogame;
{
    if ((self = [super initWithStyle:UITableViewStylePlain]))
    {
        practicearray = [[NSMutableArray alloc] initWithArray: mi.Submenu_Set_PractizeArr ];
        self.title = mi.Title;
        self.yogam = yogame;
    }
    
    return self;        
}


- (id)initWithSet:(YogaSet *) ys yogam:(YogaMenu *) yogame;
{
    if ((self = [super initWithStyle:UITableViewStylePlain]))
    {                       
        practicearray = [[NSMutableArray alloc] initWithArray: [ys Submenu_PracticeArr]];
        self.title = ys.Title;
        self.yogam = yogame;
    }
    
    return self;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //If this is the selected index we need to return the height of the cell
    //in relation to the label height otherwise we just return the minimum label height with padding
    BOOL show_special_first_row_nib = true;
    BOOL show_special_first_row_txt_nib = false;
    
    if (indexPath.row == 0)
    {
        for (UIViewController* viewController in self.navigationController.viewControllers)
        {
            if ([viewController isKindOfClass:[PracticeDetailedViewController class]] ) {
                show_special_first_row_nib = false;
            }
        }
    }
  
    // hack ignore PracticeViewCellFirstRow
    // når det er warm up menu som kommer fra set menu
    // derfor skal der ikke være en hel film
    YogaPractice * pTemp = [practicearray objectAtIndex:indexPath.row];
    if ([pTemp.Id isEqualToString:@"IgnoreFirstRow"])
        show_special_first_row_nib = false;
    
    if ([pTemp.Id isEqualToString:@"ShowTxtFirstRow"])
        show_special_first_row_txt_nib = true;
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if (self.navigationController.viewControllers.count > 2)
        {
            if (indexPath.row == 0 && show_special_first_row_nib)
                return 246;
            else
                return 100;
        }
        else if (show_special_first_row_txt_nib)            
            return 246;
        else
            return 100;
    }
    else
    {
        /*Do iPad stuff here.*/
        if (self.navigationController.viewControllers.count > 2)
        {
            if (indexPath.row == 0 && show_special_first_row_nib)
                return 500;
            else
                return 258;
        }
        else if (show_special_first_row_txt_nib)
            return 500;
        else
            return 258;
    }
 

}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden: FALSE animated:YES];
    [self.navigationController setToolbarHidden:TRUE animated:YES];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    [self.navigationController.navigationBar setTranslucent:FALSE];
    
    UIColor *myColor = [UIColor colorWithRed:0.3930 green:0.2794 blue:0.4108 alpha:1.0f];

    self.view.backgroundColor = myColor;
    
    //Music on / off
    UIImage *uimusicimage;
    MyMusicPlayerManager *sharedManager = [MyMusicPlayerManager sharedManager];
    if ([sharedManager IsMusicPlaying])
        uimusicimage = [UIImage imageNamed:@"Music_Icon3_On.png"];
    else
        uimusicimage = [UIImage imageNamed:@"Music_Icon3_Off.png"];

    ButMusic = [UIButton buttonWithType:UIButtonTypeCustom];
    [ButMusic setImage:uimusicimage forState:UIControlStateNormal];
    ButMusic.frame = CGRectMake(0.0, 0.0, uimusicimage.size.width, uimusicimage.size.height);
    
    UIBarButtonItem *BarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:ButMusic];
    [ButMusic addTarget:self action:@selector(goMusic:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = BarButtonItem;
    //music on / off
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    MyMusicPlayerManager *sharedManager = [MyMusicPlayerManager sharedManager];
    [sharedManager ChkSuspended];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)goHome:(id) sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


- (void) ChangeSpeakImage
{
    MyMusicPlayerManager *sharedManager = [MyMusicPlayerManager sharedManager];
    UIImage *uimusicimage;
    if ([sharedManager IsMusicPlaying])
        uimusicimage = [UIImage imageNamed:@"Music_Icon3_On.png"];
    else
        uimusicimage = [UIImage imageNamed:@"Music_Icon3_Off.png"];
    //  ButMusic = [UIButton buttonWithType:UIButtonTypeCustom];
    [ButMusic setImage:uimusicimage forState:UIControlStateNormal];
    
}



- (void)goMusic:(id) sender {
    MyMusicPlayerManager *sharedManager = [MyMusicPlayerManager sharedManager];
    [sharedManager Play];
    [self ChangeSpeakImage];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        if (self.navigationController.viewControllers.count == 1)
        {
            [self.navigationController setNavigationBarHidden: YES animated:YES];
            [self.navigationController setToolbarHidden:YES animated:YES];
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
        }
    }
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

/*
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;
{
    
    // Return the number of sections.
    return 100;
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return practicearray.count;
}

- (void) buyappmessage:(UIButton *)button
{
    UIAlertController *alertController = [UIAlertController
                                        alertControllerWithTitle:@"Kundalini"
                                        message:NSLocalizedString(@"BUYFULLMESSAGE", nil)
                                        preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   [self dismissViewControllerAnimated:YES completion:Nil];

                               }];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}


- (void) playmovie:(BOOL)repeat practice:(YogaPractice *) p
{
    if (p.Sound)
    {
        MyMusicPlayerManager *sharedManager = [MyMusicPlayerManager sharedManager];
        [sharedManager ChkPaused];
    }
    
    NSBundle *Bundle = [NSBundle mainBundle];
    NSString *moviePath = [Bundle pathForResource:p.Movieurl ofType:@"mp4"];
    NSLog(@"String is %@", moviePath);
    NSURL *url = [NSURL fileURLWithPath:moviePath];
    
    AVPlayer *player = [AVPlayer playerWithURL:url];
    self.avmovieplayer = [AVPlayerViewController new];
    
    self.avmovieplayer.player = player;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myMovieFinishedCallback:)
                                                name : AVPlayerItemDidPlayToEndTimeNotification object:self.avmovieplayer.player.currentItem] ;
    
    [self presentViewController:self.avmovieplayer animated:YES completion:nil];
    [self.avmovieplayer.player seekToTime:CMTimeMakeWithSeconds(p.Moviestart, 60000)];
    if (p.Moviestop>0) //ikk altid sat
        self.avmovieplayer.player.currentItem.forwardPlaybackEndTime = CMTimeMake(p.Moviestop, 1);
    [self.avmovieplayer.player play];
 
}

- (void)RepeatbuttonPressed:(UIButton *)button
{
    // Configure the cell...
    YogaPractice * p = [practicearray objectAtIndex:button.tag];
    [self playmovie:true practice:p];
}


- (void)PlaybuttonPressed:(UIButton *)button
{
    // Configure the cell...
    YogaPractice * p = [practicearray objectAtIndex:button.tag];
    [self playmovie:false practice:p];
}


/*  Notification called when the movie finished playing. */
- (void) myMovieFinishedCallback:(NSNotification*)notification
{
    [self dismissViewControllerAnimated:YES completion:Nil];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

- (void)InfobuttonPressed:(UIButton *)button
{    
    YogaPractice *yp = [practicearray objectAtIndex:button.tag];
    
    PracticeDetailedViewController *pdvc;
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            /*Do iPhone 5 stuff here.*/
            pdvc =[[PracticeDetailedViewController alloc] initWithNibName:nil bundle:nil practice:yp yogam:yogam];
        } else {
            /*Do iPhone Classic stuff here.*/
            pdvc =[[PracticeDetailedViewController alloc] initWithNibName:nil bundle:nil practice:yp yogam:yogam];
            
        }
    } else {
        /*Do iPad stuff here.*/
        pdvc =[[PracticeDetailedViewController alloc] initWithNibName:@"PracticeDetailedViewControllerIpad" bundle:nil practice:yp yogam:yogam];
    }
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.toolbar.tintColor = [UIColor blackColor];
    [self.navigationController pushViewController:pdvc animated:YES];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PracticeCell";
     
    PracticeCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSArray *topLevelObjects;
        
        BOOL show_special_first_row_nib = true;
        BOOL show_special_first_row_txt_nib = false;
        
        if (indexPath.row == 0)
        {
            for (UIViewController* viewController in self.navigationController.viewControllers)
            {
                if ([viewController isKindOfClass:[PracticeDetailedViewController class]] ) {
                    show_special_first_row_nib = false;
                }
            }
        }
        
        // hack ignore PracticeViewCellFirstRow
        // når det er warm up menu som kommer fra set menu
        // derfor skal der ikke være en hel film
        YogaPractice * pTemp = [practicearray objectAtIndex:indexPath.row];
        if ([pTemp.Id isEqualToString:@"IgnoreFirstRow"])
             show_special_first_row_nib = false;
        
        if ([pTemp.Id isEqualToString:@"ShowTxtFirstRow"])
            show_special_first_row_txt_nib = true;
        
        if (indexPath.row == 0 && self.navigationController.viewControllers.count > 2 &&
            show_special_first_row_nib)
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
            {
            topLevelObjects= [[NSBundle mainBundle] loadNibNamed:@"PracticeViewCellFirstRow" owner:nil options:nil];
            }
            else
            {
                topLevelObjects= [[NSBundle mainBundle] loadNibNamed:@"PracticeViewCellFirstRowIpad" owner:nil options:nil];
            }
        else
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
            {
                if (show_special_first_row_txt_nib)
                    topLevelObjects= [[NSBundle mainBundle] loadNibNamed:@"PracticeFirstRowTxt" owner:nil options:nil];
                else
                    topLevelObjects= [[NSBundle mainBundle] loadNibNamed:@"PracticeViewCell" owner:nil options:nil];
            }
            else
            {
                if (show_special_first_row_txt_nib)
                                      topLevelObjects= [[NSBundle mainBundle] loadNibNamed:@"PracticeFirstRowTxtIpad" owner:nil options:nil];  
                else
                    topLevelObjects= [[NSBundle mainBundle] loadNibNamed:@"PracticeViewCellIpad" owner:nil options:nil];
            }

        for (id currentObject in topLevelObjects)
        {
            cell = (PracticeCell *) currentObject;
            break;
            
        }
    }
        
    // Configure the cell...
    YogaPractice * p = [practicearray objectAtIndex:indexPath.row];
          
    if (p.Info.length>0)
    {
        
        [cell.infobut setTitle:NSLocalizedString(@"READMORELABEL", nil) forState: UIControlStateNormal];
        [cell.infobut setTitle:NSLocalizedString(@"READMORELABEL", nil) forState: UIControlStateSelected];
        [cell.infobut setTitle:NSLocalizedString(@"READMORELABEL", nil) forState: UIControlStateHighlighted];

        cell.infobut.hidden = FALSE;
        
        UIColor *myColor2 = [[UIColor alloc] initWithRed:0.4545 green:.3213 blue:0.4732 alpha:1.0f];
        cell.description.backgroundColor = myColor2;
        cell.description.text = [p.Info stringByReplacingOccurrencesOfString:@"\\n" withString: @"\n"];
        [cell.description flashScrollIndicators];

        
        [cell.infobut setTag:indexPath.row];
        if ([p.Id isEqualToString:@"demo"])
        {
            [cell.infobut addTarget:self action:@selector(InfobuttonPressed:)
                   forControlEvents:UIControlEventTouchUpInside];
        }
        else
        {
            [cell.infobut addTarget:self action:@selector(buyappmessage:)
               forControlEvents:UIControlEventTouchUpInside];
        }
    
    }
    else
    {
        cell.infobut.hidden = true;
    }
    
    [cell.repeatbut setTag:indexPath.row];
    [cell.repeatbut addTarget:self action:@selector(RepeatbuttonPressed:)
           forControlEvents:UIControlEventTouchUpInside];
    
    //Create snapshot of image
    if (p.Snapshot>=0)
    {                
        NSString  *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        jpgPath = [jpgPath stringByAppendingString:@"/"];
        jpgPath = [jpgPath stringByAppendingString:self.title];
        jpgPath = [jpgPath stringByAppendingString:[p.Title stringByAppendingString:[NSString stringWithFormat:@"%d", indexPath.row]]];
        jpgPath = [jpgPath stringByAppendingString:@".jpg"];
        jpgPath = [jpgPath stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (p.Moviestart>=0)
        {
           // UIImage *thumbnail = [movieplayer thumbnailImageAtTime:p.Snapshot timeOption:MPMovieTimeOptionExact];
     
            // Write a UIImage to JPEG with minimum compression (best quality)
            // The value 'image' must be a UIImage object
            // The value '1.0' represents image compression quality as value from 0.0 to 1.0
         //   [UIImageJPEGRepresentation(thumbnail, 0.5) writeToFile:jpgPath atomically:YES];
            NSLog(@"Creating image : %@",jpgPath);
        }
        else
            NSLog(@"Could not create image : %@ , invalid moviestart TAG",jpgPath);
    
    }

    cell.length.text = p.GetMovieLength;
    cell.recommenedtime.text = p.Recommendtime;
    
    [cell.playbut setTag:indexPath.row];
    if ([p.Id isEqualToString:@"demo"])
    {
        [cell.playbut addTarget:self action:@selector(PlaybuttonPressed:)
           forControlEvents:UIControlEventTouchUpInside];
    }
    else
    {
        [cell.playbut addTarget:self action:@selector(buyappmessage:)
               forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIImage *testImg;
    testImg = [UIImage imageNamed:p.Thumbnail];

    cell.picture.image = testImg;
    cell.title.text = p.Title;
    
    //Ingen playbut når url er tom
    if (p.Movieurl.length == 0)
        cell.playbut.hidden = true;

        
    return cell;
}


#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{

    UIColor *myColor = [UIColor colorWithRed:0.3930 green:0.2794 blue:0.4108 alpha:1.0f];
    UIColor *myColor2 = [[UIColor alloc] initWithRed:0.4545 green:.3213 blue:0.4732 alpha:1.0f];
    cell.backgroundColor = (indexPath.row%2)? myColor:myColor2;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    
}





@end
