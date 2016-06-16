//
//  SecondTableViewController.m
//  TableViewPractice
//
//  Created by Sangwook's Macbook on 2016. 6. 15..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "SecondTableViewController.h"
#import "DataCenter.h"

@interface SecondTableViewController ()

@property (nonatomic, strong) NSArray *schoolTitles;
@property (nonatomic, strong) NSArray *campTitles;
@property (nonatomic, strong) DataCenter *dataCenter;


@end

@implementation SecondTableViewController

-(void)viewWillAppear:(BOOL)animated {
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataCenter = [DataCenter sharedInstance];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.schoolTitles = @[@"iOS",@"Android",@"Web", @"front"];
    self.campTitles = @[@"iOS입문", @"iOS초급", @"iOS중급"];
//    self.koreaWeather = [13도 흐림, @"서울",@"대전",@"대구",@"부산",@"제주"]};
//    self.worldWeather = {@[@"뉴욕",@"서울",@"도쿄",@"맬버른",@"타이페이"]};
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    return 3;
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.dataCenter dataForSection:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSMutableArray *data = [self.dataCenter dataForSection:indexPath.section];
    NSString *text = [data objectAtIndex:indexPath.row];
    [cell.textLabel setText:text];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    //    if(indexPath.section==0){
    //        return YES;
    //    }
    return YES;
    
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0){
        return UITableViewCellEditingStyleDelete;
    }
    return UITableViewCellEditingStyleInsert;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"commitEditingStyle");
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.dataCenter removeFirstSectionItemAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AdvancedCell" forIndexPath:indexPath];

    //segue로 넘겨주기.
    if (cell == nil) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AdvancedCell" forIndexPath:indexPath];
    }
    
    UIStoryboardSegue
    
    if (indexPath.section == 0) {
        cell.textLabel.text = self.schoolTitles[indexPath.row];
    }
    
//    if (indexPath.section == 1) {
//        cell.textLabel.text = self.koreaWeather[indexPath.row];
//    }else {
//        cell.textLabel.text = self.worldWeather[indexPath.row];
//    }
    
    return cell;
    
}*/






-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return @"패스트캠퍼스";
    } else {
        return @"날씨";
    }
}



/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
