//
//  SchoolTableViewController.m
//  DatabaseStudy
//
//  Created by Sangwook's Macbook on 2016. 6. 22..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "SchoolTableViewController.h"
#import "AppDelegate.h"
#import "School+CoreDataProperties.h"

@interface SchoolTableViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic ,weak)AppDelegate *appDelegate;

@property (weak, nonatomic)NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic)NSString *saveNewSchoolEntity;

@property (weak, nonatomic) NSMutableArray<School *> *schools;

@end

@implementation SchoolTableViewController

-(IBAction)clickAddButton:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"school" message:@"추가할 school 이름 입력"preferredStyle:UIAlertControllerStyleAlert];
    
UIAlertAction *addAction = [UIAlertAction actionWithTitle:@"Add"
  style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){
  UITextField *field = alert.textFields.firstObject;
  NSString *inputText = field.text;
  
      if ([inputText length] !=0){
  NSLog(@"%@", inputText);
      [self saveNewSchoolEntity];
          [self.tableView reloadData];
  }
  }];
  UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:addAction];
    [alert addAction:cancelAction];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        [textField setPlaceholder:@"Shoole name"];
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)saveNewSchoolEntity: (NSString *)name{
    School *schoolToAdd = [NSEntityDescription insertNewObjectForEntityForName:@"School" inManagedObjectContext:self.managedObjectContext];
    
    schoolToAdd.name = name;
    
    [self.appDelegate saveContext];
    
    [self.schools addObject:schoolToAdd];
    [self.tableView reloadData];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    
    self.managedObjectContext = _appDelegate.managedObjectContext;
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"School"];
    
    NSError *fetchError = nil;
    
    [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    
    NSArray <School *> *fetchResult = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    
    NSLog(@"School array %@, fetch error : %@", fetchResult, fetchError);
    
    if (fetchError != nil) {
        NSLog(@"Error occured %@", fetchError);
    }else {
        NSLog(@"Fetch success");
        self.schools = [NSMutableArray arrayWithArray:fetchResult];
    }
    
    
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
    //NSLog(@"called");
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.schools.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"called");
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SchoolCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    School *schoolInfo = [self.schools objectAtIndex:indexPath.row];
    NSLog(@"school = %@",schoolInfo);
    
    cell.textLabel.text = schoolInfo.name;
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
