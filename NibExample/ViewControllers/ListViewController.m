//
//  ViewController.m
//  NibExample
//
//  Created by Nick Swift on 7/18/18.
//  Copyright © 2018 Nick Swift. All rights reserved.
//

#import "ListViewController.h"

#import "InfoTableViewCell.h"
#import "CarouselTableViewCell.h"

@interface ListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ListViewController

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

# pragma mark - UITableViewDelegate, UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  if (indexPath.row == 0) {
    InfoTableViewCell *infoTableViewCell = [_tableView dequeueReusableCellWithIdentifier:@"infoTableViewCell"];
    infoTableViewCell.locationTitle.text = @"I am a location";
    return infoTableViewCell;
  } else { // indexPath.row == 1
    CarouselTableViewCell *carouselTableViewCell = [_tableView dequeueReusableCellWithIdentifier:@"carouselTableViewCell"];
    return carouselTableViewCell;
  }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
  return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 2;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self performSegueWithIdentifier:@"detailsvc" sender:nil];
}

@end
