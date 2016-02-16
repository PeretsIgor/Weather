//
//  WeatherViewController.h
//  HWMapWeather
//
//  Created by Perets on 06.02.16.
//  Copyright © 2016 Perets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HWCityModel.h"


@interface WeatherViewController : UIViewController

@property (strong, nonatomic) HWCityModel *selectedCity;


@end
