# InternetStatus

This is a simple and easy to understand iOS app which checks connectivity to the internet and present a notification depending on what the output is.

The app is pre-setup and just requires a build.

Otherwise install using the button below.

<!-- MacBuildServer Install Button -->
<div class="macbuildserver-block">
    <a class="macbuildserver-button" href="http://macbuildserver.com/project/github/build/?xcode_project=InternetStatus.xcodeproj&amp;target=InternetStatus&amp;repo_url=git%3A%2F%2Fgithub.com%2Fsurvivalisms%2FInternetStatus.git&amp;build_conf=Release" target="_blank"><img src="http://com.macbuildserver.github.s3-website-us-east-1.amazonaws.com/button_up.png"/></a><br/><sup><a href="http://macbuildserver.com/github/opensource/" target="_blank">by MacBuildServer</a></sup>
</div>
<!-- MacBuildServer Install Button -->


## Reachability Sample
This sample uses Blocks to tell you when the interface state has changed.

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
