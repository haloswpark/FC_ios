//
//  ViewController.m
//  TabbarControllerExample
//
//  Created by Sangwook's Macbook on 2016. 6. 14..
//  Copyright © 2016년 swpark. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"

@interface ViewController ()
<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *writeTV;
@property (strong, nonatomic)DataCenter *dataCenter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.writeTV.delegate = self;
    
    //DataCenter 객체를 만들어 준다
    self.dataCenter = [DataCenter sharedInstance];
}

- (void)textViewDidChange:(UITextView *)textView;
{
    self.TVlabel.text = self.writeTV.text;
    self.dataCenter.tempString = textView.text;
}

- (IBAction)touched:(id)sender {
    
    NSLog(@"touched");
    [self.writeTV resignFirstResponder];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
