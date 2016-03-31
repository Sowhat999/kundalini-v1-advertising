//
//  AboutViewController.h
//  kundalini
//
//  Created by Christian Andersen on 12/10/12.
//
//

#import <UIKit/UIKit.h>
#import "MyPageViewController.h"

@interface AboutViewController : UIViewController<UIScrollViewDelegate> {
	UIScrollView *scrollView;
	UIPageControl *pageControl;
    NSMutableArray *viewControllers;
	
    // To be used when scrolls originate from the UIPageControl
    BOOL pageControlUsed;
}
- (IBAction)Goback:(id)sender;


@property (weak, nonatomic) IBOutlet UIView *coontentView;
@property (nonatomic, retain) IBOutlet UIPageControl *pageControl;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) NSMutableArray *viewControllers;
@property (weak, nonatomic) IBOutlet UIButton *callDybroUrl;
@property (strong, nonatomic) IBOutlet UIView *portrait;
@property (strong, nonatomic) IBOutlet UIView *landscape;
@property (weak, nonatomic) IBOutlet UIButton *butSnakeApps;

- (IBAction)changePage:(id)sender;
- (IBAction)GotoDybro:(id)sender;
- (IBAction)GotoSnakeApps:(id)sender;

@end



