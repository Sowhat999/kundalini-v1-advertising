
@class MainViewController;
#import <UIKit/UIKit.h>


@interface MyImageView : UIImageView 
{
    IBOutlet MainViewController *viewController;
}

@property (nonatomic,retain) IBOutlet MainViewController *viewController;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end
