//
//  KPViewController.m
//  InternetStatus
//
//  Created by Krish on 17/07/2013.
//
//

#import "KPViewController.h"
	//Import needed headers
#import "Reachability.h"
#import "TSMessage.h"
#import "TSMessageView.h"
#import "SVProgressHUD.h"
	//Define the duration for when longDescriptionToggle is enabled
#define TSSecondViewControllerLongDuration 10.0

	//(private) is not needed - just something I use
@interface KPViewController (private)

	//Declaring private method
- (void)reachabilityChanged:(NSNotification*)note;

@end

@implementation KPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

	//Create button to check status method
- (IBAction)checkStatus:(id)sender
{
		//Reachability - https://github.com/tonymillion/Reachability
	[[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
		//Allocate a reachability object
    Reachability * reach = [Reachability reachabilityWithHostname:@"www.google.com"];
		//Set the blocks
    reach.reachableBlock = ^(Reachability * reachability)
	{
    };
    reach.unreachableBlock = ^(Reachability * reachability)
    {
    };
		//Start the notifier which will cause the reachability object to retain itself!
    [reach startNotifier];
}

	//Create button to dismiss method
- (IBAction)didTapDismissCurrentMessage:(id)sender;
{
	[TSMessage dismissActiveNotification];
}



-(void)reachabilityChanged:(NSNotification*)note
{
    Reachability * reach = [note object];
    
    if([reach isReachable])
    {
			//If internet is available...
		NSLog(@"Reachable.2");
			//TSMessages - https://github.com/toursprung/TSMessages
		NSString *notificationTitle = NSLocalizedString(@"Network available", nil);
		NSString *notificationDescription = (self.descriptionToggle.on ?
											 NSLocalizedString(@"Internet available", nil) :
											 nil);
		
		CGFloat duration = (self.longDurationToggle.on ? TSSecondViewControllerLongDuration : 0.0);
		
		[TSMessage showNotificationInViewController:self
										  withTitle:notificationTitle
										withMessage:notificationDescription
										   withType:TSMessageNotificationTypeSuccess
									   withDuration:duration
									   withCallback:^{}
										 atPosition:(self.onBottomToggle.on ? TSMessageNotificationPositionBottom : TSMessageNotificationPositionTop)];
			//SVProgressHUD to visually confirm connection - https://github.com/samvermette/SVProgressHUD
		[SVProgressHUD showSuccessWithStatus:@"Checked and succeeded!"];
    }
    else
    {
			//If internet is not available...
		NSLog(@"Unreachable.2");
			//TSMessages - https://github.com/toursprung/TSMessages
		NSString *notificationTitle = NSLocalizedString(@"Network Error", nil);
		NSString *notificationDescription = (self.descriptionToggle.on ?
											 NSLocalizedString(@"Internet unavailable - Please check your network connection", nil) :
											 nil);
		
		CGFloat duration = (self.longDurationToggle.on ? TSSecondViewControllerLongDuration : 0.0);
		
		[TSMessage showNotificationInViewController:self
										  withTitle:notificationTitle
										withMessage:notificationDescription
										   withType:TSMessageNotificationTypeError
									   withDuration:duration
									   withCallback:^{
										   [TSMessage showNotificationInViewController:self
																			 withTitle:NSLocalizedString(@"You dismisses it", nil)
																		   withMessage:nil
																			  withType:TSMessageNotificationTypeSuccess];
									   }
										 atPosition:(self.onBottomToggle.on ? TSMessageNotificationPositionBottom : TSMessageNotificationPositionTop)];
    }
}

@end
