//
//  MyPageViewController.m
//  kundalini
//
//  Created by Christian Andersen on 07/11/12.
//
//

#import "MyPageViewController.h"

@interface MyPageViewController ()

@end


@implementation MyPageViewController

@synthesize pageNumberLabel;



// Load the view nib and initialize the pageNumber ivar.
- (id)initWithPageNumber:(int)page {
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (screenSize.height > 480.0f) {
            /*Do iPhone 5 stuff here.*/
            
            if (page==5 || page ==6)
            {
                if (self = [super initWithNibName:@"AboutFacebook" bundle:nil]) {
                    pageNumber = page;
                    return self;
                }
            }
            else if (page==2)
            {
                if (self = [super initWithNibName:@"AboutPernille" bundle:nil]) {
                    pageNumber = page;
                    return self;
                }
            }
            else if (page==4)
            {
                if (self = [super initWithNibName:@"AboutMirabeiCeiba" bundle:nil]) {
                    pageNumber = page;
                    return self;
                }
            }
            else
            {
                if (self = [super initWithNibName:@"About0" bundle:nil]) {
                    pageNumber = page;
                    return self;
                }
            }
            
            
            
        } else {
            /*Do iPhone Classic stuff here.*/
            if (page==5  || page ==6)
            {
                if (self = [super initWithNibName:@"AboutFacebook" bundle:nil]) {
                    pageNumber = page;
                    return self;
                }
            }
            else if (page==2)
            {
                if (self = [super initWithNibName:@"AboutPernille" bundle:nil]) {
                    pageNumber = page;
                    return self;
                }
            }
            else if (page==4)
            {
                if (self = [super initWithNibName:@"AboutMirabeiCeiba" bundle:nil]) {
                    pageNumber = page;
                    return self;
                }
            }
            else
            {
                if (self = [super initWithNibName:@"About0" bundle:nil]) {
                    pageNumber = page;
                    return self;
                }
            }
        }
    }
    else {
        /*Do iPad stuff here.*/
        if (page==6  || page ==5)
        {
            if (self = [super initWithNibName:@"AboutFacebookIpad" bundle:nil]) {
                pageNumber = page;
                return self;
            }
        }
        else if (page==2)
        {
            if (self = [super initWithNibName:@"AboutPernilleIpad" bundle:nil]) {
                pageNumber = page;
                return self;
            }
        }
        else if (page==4)
        {
            if (self = [super initWithNibName:@"AboutMirabeiCeibaIpad" bundle:nil]) {
                pageNumber = page;
                return self;
            }
        }
        else
        {
            if (self = [super initWithNibName:@"About0Ipad" bundle:nil]) {
                pageNumber = page;
                return self;
            }
        }
    }
    return self;
}

- (void)dealloc {
    
}


+ (void) alignLabelWithTop:(UILabel *)label {
    CGSize maxSize = CGSizeMake(label.frame.size.width, 999);
    label.adjustsFontSizeToFitWidth = NO;
    
    // get actual height
    CGSize actualSize = [label.text sizeWithFont:label.font constrainedToSize:maxSize lineBreakMode:label.lineBreakMode];
    CGRect rect = label.frame;
    rect.size.height = actualSize.height;
    label.frame = rect;
}


// Set the label and background color when the view has finished loading.
- (void)viewDidLoad {
    
    if (pageNumber==0)
    {
        self.Aboutheading.text =  NSLocalizedString(@"ABOUT0TITLE", nil);
        self.Abouttxt.text =  NSLocalizedString(@"ABOUT0TXT", nil);
        
    }
    else if (pageNumber==1)
    {    self.Aboutheading.text =  NSLocalizedString(@"ABOUT1TITLE", nil);
        self.Abouttxt.text =  NSLocalizedString(@"ABOUT1TXT", nil);
    }
    else if (pageNumber==2)
    {    self.Aboutheading.text =  NSLocalizedString(@"ABOUT2TITLE", nil);
        self.Abouttxt.text =  NSLocalizedString(@"ABOUT2TXT", nil);
    }
    else if (pageNumber==3)
    {    self.Aboutheading.text =  NSLocalizedString(@"ABOUT3TITLE", nil);
        self.Abouttxt.text =  NSLocalizedString(@"ABOUT3TXT", nil);
    }
    else if (pageNumber==4)
    {    self.Aboutheading.text =  NSLocalizedString(@"ABOUT4TITLE", nil);
        self.Abouttxt.text =  NSLocalizedString(@"ABOUT4TXT", nil);
    }
    else if (pageNumber==5)
    {    self.Aboutheading.text =  NSLocalizedString(@"ABOUT5TITLE", nil);
        self.Abouttxt.text =  NSLocalizedString(@"ABOUT5TXT", nil);
        self.ButAppStore.hidden = true;
        self.ButFacebook.hidden = false;
    }
    else if (pageNumber==6)
    {   self.Aboutheading.text =  NSLocalizedString(@"ABOUT6TITLE", nil);
        self.Abouttxt.text =  NSLocalizedString(@"ABOUT6TXT", nil);
        self.ButAppStore.hidden = false;
        self.ButFacebook.hidden = true;
    }
    else if (pageNumber==7)
    {   self.Aboutheading.text =  NSLocalizedString(@"ABOUT7TITLE", nil);
        self.Abouttxt.text =  NSLocalizedString(@"ABOUT7TXT", nil);
    }
    else if (pageNumber==8)
    {    self.Aboutheading.text =  NSLocalizedString(@"ABOUT8TITLE", nil);
        self.Abouttxt.text =  NSLocalizedString(@"ABOUT8TXT", nil);
    }
    else if (pageNumber==9)
    {    self.Aboutheading.text =  NSLocalizedString(@"ABOUT9TITLE", nil);
        self.Abouttxt.text =  NSLocalizedString(@"ABOUT9TXT", nil);
    }
    
    UIColor *myColor2 = [[UIColor alloc] initWithRed:0.4545 green:.3213 blue:0.4732 alpha:1.0f];
    
    self.self.view.backgroundColor = myColor2;
    self.Aboutheading.backgroundColor = myColor2;
    self.Abouttxt.backgroundColor = myColor2;
    
    self.Abouttxt.textAlignment = UITextAlignmentLeft;
    [self.Abouttxt sizeToFit];

    
}

- (void)viewDidUnload {
    [self setAbouttxt:nil];
    [self setAboutheading:nil];
    [self setAbouttxt:nil];
    [self setButFacebook:nil];
    [self setButAppStore:nil];
    [super viewDidUnload];
}


//fundet via graph.facebook.com
- (IBAction)GotoFacebook:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"fb://profile/570733792937527"]];
}

- (IBAction)GotoAppstore:(id)sender {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/us/app/kundalini-yoga/id598238037?l=da&ls=1&mt=8"]];
    
}
@end
