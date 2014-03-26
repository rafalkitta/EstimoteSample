//
//  MyBeaconManager.m
//  EstimoteSample
//
//  Created by Rafał Kitta on 3/26/14.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import "MyBeaconManager.h"

NSString * const kBeaconsInfoNotification = @"BeaconsInfoNotification";
NSString * const kBeaconsInfoKeyArrayOfAll = @"BeaconsInfoKeyArrayOfAll";
NSString * const kBeaconsInfoKeyNewY = @"BeaconsInfoKeyNewY";
NSString * const kBeaconsInfoKeyLabelString = @"BeaconsInfoKeyLabelString";

@implementation MyBeaconManager{
    ESTBeaconManager *_beaconManager;
    ESTBeacon *_selectedBeacon;
    NSMutableArray *_allBeacons;
}

+ (instancetype)sharedInstance{
    static MyBeaconManager *SharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SharedInstance = [[MyBeaconManager alloc] init];
    });
    return SharedInstance;
}

- (instancetype)init{
    self = [super init];
    if (self != nil){
        [self setupManager];
    }
    return self;
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

- (void)beaconManager:(ESTBeaconManager *)manager
      didRangeBeacons:(NSArray *)beacons
             inRegion:(ESTBeaconRegion *)region
{
    if([beacons count] > 0)
    {
        _allBeacons = [NSMutableArray arrayWithArray:beacons];
        _selectedBeacon = [beacons objectAtIndex:0];
        
        NSNumber *num = [[NSNumber alloc] initWithLong:(long)_selectedBeacon.rssi];
        
        NSString* labelText = [NSString stringWithFormat:
                               @"Major: %i, Minor: %i\nRegion: ",
                               [_selectedBeacon.major unsignedShortValue],
                               [_selectedBeacon.minor unsignedShortValue]];
        //        NSLog(@"%@",_selectedBeacon.proximityUUID);
        
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
        
        NSNotification *notification = [NSNotification notificationWithName:kBeaconsInfoNotification
                                                                     object:self
                                                                   userInfo:@{kBeaconsInfoKeyArrayOfAll : _allBeacons,
                                                                              kBeaconsInfoKeyNewY : num,
                                                                              kBeaconsInfoKeyLabelString : labelText}];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }
}

@end
