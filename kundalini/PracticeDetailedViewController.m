//
//  PracticeDetailedViewController.m
//  kundalini
//
//  Created by Christian Andersen on 23/08/12.
//
//

#import "PracticeDetailedViewController.h"



@implementation PracticeDetailedViewController
@synthesize picture, scroller;
@synthesize  yogap, yogas, ym;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil practice:(YogaPractice *) yp yogam:(YogaMenu *) yogam
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = yp.Title;
        self.yogap = yp;
        self.ym = yogam;
    }
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil yogaset:(YogaSet *) ys yogam:(YogaMenu *) yogam
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = ys.Title;
        self.yogas = ys;
        self.ym = yogam;

    }
    return self;
}


- (void)viewDidLoad
{
    UIImage *Img;
    NSString *myTextField;
    [super viewDidLoad];
    if (self.yogap)
    {
        myTextField = [yogap.Info stringByReplacingOccurrencesOfString:@"\\n" withString: @"\n"];
     //   self.label.hotKeys = self.yogap.KeywordArr;
        Img = [UIImage imageNamed:yogap.Thumbnail];
    }
    else
    {
        myTextField = [yogas.Info stringByReplacingOccurrencesOfString:@"\\n" withString: @"\n"];
    //    self.label.hotKeys = self.yogas.KeywordArr;
        Img = [UIImage imageNamed:yogas.Thumbnail];    
    }
    
    self.text.text = myTextField;
    self.picture.image = Img;

    UIColor *myColor2 = [[UIColor alloc] initWithRed:0.4545 green:.3213 blue:0.4732 alpha:1.0f];
    
    self.view.backgroundColor = myColor2;
    self.text.backgroundColor = myColor2; //(indexPath.row%2)? myColor:myColor2;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didRotateFromInterfaceOrientation:
(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self refreshTextLayout];
}



- (void) viewDidAppear:(BOOL)animated
{
       [self refreshTextLayout];
    
}

- (void)viewDidUnload
{
    [self setPicture:nil];
    [self setText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)refreshTextLayout
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if([UIDevice currentDevice].orientation != UIInterfaceOrientationLandscapeLeft && [UIDevice currentDevice].orientation != UIInterfaceOrientationLandscapeRight )
        {
            CGRect newframe = CGRectMake(20, 111, 285, 285);
            [self.text setFrame:newframe];
        }
        else
        {
            CGRect newframe = CGRectMake(20, 111, 385, 185);
            [self.text setFrame:newframe];
        } 
    }
    else
    {
    //    if([UIDevice currentDevice].orientation == UIInterfaceOrientationPortrait)
        if([UIDevice currentDevice].orientation != UIInterfaceOrientationLandscapeLeft && [UIDevice currentDevice].orientation != UIInterfaceOrientationLandscapeRight )

        {
            CGRect newframe = CGRectMake(36, 219, 694, 726);
            [self.text setFrame:newframe];
        }
        else
        {
            CGRect newframe = CGRectMake(36, 219, 900, 475);
            [self.text setFrame:newframe];
        }
    }

}



-(void)label:(GLTapLabel *)label didSelectedHotWord:(NSString *)w
{
    if ([[w uppercaseString] rangeOfString:@"TUNE"].location != NSNotFound)
    {
   //     TuneinViewController *tunein = [[TuneinViewController alloc] init];
   //     [self.navigationController pushViewController:tunein animated:YES];
    }
    else
    {
        MenuItem *menuitem = [self.ym.MenulinesArr objectAtIndex:yogawarmup];
        PracticeViewController *swc = [[PracticeViewController alloc] initWithMenu:menuitem yogam:ym];
        [self.navigationController pushViewController:swc animated:YES];
    }
}



@end
