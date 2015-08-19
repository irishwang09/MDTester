//
//  NSObject+HardwareHandler.m
//  MDTester
//
//  Created by Irene Hwang on 8/18/15.
//  Copyright (c) 2015 Irene Hwang. All rights reserved.
//

#import "HardwareHandler.h"
@import CoreData;
@import UIKit;

@interface HardwareHandler()

@property NSMutableArray *actionArray;
@property NSMutableArray *actionNameArray;
@property NSMutableArray *contactsArray;
-(id)init;
-(void) hardwareAction: (NSArray *)array;

@end

@implementation HardwareHandler : NSObject

- (id)init
{
    self = [super init];
    [self refreshActionArray];
    [self refreshContactsArray]; 
    return self;
}

- (void) refreshActionArray
{
    NSMutableArray *newActionArray = [[NSMutableArray alloc] init];
    NSMutableArray *newActionNameArray = [[NSMutableArray alloc] init];
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"AutoAction" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    
    
    for (NSManagedObject *info in fetchedObjects) {
        NSMutableArray *newArray = [[NSMutableArray alloc] init];
        NSNumber *home = [[NSNumber alloc] init]; home = [NSNumber numberWithBool:false];
        NSNumber *volUp = [[NSNumber alloc] init]; volUp = [NSNumber numberWithBool:false];
        NSNumber *volDown = [[NSNumber alloc] init]; volDown = [NSNumber numberWithBool:false];
        NSNumber *power = [[NSNumber alloc] init]; home = [NSNumber numberWithBool:false];
        if ([info valueForKey:@"homeButton"])
        {
            home = [NSNumber numberWithBool:true];
        }
        if ([info valueForKey:@"volUpButton"])
        {
            volUp = [NSNumber numberWithBool:true];
        }
        if ([info valueForKey:@"volDownButton"])
        {
            volDown = [NSNumber numberWithBool:true];
        }
        if ([info valueForKey:@"powerButton"])
        {
            power = [NSNumber numberWithBool:true];
        }
        [newArray initWithObjects:home, volUp, volDown, power, nil];
        [newActionArray addObject:newArray];
        NSString *name = [[NSString alloc] init];
        name = [info valueForKey:@"name"];
        [newActionNameArray addObject:name];
    }
    self.actionNameArray = newActionNameArray;
    self.actionArray = newActionArray;
}
- (void) refreshContactsArray
{
    NSMutableArray *newContactsArray = [[NSMutableArray alloc] init];
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"AutoAction" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *contact in fetchedObjects)
    {
        NSMutableArray *newContact = [[NSMutableArray alloc] init];
        [newContact addObject:[contact valueForKey:@"status"]];
        [newContact addObject:[contact valueForKey:@"mobileNumber"]];
        [newContactsArray addObject:newContact];
    }
}
- (void) hardwareAction:(NSArray*) array
{
    for (int i = 0; i < self.actionArray.count; i++)
    {
        if ([self.actionArray containsObject:array])
        {
            NSString *actionName = [[NSString alloc] init];
            actionName = [[self.actionNameArray objectAtIndex:i] valueForKey:@"name"];
            if ([actionName isEqual: @"Send default message to friends and family"])
            {
                
            }
            else if ([actionName isEqual: @"Call guardian"])
            {
                
            }
            else if ([actionName isEqual: @"Sound alarm"])
            {
                
            }
            else if ([actionName isEqual: @"Call the police"])
            {
                
            }
            else if ([actionName isEqual: @"Alert others to crime"])
            {
                
            }
        }
    }
}
-(void) sendTextMessage
{
    
}
-(void) callGuardian
{
    for (NSMutableArray *contact in self.contactsArray)
    {
        if ([[contact objectAtIndex:0] isEqualToString:@"Guardian"])
        {
            NSString *mobileNO = [[NSString alloc] init];
            mobileNO = [contact objectAtIndex:1];
            NSString *phoneNumber = [@"tel://" stringByAppendingString:mobileNO];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
        }
    }
}
-(void) soundAlarm
{
    
}
-(void) callPolice
{
    
}
-(void) alertOthersToCrime
{
    
}

@end


