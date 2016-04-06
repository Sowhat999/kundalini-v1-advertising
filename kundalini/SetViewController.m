//
//  SetViewController.m
//  kundalini
//
//  Created by Christian Andersen on 17/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SetViewController.h"


@implementation SetViewController
@synthesize ym, a;

- (id)initWithMenu:(YogaMenu *) ym menuitem:(int)mi_id;

{
    if ((self = [super initWithStyle:UITableViewStylePlain]))
    {
        self.ym = ym;
        a = [[NSMutableArray alloc] init];
        MenuItem *m = [ym.MenulinesArr objectAtIndex:(mi_id)];
        a = m.Submenu_Set_PractizeArr;
        self.title = m.Title;
    }
    
    return self;        
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

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
            [self.navigationController setNavigationBarHidden: YES animated:YES];
            [self.navigationController setToolbarHidden:YES animated:YES];
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
        
    }
    [super viewWillDisappear:animated];

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
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self ChangeSpeakImage];

}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return a.count;
}

- (void)imageTapped:(UITapGestureRecognizer *)gesture {
    UITableViewCell *cell = [[[gesture view] superview] superview];
    NSIndexPath *tappedIndexPath = [self.tableView indexPathForCell:cell];
    
    YogaSet *ys = [self.a objectAtIndex:tappedIndexPath.row];
    //
    PracticeViewController *pvc =[[PracticeViewController alloc] initWithSet:ys yogam:ym];
    [self.navigationController pushViewController:pvc animated:YES];
    //
}


- (void)InfobuttonPressed:(UIButton *)button
{

    YogaSet *ys = [self.a objectAtIndex:button.tag];
    
    PracticeDetailedViewController *pdvc;
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            /*Do iPhone 5 stuff here.*/
            pdvc =[[PracticeDetailedViewController alloc] initWithNibName:nil bundle:nil yogaset:ys yogam:ym];
        } else {
            /*Do iPhone Classic stuff here.*/
            pdvc =[[PracticeDetailedViewController alloc] initWithNibName:nil bundle:nil yogaset:ys yogam:ym];
            
        }
    } else {
        /*Do iPad stuff here.*/
        pdvc =[[PracticeDetailedViewController alloc] initWithNibName:@"PracticeDetailedViewControllerIpad" bundle:nil yogaset:ys yogam:ym];
    }
    
    [self.navigationController pushViewController:pdvc animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    static NSString *CellIdentifier = @"SetCell";
    
    SetCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSArray *topLevelObjects ;
        
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
            topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SetViewCell" owner:nil options:nil];
        }
        else
        {
            topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SetViewCellIpad" owner:nil options:nil];
        }
        
        for (id currentObject in topLevelObjects)
        {
            cell = (SetCell *) currentObject;
            break;
            
        }
    }
    
    // Configure the cell...
    YogaSet * p = [a objectAtIndex:indexPath.row];
    
    
    if (p.Info.length>0)
    {
        [cell.infobut setTitle:NSLocalizedString(@"READMORELABEL", nil) forState: UIControlStateNormal];
        [cell.infobut setTitle:NSLocalizedString(@"READMORELABEL", nil) forState: UIControlStateSelected];
        [cell.infobut setTitle:NSLocalizedString(@"READMORELABEL", nil) forState: UIControlStateHighlighted];
        
        cell.infobut.hidden = FALSE;
        
        [cell.infobut setTag:indexPath.row];
        [cell.infobut addTarget:self action:@selector(InfobuttonPressed:)
               forControlEvents:UIControlEventTouchUpInside];
              
    }
    else
        cell.infobut.hidden = TRUE;

    UIImage *testImg;
    testImg = [UIImage imageNamed:p.Thumbnail];
    
    cell.picture.image = testImg;

    cell.title.text = p.Title;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];
    [cell.picture addGestureRecognizer:tapGesture];
    cell.picture.userInteractionEnabled = YES;
    
    return cell;

}








-(void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
      
}

- (void) ChangeSpeakImage
{
    UIImage *uimusicimage;
    MyMusicPlayerManager *sharedManager = [MyMusicPlayerManager sharedManager];
    if ([sharedManager IsMusicPlaying])
        uimusicimage = [UIImage imageNamed:@"Music_Icon3_On.png"];
    else
        uimusicimage = [UIImage imageNamed:@"Music_Icon3_Off.png"];
 //   ButMusic = [UIButton buttonWithType:UIButtonTypeCustom];
    [ButMusic setImage:uimusicimage forState:UIControlStateNormal];
    
}




- (void)goMusic:(id) sender {
    MyMusicPlayerManager *sharedManager = [MyMusicPlayerManager sharedManager];
    [sharedManager Play];
    [self ChangeSpeakImage];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //If this is the selected index we need to return the height of the cell
    //in relation to the label height otherwise we just return the minimum label height with padding
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        return 90;
    }
    else
    {
        /*Do iPad stuff here.*/
        return 258;
    }
    
    
    
}


#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIColor *myColor = [UIColor colorWithRed:0.3930 green:0.2794 blue:0.4108 alpha:1.0f];    
    UIColor *myColor2 = [[UIColor alloc] initWithRed:0.4545 green:.3213 blue:0.4732 alpha:1.0f];
    cell.backgroundColor = (indexPath.row%2)? myColor:myColor2;
}

@end
