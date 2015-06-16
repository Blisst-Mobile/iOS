//
//  BLListTableViewCell.m
//  Blisst
//
//  Created by Andrew Breckenridge on 5/25/14.
//  Copyright (c) 2014 Andrew Breckenridge. All rights reserved.
//

#import "BLListTableViewCell.h"

@implementation BLListTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier list:(BLListObject *)list
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.text = @"yo";
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
