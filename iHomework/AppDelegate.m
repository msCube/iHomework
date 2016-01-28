//
//  AppDelegate.m
//  iHomework
//
//  Created by 2 on 1/28/16.
//  Copyright © 2016 2. All rights reserved.
//

#import "AppDelegate.h"
#import "SMVEvent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)reastoreData {
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"events"];
    self.events = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    if(!self.events)
        self.events = [NSMutableArray new];
    
    NSLog(@"Data restored");
}

- (void)saveData {
    NSData *data =  [NSKeyedArchiver archivedDataWithRootObject:self.events];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"events"];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self reastoreData];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [self.events addObject:[[SMVEvent alloc]initWithName:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__] withDate:[NSDate date] withUUID:[SMVEvent getUUID]]];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self saveData];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [self.events addObject:[[SMVEvent alloc]initWithName:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__] withDate:[NSDate date] withUUID:[SMVEvent getUUID]]];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self.events addObject:[[SMVEvent alloc]initWithName:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__] withDate:[NSDate date] withUUID:[SMVEvent getUUID]]];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self.events addObject:[[SMVEvent alloc]initWithName:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__] withDate:[NSDate date] withUUID:[SMVEvent getUUID]]];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
