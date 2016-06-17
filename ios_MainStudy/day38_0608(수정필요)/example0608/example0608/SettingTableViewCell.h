//
//  SettingTableViewCell.h
//  example0608
//
//  Created by Mookie on 2016. 6. 8..
//  Copyright © 2016년 Mookie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingTableViewCell;

@protocol SettingTableViewCellDelegate <NSObject>

- (void)settingTableViewCellSwitchValueChanged:(SettingTableViewCell *)cell isOn:(BOOL)isOn;

@end

@interface SettingTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UISwitch *settingSwitch;
@property (nonatomic, weak) id<SettingTableViewCellDelegate> delegate;

@end
