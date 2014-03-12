//
//  ListOfBeaconsCell.m
//  EstimoteSample
//
//  Created by Rafał Kitta on 12.03.2014.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import "ListOfBeaconsCell.h"

@implementation ListOfBeaconsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor clearColor];
        
        // Initialization code
        _MACAdressLabel = [[UILabel alloc] init];
        _MACAdressLabel.backgroundColor = [UIColor clearColor];
        _MACAdressLabel.textColor = [UIColor darkGrayColor];
        _MACAdressLabel.textAlignment = NSTextAlignmentLeft;
        _MACAdressLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13.0f];
        _MACAdressLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.contentView addSubview:_MACAdressLabel];
        
        _majorLabel = [[UILabel alloc] init];
        _majorLabel.backgroundColor = [UIColor clearColor];
        _majorLabel.textColor = [UIColor darkGrayColor];
        _majorLabel.textAlignment = NSTextAlignmentLeft;
        _majorLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13.0f];
        _majorLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.contentView addSubview:_majorLabel];
        
        _minorLabel = [[UILabel alloc] init];
        _minorLabel.backgroundColor = [UIColor clearColor];
        _minorLabel.textColor = [UIColor darkGrayColor];
        _minorLabel.textAlignment = NSTextAlignmentLeft;
        _minorLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13.0f];
        _minorLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.contentView addSubview:_minorLabel];
        
        _rssiLabel = [[UILabel alloc] init];
        _rssiLabel.backgroundColor = [UIColor clearColor];
        _rssiLabel.textColor = [UIColor darkGrayColor];
        _rssiLabel.textAlignment = NSTextAlignmentLeft;
        _rssiLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:13.0f];
        _rssiLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.contentView addSubview:_rssiLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    CGRect rectInset = CGRectInset(rect, 10.f, 5.f);
    
//    self.contentView.frame = rectInset;
    
    CGSize MACSize = CGSizeMake(CGRectGetWidth(rectInset), 20.f);
    CGRect MACRect = CGRectMake(CGRectGetMinX(rectInset),
                                CGRectGetMinY(rectInset),
                                MACSize.width,
                                MACSize.height);
    _MACAdressLabel.frame = MACRect;
    
    CGSize majorSize = CGSizeMake(CGRectGetWidth(rectInset), 20.f);
    CGRect majorRect = CGRectMake(CGRectGetMinX(rectInset),
                                  CGRectGetMaxY(MACRect) + 5.f,
                                  majorSize.width,
                                  majorSize.height);
    _majorLabel.frame = majorRect;
    
    CGSize minorSize = CGSizeMake(CGRectGetWidth(rectInset), 20.f);
    CGRect minorRect = CGRectMake(CGRectGetMinX(rectInset),
                                  CGRectGetMaxY(majorRect) + 5.f,
                                  minorSize.width,
                                  minorSize.height);
    _minorLabel.frame = minorRect;
    
    CGSize rssiSize = CGSizeMake(CGRectGetWidth(rectInset), 20.f);
    CGRect rssiRect = CGRectMake(CGRectGetMinX(rectInset),
                                 CGRectGetMaxY(minorRect) + 5.f,
                                 rssiSize.width,
                                 rssiSize.height);
    _rssiLabel.frame = rssiRect;

}

#pragma mark - Setters

- (void)setMACAdress:(NSString *)MACAdress{
    _MACAdressLabel.text = [NSString stringWithFormat:@"MAC: %@", MACAdress];
    [self setNeedsLayout];
}

- (void)setMajor:(NSNumber *)major{
    _majorLabel.text = [NSString stringWithFormat:@"Major: %i", [major intValue]];
    [self setNeedsLayout];
}

- (void)setMinor:(NSNumber *)minor{
    _minorLabel.text = [NSString stringWithFormat:@"Minor: %i", [minor intValue]];
    [self setNeedsLayout];
}

- (void)setRSSI:(NSNumber *)rssi{
    NSString *rssiString = [NSString stringWithFormat:@"RSSI: %i dB", [rssi intValue]];
    _rssiLabel.text = rssiString;
    [self setNeedsLayout];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
