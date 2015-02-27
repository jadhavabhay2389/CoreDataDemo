//
//  Person.h
//  CoreDataDemo
//
//  Created by Abhay Jadhav on 24/02/15.
//  Copyright (c) 2015 Abhay Jadhav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * fName;
@property (nonatomic, retain) NSString * mName;
@property (nonatomic, retain) NSString * lName;

@end
