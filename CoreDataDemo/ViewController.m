//
//  ViewController.m
//  CoreDataDemo
//
//  Created by Abhay Jadhav on 24/02/15.
//  Copyright (c) 2015 Abhay Jadhav. All rights reserved.
//

#import "ViewController.h"

#import "ShowTableViewController.h"
@interface ViewController () <UITextFieldDelegate>



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray * patharray=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * docDirectory=[patharray objectAtIndex:0];
    NSString * paste=[NSString stringWithFormat:@"%@/%@",docDirectory,@"PersonData"];
    
    NSLog(@"paste %@",paste);
    const char *dbFilePath= [paste UTF8String];
if( sqlite3_open(dbFilePath, &db)!=SQLITE_OK)
{
    NSLog(@"erro in opeing file");
}
    
    
//    NSLog(@"couint %d",count);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(UIButton *)sender {
    sqlite3_stmt *stmt=nil;
    NSString *str=[NSString stringWithFormat:@"insert into Person(fName,mName,lName) values ('%@','%@','%@')",self.fName.text,self.mName.text,self.lName.text];
    const char *sql= [str UTF8String];
    
    int reply=sqlite3_prepare_v2(db, sql, -1, &stmt, NULL);
    NSLog(@"reply %d",reply);
    if(reply==SQLITE_OK)
    {  NSLog(@"success %d",sqlite3_step(stmt));
    }
    
    
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ShowTableViewController *table=[story instantiateViewControllerWithIdentifier:@"ShowTableViewController"];
//    [self presentViewController:table animated:YES completion:nil];
    
    sqlite3_finalize(stmt);
    
    
    
}
@end
