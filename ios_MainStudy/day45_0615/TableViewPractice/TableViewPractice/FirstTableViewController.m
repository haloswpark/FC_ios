//
//  FirstTableViewController.m
//  TableViewPractice
//
//  Created by Sangwook's Macbook on 2016. 6. 15..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "FirstTableViewController.h"

@interface FirstTableViewController ()

@property (nonatomic, strong) NSArray *fastCampusTitles;
@property (nonatomic, strong) NSMutableArray *weatherTitles;

@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fastCampusTitles = @[@"School",@"Camp"];
    self.weatherTitles = [NSMutableArray arrayWithObjects:@"한국",@"세계",nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicCell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        cell.textLabel.text = self.fastCampusTitles[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDetailButton;
        cell.backgroundColor = [UIColor purpleColor];
        cell.textLabel.textColor = [UIColor whiteColor];
    } else {
        cell.textLabel.text = self.weatherTitles[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
  
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return @"패스트캠퍼스";
    } else {
        return @"날씨";
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        return 100.0;
    }
    
    return 40;
}



    
    //if문을 활용해서 섹션이 0일떄 섹션이 1일때에 따라 셀의 텍스트를 다르게 설정
    //indexpath.row //어레이 사용하여 나타내주는 코드 -> 하지만, 코드를 보기 어려웠고, 상당히 더러웠음.

    /*    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"School";
        }else cell.textLabel.text = @"Camp";
    }else {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"한국날씨";
        }else cell.textLabel.text = @"세계날씨";
    }
    
    //일정한 텍스트 값을 지정해줄 때 사용함
    //cell.textLabel.text = @"상욱이";
    
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
