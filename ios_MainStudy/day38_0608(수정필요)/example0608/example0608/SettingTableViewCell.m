//
//  SettingTableViewCell.m
//  example0608
//
//  Created by Mookie on 2016. 6. 8..
//  Copyright © 2016년 Mookie. All rights reserved.
//

#import "SettingTableViewCell.h"

@implementation SettingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

-(void)switchValueChanged:(UISwitch*)sender{
    NSLog(@"SWITCH %d", sender.isOn);
    [self.delegate settingTableViewCellSwitchValueChanged:self isOn:sender.isOn];
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//커스텀
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self.titleLabel == nil){
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 30.0f)];
        [self addSubview:self.titleLabel];
    }
    
    if (self.settingSwitch == nil){
        self.settingSwitch = [[UISwitch alloc] init];
        self.accessoryView = self.settingSwitch;
        
        [self.settingSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}

@end
