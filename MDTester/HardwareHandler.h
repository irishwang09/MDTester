//
//  NSObject+HardwareHandler.h
//  MDTester
//
//  Created by Irene Hwang on 8/18/15.
//  Copyright (c) 2015 Irene Hwang. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface HardwareHandler : NSObject
/*+ (void) hardwareAction:(NSArray*)array;
+ (void) refreshActionArray;*/
+ (instancetype) getHardwareHandler;
- (void) hardwareAction:(NSArray*) array; 
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@end
