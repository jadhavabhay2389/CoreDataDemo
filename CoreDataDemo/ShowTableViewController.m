//
//  ShowTableViewController.m
//  CoreDataDemo
//
//  Created by Abhay Jadhav on 24/02/15.
//  Copyright (c) 2015 Abhay Jadhav. All rights reserved.
//

#import "ShowTableViewController.h"
#import <sqlite3.h>
@interface ShowTableViewController ()
{
sqlite3 *db;
    NSMutableArray * array;
}
@end

@implementation ShowTableViewController

- (void)viewDidLoad {
    
    array=[NSMutableArray new];
    NSArray * patharray=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * docDirectory=[patharray objectAtIndex:0];
    NSString * paste=[NSString stringWithFormat:@"%@/%@",docDirectory,@"PersonData"];
    
    NSLog(@"paste %@",paste);
    const char *dbFilePath= [paste UTF8String];
    if( sqlite3_open(dbFilePath, &db)!=SQLITE_OK)
    {
        NSLog(@"erro in opeing file");
    }
    
    
    
    
    sqlite3_stmt *stmt=nil;
    NSString *str=[NSString stringWithFormat:@"select * from Person"];
    const char *sql= [str UTF8String];
    
    int reply=sqlite3_prepare_v2(db, sql, -1, &stmt, NULL);
    NSLog(@"reply %d",reply);
    if(reply==SQLITE_OK)
    {
        while (sqlite3_step(stmt)==SQLITE_ROW)
        {
            [array addObject:[NSString stringWithFormat:@"%s %s %s",(char *)sqlite3_column_text(stmt, 0),(char *)sqlite3_column_text(stmt, 1),(char *)sqlite3_column_text(stmt, 2)]];
            }

    }

    sqlite3_finalize(stmt);
    
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [array count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellData" forIndexPath:indexPath];
    
     [cell.textLabel setText:[array objectAtIndex:indexPath.row]];
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
