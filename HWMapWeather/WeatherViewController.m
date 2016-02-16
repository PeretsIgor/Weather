//
//  WeatherViewController.m
//  HWMapWeather
//
//  Created by Perets on 06.02.16.
//  Copyright © 2016 Perets. All rights reserved.
//

#import "WeatherViewController.h"
#import <MapKit/MapKit.h>
#import "HWCityModel.h"


@interface WeatherViewController ()<MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *cityesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cityImage;
@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;


@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end


@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cityesLabel.text = self.selectedCity.name;
    self.cityImage.image = [UIImage imageNamed:self.selectedCity.cityImage];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    [self.locationManager startUpdatingLocation];
    [self.locationManager requestAlwaysAuthorization];
    
    
    self.mapView.region = MKCoordinateRegionMake(self.selectedCity.location.coordinate, MKCoordinateSpanMake(0.5, 0.5));
    
    
    
    __weak typeof(self) weakSelf = self;
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *urlString = @"http://api.openweathermap.org/data/2.5/weather?q=%@,uk&appid=65f6c419b8c8cf3fce590031a046f495&mine=true";
    urlString = [NSString stringWithFormat:urlString, self.selectedCity.name];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                __strong typeof(weakSelf) strongSelf = weakSelf;
                                                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                [strongSelf configurationScreenWithDictionary:json];
                                            }];
    [dataTask resume];
    
}

#pragma mark - weather parsing

- (void)configurationScreenWithDictionary:(NSDictionary *)weatherDictionary {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *nameCity = weatherDictionary[@"name"];
        self.cityesLabel.text = nameCity;
        NSDictionary *mainDictionary = weatherDictionary[@"main"];
        NSString *temperatureString = mainDictionary[@"temp"];
        NSInteger temp = [temperatureString integerValue];
        self.weatherLabel.text = [@(temp - 273) description];
    });
}


@end
