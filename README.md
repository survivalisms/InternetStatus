# InternetStatus

This is a simple and easy to understand iOS app which checks connectivity to the internet and present a notification depending on what the output is.



## Reachability Sample
This sample uses Blocks to tell you when the interface state has changed. The blocks will be called on a BACKGROUND THREAD so you need to dispatch UI updates onto the main thread.

  // allocate a reachability object
	Reachability* reach = [Reachability reachabilityWithHostname:@"www.google.com"];

	// set the blocks 
	reach.reachableBlock = ^(Reachability*reach)
	{
		NSLog(@"REACHABLE!");
	};

	reach.unreachableBlock = ^(Reachability*reach)
	{
		NSLog(@"UNREACHABLE!");
	};

	// start the notifier which will cause the reachability object to retain itself!
	[reach startNotifier];

To show notifications using TSMessage, use the following code:
--------

```objective-c
    [TSMessage showNotificationInViewController:self
                                      withTitle:notificationTitle
                                    withMessage:notificationDescription
                                       withType:TSMessageNotificationTypeError];


    [TSMessage showNotificationInViewController:self
                                      withTitle:title
                                    withMessage:message
                                       withType:TSMessageNotificationTypeSuccess
                                   withDuration:15.0
                                   withCallback:^{
                                       // user dismissed callback
                                   }];
```
