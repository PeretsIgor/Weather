//
//  HWCityModel.m
//  HWMapWeather
//
//  Created by Perets on 07.02.16.
//  Copyright © 2016 Perets. All rights reserved.
//

#import "HWCityModel.h"
#import <CoreLocation/CoreLocation.h>

@interface HWCityModel ()

@property(nonatomic, copy, readwrite) NSString *name;
@property(nonatomic, strong, readwrite) CLLocation *location;
@property(nonatomic, copy, readwrite) NSString *cityImage;

@end

@implementation HWCityModel

+ (instancetype)cityWithName:(NSString *)theName latitude:(CGFloat)theLatitude longtitude:(CGFloat)theLongtitude cityImage:(NSString *)theCityImage
{
    CLLocation *location = [[CLLocation alloc] initWithLatitude:theLatitude
                                                      longitude:theLongtitude];
    
    HWCityModel *model = [[HWCityModel alloc] initWithName:theName location:location
                                                              cityImage:theCityImage];
    
    return model;
}

- (instancetype)initWithName:(NSString *)theName location:(CLLocation *)theLocation cityImage:(NSString *)theCityImage
{
    self = [super init];
    
    if (self)
    {
        _name = theName;
        _location = theLocation;
        _cityImage = theCityImage;
    }
    
    return self;
}

@end
