//
//  MoviePlayerViewController.h
//  Dybro Yoga
//
//  Created by Christian Andersen on 20/09/13.
//
//

#import <UIKit/UIKit.h>

@interface MoviePlayerViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIView *backgroundView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil URL:(NSURL *)movieURL;

@end


