//
//  MyPageViewController.h
//  kundalini
//
//  Created by Christian Andersen on 07/11/12.
//
//

#import <UIKit/UIKit.h>


@interface MyPageViewController : UIViewController {
	UILabel *pageNumberLabel;
    int pageNumber;
}
@property (weak, nonatomic) IBOutlet UIButton *ButFacebook;
@property (weak, nonatomic) IBOutlet UIButton *ButAppStore;

@property (nonatomic, retain) IBOutlet UILabel *pageNumberLabel;
@property (weak, nonatomic) IBOutlet UITextView *Abouttxt;
- (IBAction)GotoFacebook:(id)sender;
- (IBAction)GotoAppstore:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *Aboutheading;

- (id)initWithPageNumber:(int)page;

@end