//
//  MoviePlayerViewController.m
//  Dybro Yoga
//
//  Created by Christian Andersen on 20/09/13.
//
//

#import "MoviePlayerViewController.h"
#import <MediaPlayer/MediaPlayer.h>

CGFloat kMovieViewOffsetX = 20.0;
CGFloat kMovieViewOffsetY = 20.0;

@interface MoviePlayerViewController ()


@property (retain) MPMoviePlayerController *moviePlayerController;

- (IBAction)overlayViewCloseButtonPress:(id)sender;
- (void)viewWillEnterForeground;
- (void)playMovieFile:(NSURL *)movieFileURL;
- (void)playMovieStream:(NSURL *)movieFileURL;

@end

@implementation MoviePlayerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil URL:(NSURL *)movieURL
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        /* Create a new movie player object. */
        self.moviePlayerController  = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
        
      //  [self.view addSubview:self.backgroundView];
        
        CGRect viewInsetRect = CGRectInset ([self.view bounds],
                                            kMovieViewOffsetX,
                                            kMovieViewOffsetY );
        /* Inset the movie frame in the parent view frame. */
        [[self.moviePlayerController view] setFrame:viewInsetRect];
        
        [self.moviePlayerController view].backgroundColor = [UIColor lightGrayColor];
        
        /* To present a movie in your application, incorporate the view contained
         in a movie player’s view property into your application’s view hierarchy.
         Be sure to size the frame correctly. */
        [self.view addSubview: [self.moviePlayerController view]];
        
        /* Play the movie! */
        [[self moviePlayerController] play];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
