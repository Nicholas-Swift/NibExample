//
//  InfoTableViewCell.h
//  NibExample
//
//  Created by Nick Swift on 7/18/18.
//  Copyright © 2018 Nick Swift. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *locationTitle;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationDescriptionLabel;

@end
