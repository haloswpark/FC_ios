//
//  ViewController.m
//  TableViewExample
//
//  Created by youngmin joo on 2016. 6. 6..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "ViewController.h"

//데이터센터1번
#import "DataCenter.h"

@interface ViewController ()
//2. delegate선언
<UITableViewDelegate, UITableViewDataSource>
//delegate = 테이블 뷰가 어떻게 보일지에 대한 메소드, 셀의 높이/.
//datasource = 테이블뷰에 무엇을 보일지..셀, 셀제목, 섹션개수

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1. 테이블뷰 객체생성
    UITableView *myTableView = [[UITableView alloc]init];
    [myTableView setFrame:CGRectMake(0, 0, self.view.frame.size.width,
                                     self.view.frame.size.height)];
    //4. self지정
    myTableView.delegate = self;
    myTableView.dataSource = self;
    
    [self.view addSubview:myTableView];
}


//3. 데이터 소스 메소드 구현(불러와서 내용채워주기)
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 //   NSArray *myFruits = @[@"Apple",@"Banana",@"Coconut",@"Dragonfruit",];
//    NSArray *myFruits2 = [NSArray arrayWithObjects:@"",@"",@"", nil];
//    활성화 코드 = 리터럴 방식 / 주석처리 코드 = 원래 NSArray지정하여 처리하는 방식
    
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //하나의 셀을 생성
   
//    //데이터센터2번
//    DataCenter *sharedManager = [DataCenter defaultData];
//    NSDictionary *animals = [sharedManager allAnimals];
//    
//    
//    NSArray *animalsKeys = [animals allKeys];
//    //NSArray *realAnimals = [animals objectForKey:animalsKeys[indexPath.row]];
//    //반복문을 써야한다.
//    //for (그냥 반복, 반복회수를 알떄)// for-in(반복, 총회수를 모를때)
    
    
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    NSArray *myCities = @[@"런던",@"파리",@"이탈리아"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[myCities objectAtIndex:indexPath.row]] ;

    //[cell.textLabel setText:@"그냥 값을 넣을떄는 -->리터럴(문자열을 표현하는 방법1)"]
    //정수형으로 나왔을 경우에 사용
    //[cell.textLabel setText:[NSString stringWithFormat:@"%@ %ld",indexPath.section, indexPath.row]];
    
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//기억해야할것!
//1. 기본 테이블 뷰 객체 생성
//2. 싱글톤 객체 생성하기 (데이터센터-> 객체생성 -> 함수사용)



@end
