//
//  KPViewController.h
//  InternetStatus
//
//  Created by Krish on 17/07/2013.
//
//

#import <UIKit/UIKit.h>

@interface KPViewController : UIViewController

	//Setting three toggles hooked up via Interface Builder
@property (weak, nonatomic) IBOutlet UISwitch *descriptionToggle;
@property (weak, nonatomic) IBOutlet UISwitch *longDurationToggle;
@property (weak, nonatomic) IBOutlet UISwitch *onBottomToggle;

	//Not needed but old habits die hard :p
- (IBAction)checkStatus:(id)sender;
- (IBAction)didTapDismissCurrentMessage:(id)sender;



@end
