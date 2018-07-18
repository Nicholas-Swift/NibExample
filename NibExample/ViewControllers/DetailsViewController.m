//
//  DetailsViewController.m
//  NibExample
//
//  Created by Nick Swift on 7/18/18.
//  Copyright © 2018 Nick Swift. All rights reserved.
//

#import "DetailsViewController.h"

#import "InfoTableViewCell.h"
#import "CarouselTableViewCell.h"

@interface DetailsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  _tableView.delegate = self;
  _tableView.dataSource = self;
  _tableView.rowHeight = UITableViewAutomaticDimension;
  _tableView.estimatedRowHeight = 140;
  
  UINib *infoTableViewCellNib = [UINib nibWithNibName:@"InfoTableViewCell" bundle:nil];
  [_tableView registerNib:infoTableViewCellNib forCellReuseIdentifier:@"infoTableViewCell"];
  
  UINib *carouselTableViewCellNib = [UINib nibWithNibName:@"CarouselTableViewCell" bundle:nil];
  [_tableView registerNib:carouselTableViewCellNib forCellReuseIdentifier:@"carouselTableViewCell"];
}

# pragma mark - TableView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.section == 0) { // Carousel
    CarouselTableViewCell *carouselTableViewCell = [_tableView dequeueReusableCellWithIdentifier:@"carouselTableViewCell"];
    return carouselTableViewCell;
  } else if (indexPath.section == 1) { // Title + Info
    InfoTableViewCell *infoTableViewCell = [_tableView dequeueReusableCellWithIdentifier:@"infoTableViewCell"];
    infoTableViewCell.locationTitle.text = @"I am a location";
    return infoTableViewCell;
  } else {
    return nil;
  }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  if (section == 0) { // Carousel
    return 1;
  } else if (section == 1) { // Title + Info
    return 2;
  } else {
    return 0;
  }
}

@end
