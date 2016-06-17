//
//  SettingTableViewController.m
//  example0608
//
//  Created by Mookie on 2016. 6. 8..
//  Copyright © 2016년 Mookie. All rights reserved.
//

#import "SettingTableViewController.h"
#import "SettingTableViewCell.h"
#import "DataCenter.h"
#import "WeatherTableViewController.h"

@interface SettingTableViewController ()<SettingTableViewCellDelegate>

@property (nonatomic, strong) DataCenter *dataCenter;

@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //single Tone
    self.dataCenter = [DataCenter defaultData];
    
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
//섹션 갯수 설정
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataCenter numberOfSectionsForSettingTable];
}


//열 갯수 설정
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataCenter numberOfRowsForSectionInSettingTable:section];
}


//셀 생성
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *dataArray = [self.dataCenter settingTableDataForSection:indexPath.section];
    NSString *text = [dataArray objectAtIndex:indexPath.row];
    
    if(indexPath.section==0){
        SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell"];
        
        //재사용 할 que 가 없는 경우 생성
        if(cell == nil){
            cell = [[SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SettingCell"];
            cell.delegate = self;
        }
        [cell.textLabel setText:text];
        
        BOOL isFunctionOn = [self.dataCenter isOnForSetting:indexPath.row];
        NSLog(@"isFunctionOn : %zd", isFunctionOn);
        [cell.settingSwitch setOn:isFunctionOn];
        
        return cell;
        
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubtitleCell" forIndexPath:indexPath];
        [cell.textLabel setText:text];
        return cell;
        
    }
}

#pragma mark - Table view data source (optional)
//헤더 타이틀 설정
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.dataCenter settingTableHeaderTitleForSection:section];
}



#pragma mark - SettingTableViewCellDelegate
-(void)settingTableViewCellSwitchValueChanged:(SettingTableViewCell *)cell isOn:(BOOL)isOn{
    NSIndexPath *cellIndex = [self.tableView indexPathForCell:cell];
    NSLog(@"cellIndex : section(%zd) row(%zd) value : %d", cellIndex.section, cellIndex.row, isOn);
    [self.dataCenter setSetting:cellIndex.row isOn:isOn];
}


#pragma mark - UITableView delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"row selected: %ld - %ld", indexPath.section, indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *sender = [tableView cellForRowAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"ShowDetailWeather" sender:sender];
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell*)sender {
    /*뷰가 실제 push 되기 전에 push 되는 객체에 미리 값을 세팅 하고 싶은 경우*/
    
    WeatherTableViewController *tableViewController = segue.destinationViewController;
    
    if([sender.textLabel.text isEqualToString:@"한국날씨"]){
        tableViewController.weatherType = WeatherTypeKorea;
    }else{
        tableViewController.weatherType = WeatherTypeWorld;
    }
}


@end
