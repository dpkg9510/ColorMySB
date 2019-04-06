#import <SpringBoard/SpringBoard.h>
#import "ColorMySB.h"

NSMutableDictionary * preferences;

static int wifiOption;
static int cellOption;
static int textOption;
static int imgOption;


//annoy pirates
%hook SpringBoard

-(void)applicationDidFinishLaunching:(id)application {
if ([[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/com.dpkg.colormysb.list"]) 
{
	%orig;
} 
else {
%orig;
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"ColorMySB" message:@"Please use the official version from: https://dpkg9510.github.io/" preferredStyle:UIAlertControllerStyleAlert];
	[alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
	[self.keyWindow.rootViewController dismissViewControllerAnimated:YES completion:NULL];
}]];
	
	[self.keyWindow.rootViewController presentViewController:alertController animated:YES completion:NULL];
}
}
%end

//Wifi Color
%hook _UIStatusBarWifiSignalView

    -(void)_colorsDidChange {
if (wifiOption == 0) {
            %orig;
}else if (wifiOption == 1) {
             %orig;
            self.activeColor = [UIColor redColor];
}else if (wifiOption == 2) {
            %orig;
            self.activeColor = [UIColor blueColor];
}else if (wifiOption == 3) {
            %orig;
            self.activeColor = [UIColor cyanColor];
}else if (wifiOption == 4) {
            %orig;
            self.activeColor = [UIColor magentaColor];
}else if (wifiOption == 5) {
            %orig;
            self.activeColor = [UIColor yellowColor];
}else if (wifiOption == 6) {
            %orig;
            self.activeColor = [UIColor orangeColor];
}else if (wifiOption == 7) {
            %orig;
            self.activeColor = [UIColor greenColor];
}else if (wifiOption == 8) {
            %orig;
            self.activeColor = [UIColor grayColor];
}
}
%end

//Cellular Signals
%hook _UIStatusBarCellularSignalView

    -(void)_colorsDidChange {
      if (cellOption == 0) {
            %orig;
}else if (cellOption == 1) {
            %orig;
            self.activeColor = [UIColor redColor];
}else if (cellOption == 2) {
            %orig;
            self.activeColor = [UIColor blueColor];
}else if (cellOption == 3) {
            %orig;
            self.activeColor = [UIColor cyanColor];
}else if (cellOption == 4) {
            %orig;
            self.activeColor = [UIColor magentaColor];
}else if (cellOption == 5) {
            %orig;
            self.activeColor = [UIColor yellowColor];
}else if (cellOption == 6) {
            %orig;
            self.activeColor = [UIColor orangeColor];
}else if (cellOption == 7) {
            %orig;
            self.activeColor = [UIColor greenColor];
}else if (cellOption == 8) {
            %orig;
            self.activeColor = [UIColor grayColor];
}
}
%end

//Text (needs to be separated)
%hook _UIStatusBarStringView

 -(void)setTextColor:(UIColor *)color {
if (textOption == 0) {
            %orig();
}else if (textOption == 1) {
            %orig(UIColor.redColor);
}else if (textOption == 2) {
            %orig(UIColor.blueColor);
}else if (textOption == 3) {
            %orig(UIColor.cyanColor);
}else if (textOption == 4) {
            %orig(UIColor.magentaColor);
}else if (textOption ==5) {
            %orig(UIColor.yellowColor);
}else if (textOption == 6) {
            %orig(UIColor.orangeColor);
}else if (textOption == 7) {
            %orig(UIColor.greenColor);
}else if (textOption == 8) {
            %orig(UIColor.grayColor);
}
}

%end

//Items (needs to be separated)
%hook _UIStatusBarImageView
    -(void)tintColorDidChange {
if (wifiOption == 0) {
            %orig;
}else if (imgOption == 1) {
            self.tintColor = [UIColor redColor];
}else if (imgOption == 2) {
            self.tintColor = [UIColor blueColor];
}else if (imgOption == 3) {
            self.tintColor = [UIColor cyanColor];
}else if (imgOption == 4) {
            self.tintColor = [UIColor magentaColor];
}else if (imgOption == 5) {
            self.tintColor = [UIColor yellowColor];
}else if (imgOption == 6) {
            self.tintColor = [UIColor orangeColor];
}else if (imgOption == 7) {
            self.tintColor = [UIColor greenColor];
}else if (imgOption == 8) {
            self.tintColor = [UIColor grayColor];
}
}
%end


//end

//prefs
static void loadPrefs() {
	static NSString * file = @"/User/Library/Preferences/com.dpkg.colormysb.plist";
	NSMutableDictionary * preferences = [[NSMutableDictionary alloc] initWithContentsOfFile:file];

	if(!preferences) {
		preferences = [[NSMutableDictionary alloc] init];
	} else {
		
		wifiOption = [[preferences objectForKey:@"wifiOption"] intValue];
		cellOption = [[preferences objectForKey:@"cellOption"] intValue];
             textOption = [[preferences objectForKey:@"textOption"] intValue];
             imgOption = [[preferences objectForKey:@"imgOption"] intValue];

	}
	
}

static NSString *nsNotificationString = @"com.dpkg.colormysb/preferences.changed";
static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
	loadPrefs();
}

%ctor {
	
	loadPrefs();
	notificationCallback(NULL, NULL, NULL, NULL, NULL);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)nsNotificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);


}

