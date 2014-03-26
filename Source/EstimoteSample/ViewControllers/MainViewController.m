//
//  MainViewController.m
//  EstimoteSample
//
//  Created by Rafał Kitta on 07.03.2014.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
#import "ListOfBeaconsViewController.h"
#import "MyBeaconManager.h"

@interface MainViewController ()

@end

@implementation MainViewController{
    __weak MainView *_mainView;

    NSMutableArray *_allBeacons;
}

- (void)loadView{
    // get app frame
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    
    // create and assign view
    MainView* view = [[MainView alloc] initWithFrame:rect];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.view = view;
    
    // save weak referance
    _mainView = view;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    __unused MyBeaconManager *manager = [MyBeaconManager sharedInstance];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"All"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(showListOfAllBeacons)];

    _mainView.label.text = @"Nie znaleziono...";
    [_mainView.beaconImageView changeYCoordinate:[NSNumber numberWithInt:-90]];
    _allBeacons = [[NSMutableArray alloc] init];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(handleBeaconInfoNotification:)
                   name:kBeaconsInfoNotification
                 object:nil];
    
}

#pragma mark - Showing ListViewController

- (void)showListOfAllBeacons{
    if(_allBeacons.count == 0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"Brak urządzeń w zasięgu."
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }else
    {
        ListOfBeaconsViewController *listViewController = [[ListOfBeaconsViewController alloc] init];
        listViewController.listOfBeacons = _allBeacons;
        [self.navigationController pushViewController:listViewController
                                             animated:YES];
    }
}

#pragma mark - Handling Notifications

- (void)handleBeaconInfoNotification:(NSNotification *)paramNotification{
    
    _allBeacons = [NSMutableArray arrayWithArray:paramNotification.userInfo[kBeaconsInfoKeyArrayOfAll]];
    [_mainView.beaconImageView changeYCoordinate:paramNotification.userInfo[kBeaconsInfoKeyNewY]];
    _mainView.label.text = paramNotification.userInfo[kBeaconsInfoKeyLabelString];

}

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
