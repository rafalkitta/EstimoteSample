//
//  MainViewController.m
//  EstimoteSample
//
//  Created by Rafał Kitta on 07.03.2014.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"

@interface MainViewController ()

@end

@implementation MainViewController{
    __weak MainView *_mainView;
    
    ESTBeaconManager *_beaconManager;
    ESTBeacon *_selectedBeacon;
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
    _mainView.label.text = @"Nie znaleziono...";
//    [_mainView.beaconImageView changeYCoordinate:[NSNumber numberWithInt:-90]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Manager setup

- (void)setupManager
{
    // create manager instance
    _beaconManager = [[ESTBeaconManager alloc] init];
    _beaconManager.delegate = self;
    
    // create sample region object (you can additionaly pass major / minor values)
    ESTBeaconRegion* region = [[ESTBeaconRegion alloc] initWithProximityUUID:ESTIMOTE_PROXIMITY_UUID
                                                                  identifier:@"EstimoteSampleRegion"];
    
    // start looking for estimote beacons in region
    // when beacon ranged beaconManager:didRangeBeacons:inRegion: invoked
    [_beaconManager startRangingBeaconsInRegion:region];
}

#pragma mark - ESTBeaconManagerDelegate Implementation

-(void)beaconManager:(ESTBeaconManager *)manager
     didRangeBeacons:(NSArray *)beacons
            inRegion:(ESTBeaconRegion *)region
{
    if([beacons count] > 0)
    {
        
        if(!_selectedBeacon)
        {
            // initialy pick closest beacon
            _selectedBeacon = [beacons objectAtIndex:0];
        }
        else
        {
            for (ESTBeacon* cBeacon in beacons)
            {
                // update beacon it same as selected initially
                if([_selectedBeacon.major unsignedShortValue] == [cBeacon.major unsignedShortValue] &&
                   [_selectedBeacon.minor unsignedShortValue] == [cBeacon.minor unsignedShortValue])
                {
                    _selectedBeacon = cBeacon;
                }
            }
        }
        
        NSNumber *num = [[NSNumber alloc] initWithInt:_selectedBeacon.rssi];
        [_mainView.beaconImageView changeYCoordinate:num];
        
        NSString* labelText = [NSString stringWithFormat:
                               @"Major: %i, Minor: %i\nRegion: ",
                               [_selectedBeacon.major unsignedShortValue],
                               [_selectedBeacon.minor unsignedShortValue]];
        
        switch (_selectedBeacon.proximity)
        {
            case CLProximityUnknown:
                labelText = [labelText stringByAppendingString: @"Unknown"];
                break;
            case CLProximityImmediate:
                labelText = [labelText stringByAppendingString: @"Immediate"];
                break;
            case CLProximityNear:
                labelText = [labelText stringByAppendingString: @"Near"];
                break;
            case CLProximityFar:
                labelText = [labelText stringByAppendingString: @"Far"];
                break;
                
            default:
                break;
        }
        
        _mainView.label.text = labelText;
    }
}

@end