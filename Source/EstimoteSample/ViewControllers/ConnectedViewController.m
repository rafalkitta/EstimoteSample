//
//  ConnectedViewController.m
//  EstimoteSample
//
//  Created by Rafał Kitta on 14.03.2014.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import "ConnectedViewController.h"
#import "ConnectedView.h"

@interface ConnectedViewController (){
    __weak ConnectedView *_connectedView;
    
    ESTBeacon *_beacon;
    UIActivityIndicatorView *_spinner;
}

@end

@implementation ConnectedViewController

- (id)initWithBeacon:(ESTBeacon *)beacon{
    self = [super init];
    if (self) {
        _beacon = beacon;
        _beacon.delegate = self;
    }
    return self;
}

- (void)loadView{
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    
    // create and assign view
    ConnectedView* view = [[ConnectedView alloc] initWithFrame:rect];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.view = view;
    
    // save weak referance
    _connectedView = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo
                                                                                          target:self
                                                                                          action:@selector(backAction:)];
    
    _spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _spinner.center = CGPointMake(CGRectGetMidX(_connectedView.frame),
                                  CGRectGetMidY(_connectedView.frame));
    [_connectedView addSubview:_spinner];
    [_spinner startAnimating];

    [_beacon connectToBeacon];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupInfo{
    
    [_connectedView setPower:_beacon.power];
//    NSLog(@"power: %@", _beacon.power);
    [_connectedView setBatteryLevel:_beacon.batteryLevel];
    [_connectedView setHardwareVersion:_beacon.hardwareVersion];
    
}

#pragma mark ESTBeacon Delegate Methods

- (void)beaconConnectionDidSucceeded:(ESTBeacon *)beacon{
    if (beacon.isConnected) {
        NSLog(@"Beacon is connected.");
        [_spinner stopAnimating];
        _beacon = beacon;
        [self setupInfo];
    }
    else{
        NSLog(@"Beacon is not connected.");
    }

}

- (void)beaconDidDisconnect:(ESTBeacon *)beacon withError:(NSError *)error{
    if (!error) {
        NSLog(@"Beacon is disconnected");
    }
    else{
        NSLog(@"Error with disconnnection: %@", error);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)beaconConnectionDidFail:(ESTBeacon *)beacon withError:(NSError *)error{
    NSLog(@"Error with connection: %@", error);
    [self performSelector:@selector(backAction:) withObject:nil];
}


-(void)backAction:(UIButton *)sender{
    if (_beacon.isConnected){
        [_beacon disconnectBeacon];
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
