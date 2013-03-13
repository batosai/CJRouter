CJRouter is a library for iOS.

This library is used to launch an application on a specified controller.
For example, open the app directly on the details of a news item

### Installation
1 - Add library<br />
2 - Create URL Schemes<br />
3 - Edit file projectDelegate.m<br />
4 - Create Router.plist

### Sample access

myapp://view1<br />
myapp://view1?param=hello

### 1 - Add library

Download CJRouter library and included in project.

### 2 - Create URL Schemes

Step 1. Edit the info.plist<br />
Step 2. Right-Click and “Add Row”<br />
Step 3. Select “URL types” as the Key<br />
Step 4. Expand “Item 1″ and provide a value for the URL identifier. This can be any value, but the convention is to use a “reverse domain name” (ex “com.myapp”).<br />
Step 5. Add another row, this time to “Item 1″.<br />
Step 6. Select “URL Schemes” as the Key.<br />
Step 7. Enter the characters that will become your URL scheme (e.g. “myapp://” would be “myapp”). It is possible for more than one scheme to be registered by adding to this section though that would be strange thing to do.

### 3 - File projectDelegate.m

``` objective-c
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    [[CJRouter sharedCJRouter] setDelegate:self.window.rootViewController];
    [[CJRouter sharedCJRouter] launchControllerAtRoute:url];

    return YES;
}
```

### 4 - Create Router.plist - Sample

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Routes</key>
    <dict>
        <key>view1</key>
        <dict>
            <key>class</key>
            <string>CJView1Controller</string>
            <key>properties</key>
            <dict>
                <key>modalTransitionStyle</key>
                <integer>1</integer>
                <key>uid</key>
                <integer>3</integer>
                <key>framestring</key>
                <string>{{10, 10}, {200, 25}}</string>
            </dict>
        </dict>
        <key>view2</key>
        <dict>
            <key>method</key>
            <dict>
                <key>param1</key>
                <string>CJView2Controller</string>
                <key>name</key>
                <string>initWithNibName</string>
            </dict>
            <key>class</key>
            <string>CJView2Controller</string>
        </dict>
    </dict>
</dict>
</plist>
```

### SMART BANNER

Consult [apple doc](http://developer.apple.com/library/ios/#documentation/AppleApplications/Reference/SafariWebContent/PromotingAppswithAppBanners/PromotingAppswithAppBanners.html) for use smart banner with CJRouter

example :
```xml
<meta name="apple-itunes-app" content="app-id=myAppStoreID, app-argument=myapp://view1?param=hello" />
```

### ARC

If you are using CJRouter in your non-arc project, you will need to set a `-fno-objc-arc` compiler flag.

To set a compiler flag in Xcode, go to your active target and select the "Build Phases" tab. Now select all CJRouter source files, press Enter, insert `-fno-objc-arc` and then "Done" to enable or disable ARC.

### Creators
[Jérémy Chaufourier](http://github.com/batosai)  
[@chaufourier](https://twitter.com/chaufourier)