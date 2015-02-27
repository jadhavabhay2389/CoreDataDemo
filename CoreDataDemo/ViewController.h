//
//  ViewController.h
//  CoreDataDemo
//
//  Created by Abhay Jadhav on 24/02/15.
//  Copyright (c) 2015 Abhay Jadhav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ViewController : UIViewController{
    sqlite3 *db;
}
@property (weak, nonatomic) IBOutlet UITextField *fName;
@property (weak, nonatomic) IBOutlet UITextField *mName;
@property (weak, nonatomic) IBOutlet UITextField *lName;


- (IBAction)submit:(UIButton *)sender;

@end

