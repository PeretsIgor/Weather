//
//  HWCityModel.h
//  HWMapWeather
//
//  Created by Perets on 07.02.16.
//  Copyright © 2016 Perets. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CLLocation;

@interface HWCityModel : NSObject

@property(nonatomic, copy, readonly) NSString *name;
@property(nonatomic, strong, readonly) CLLocation *location;
@property(nonatomic, copy, readonly) NSString *cityImage;

+ (instancetype)cityWithName:(NSString *)theName latitude:(CGFloat)theLatitude longtitude:(CGFloat)theLongtitude cityImage:(NSString *)theCityImage;

@end
