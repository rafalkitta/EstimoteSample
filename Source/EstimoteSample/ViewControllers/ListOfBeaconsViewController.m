//
//  ListOfBeaconsViewController.m
//  EstimoteSample
//
//  Created by Rafał Kitta on 12.03.2014.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import "ListOfBeaconsViewController.h"
#import "ListOfBeaconsCell.h"
#import "ListOfBeaconsView.h"
#import <ESTBeacon.h>
#import "ConnectedViewController.h"

@interface ListOfBeaconsViewController ()

@end

@implementation ListOfBeaconsViewController{
    __weak ListOfBeaconsView *_view;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView{
    // get app frame
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    
    // create and assign view
    ListOfBeaconsView* view = [[ListOfBeaconsView alloc] initWithFrame:rect];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.view = view;
    
    // save weak referance
    _view = view;
}

- (UITableView *)tableView {
    return _view.tableView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [_view.tableView setDelegate:self];
    [_view.tableView setDataSource:self];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _listOfBeacons.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ListOfBeaconsCell *cell = (ListOfBeaconsCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ListOfBeaconsCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    [self configureCell:cell
            atIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(ListOfBeaconsCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    ESTBeacon *beacon = [_listOfBeacons objectAtIndex:indexPath.row];
    [cell setMACAdress:beacon.macAddress];
    [cell setMajor:beacon.major];
    [cell setMinor:beacon.minor];
    [cell setRSSI:[NSNumber numberWithInteger:beacon.rssi]];
    //To powinno być tutaj czy wewnątrz ListOfBeaconsCell ??
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    
    ConnectedViewController *connectVC = [[ConnectedViewController alloc] initWithBeacon:[_listOfBeacons objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:connectVC
                                         animated:YES];
    
}

@end
