//
//  DeliveryAddressTabViewCell.m
//  Phippy
//
//  Created by toby on 09/08/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "DeliveryAddressTabViewCell.h"

@interface DeliveryAddressTabViewCell()
@property (strong, nonatomic) IBOutlet UIView *groundView;

@end
@implementation DeliveryAddressTabViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.groundView.layer.cornerRadius = 8;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
