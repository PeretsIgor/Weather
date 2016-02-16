//
//  ViewController.m
//  HWMapWeather
//
//  Created by Perets on 06.02.16.
//  Copyright © 2016 Perets. All rights reserved.
//

#import "ViewController.h"
#import "WeatherViewController.h"
#import "CapitalTableViewCell.h"
#import "HWCityModel.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *objects;

@property (strong, nonatomic) HWCityModel *selectedCity;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HWCityModel *amsterdam = [HWCityModel cityWithName:@"Amsterdam" latitude:52.5 longtitude:4.7 cityImage:@"Amsterdam.jpg"];
    HWCityModel *AndorraLaVella = [HWCityModel cityWithName:@"Andorra la Vella" latitude:42.3 longtitude:1.3 cityImage:@"Andorra Capital1.jpg"];
    HWCityModel *Athens = [HWCityModel cityWithName:@"Athens" latitude:38.1 longtitude:23.7 cityImage:@"athens.jpg"];
    HWCityModel *Belgrade = [HWCityModel cityWithName:@"Belgrade" latitude:44 longtitude:20 cityImage:@"Belgrade.jpg"];
    HWCityModel *Berlin = [HWCityModel cityWithName:@"Berlin" latitude:52.4 longtitude:13.2 cityImage:@"berlin.jpg"];
    HWCityModel *Bern = [HWCityModel cityWithName:@"Bern" latitude:46.5 longtitude:7.2 cityImage:@"Bern.jpg"];
    HWCityModel *Bratislava = [HWCityModel cityWithName:@"Bratislava" latitude:48 longtitude:17 cityImage:@"Bratislava.jpg"];
    HWCityModel *Brussels = [HWCityModel cityWithName:@"Brussels" latitude:50.5 longtitude:4.2 cityImage:@"brussels_sightseeing.jpg"];
    HWCityModel *Bucharest = [HWCityModel cityWithName:@"Bucharest" latitude:44.2 longtitude:26.7 cityImage:@"Bucharest.original.368.jpg"];
    HWCityModel *Budapest = [HWCityModel cityWithName:@"Budapest" latitude:47.3 longtitude:19.5 cityImage:@"Budapest_at_night.jpg"];
    HWCityModel *Chisinau = [HWCityModel cityWithName:@"Chisinau" latitude:47 longtitude:28.5 cityImage:@"Chisinau.jpeg"];
    HWCityModel *Copenhagen = [HWCityModel cityWithName:@"Copenhagen" latitude:55.4 longtitude:12.3 cityImage:@"Copenhagen.jpeg"];
    HWCityModel *Dublin = [HWCityModel cityWithName:@"Dublin" latitude:53.2 longtitude:6.1 cityImage:@"Dublin.jpg"];
    HWCityModel *Helsinki = [HWCityModel cityWithName:@"Helsinki" latitude:60.1 longtitude:25 cityImage:@"Helsinki.jpg"];
    HWCityModel *Lisbon = [HWCityModel cityWithName:@"Lisbon" latitude:38.4 longtitude:9.9 cityImage:@"Lisbon.jpg"];
    HWCityModel *Ljubljana = [HWCityModel cityWithName:@"Ljubljana" latitude:46 longtitude:14.3 cityImage:@"Ljubljana.jpg"];
    HWCityModel *london = [HWCityModel cityWithName:@"London" latitude:51.3 longtitude:0 cityImage:@"london.jpg"];
    HWCityModel *Luxembourg = [HWCityModel cityWithName:@"Luxembourg" latitude:49.3 longtitude:6.7 cityImage:@"Luxembourg.jpg"];
    HWCityModel *kiev = [HWCityModel cityWithName:@"Kiev" latitude:50.2 longtitude:30.3 cityImage:@"Kiev.jpg"];
    HWCityModel *kharkiv = [HWCityModel cityWithName:@"Kharkiv" latitude:50 longtitude:36.1 cityImage:@"Kharkiv.jpg"];
    HWCityModel *Madrid = [HWCityModel cityWithName:@"Madrid" latitude:40.2 longtitude:3.4 cityImage:@"Madrid.jpg"];
    HWCityModel *Minsk = [HWCityModel cityWithName:@"Minsk" latitude:53.5 longtitude:27.3 cityImage:@"Minsk.jpg"];
    HWCityModel *Monaco = [HWCityModel cityWithName:@"Monaco" latitude:43.4 longtitude:7.2 cityImage:@"Monaco.jpg"];
    HWCityModel *Moscow = [HWCityModel cityWithName:@"Moscow" latitude:55.4 longtitude:37.3 cityImage:@"Moscow.jpg"];
    HWCityModel *Nicosia = [HWCityModel cityWithName:@"Nicosia" latitude:35.1 longtitude:0.2 cityImage:@"Nicosia.jpg"];
    HWCityModel *Oslo = [HWCityModel cityWithName:@"Oslo" latitude:59.5 longtitude:10.4 cityImage:@"Oslo.jpg"];
    HWCityModel *paris = [HWCityModel cityWithName:@"Paris" latitude:48.5 longtitude:22 cityImage:@"Paris.jpg"];
    HWCityModel *Podgorica = [HWCityModel cityWithName:@"Podgorica" latitude:42.2 longtitude:19.1 cityImage:@"Podgorica.jpg"];
    HWCityModel *Prague = [HWCityModel cityWithName:@"Prague" latitude:50.5 longtitude:14.2 cityImage:@"Prague.jpg"];
    HWCityModel *Reykjavik = [HWCityModel cityWithName:@"Reykjavik" latitude:64.4 longtitude:21.5 cityImage:@"Reykjavik.jpeg"];
    HWCityModel *Riga = [HWCityModel cityWithName:@"Riga" latitude:56.5 longtitude:24.6 cityImage:@"Riga.jpg"];
    HWCityModel *Rome = [HWCityModel cityWithName:@"Rome" latitude:41.5 longtitude:12.2 cityImage:@"Rome.jpg"];
    HWCityModel *SanMarino = [HWCityModel cityWithName:@"San Marino" latitude:43.5 longtitude:12.2 cityImage:@"SanMarino.jpg"];
    HWCityModel *Sarajevo = [HWCityModel cityWithName:@"Sarajevo" latitude:43.5 longtitude:18.2 cityImage:@"Sarajevo.jpg"];
    HWCityModel *Skopje = [HWCityModel cityWithName:@"Skopje" latitude:42 longtitude:21.2 cityImage:@"Skopje.jpg"];
    HWCityModel *Sofia = [HWCityModel cityWithName:@"Sofia" latitude:42.4 longtitude:23.2 cityImage:@"Sofia.jpg"];
    HWCityModel *Stockholm = [HWCityModel cityWithName:@"Stockholm" latitude:59.1 longtitude:18.3 cityImage:@"Stockholm.jpg"];
    HWCityModel *Tallinn = [HWCityModel cityWithName:@"Tallinn" latitude:59.2 longtitude:24.4 cityImage:@"Tallinn.jpg"];
    HWCityModel *Tirana = [HWCityModel cityWithName:@"Tirana" latitude:41.19 longtitude:19.4 cityImage:@"Tirana.jpg"];
    HWCityModel *Vaduz = [HWCityModel cityWithName:@"Vaduz" latitude:47.1 longtitude:9.5 cityImage:@"Vaduz.jpg"];
    HWCityModel *Valletta = [HWCityModel cityWithName:@"Valletta" latitude:35.5 longtitude:14.3 cityImage:@"Valletta.jpg"];
    HWCityModel *Vatican = [HWCityModel cityWithName:@"Vatican" latitude:41.5 longtitude:21.2 cityImage:@"Vatican.jpg"];
    HWCityModel *Vienna = [HWCityModel cityWithName:@"Vienna" latitude:48.1 longtitude:16.2 cityImage:@"Vienna.jpg"];
    HWCityModel *Vilnius = [HWCityModel cityWithName:@"Vilnius" latitude:54.4 longtitude:25.1 cityImage:@"Vilnius.jpg"];
    HWCityModel *Warsaw = [HWCityModel cityWithName:@"Warsaw" latitude:52.1 longtitude:21 cityImage:@"Warsaw.jpg"];
    HWCityModel *Zagreb = [HWCityModel cityWithName:@"Zagreb" latitude:45.4 longtitude:15.5 cityImage:@"Zagreb.jpg"];
    
    
    self.objects = @[amsterdam, AndorraLaVella, Athens, Belgrade, Berlin, Bern, Bratislava, Brussels, Bucharest, Budapest, Chisinau, Copenhagen, Dublin, Helsinki, Lisbon, Ljubljana, london, Luxembourg, kiev, kharkiv, Madrid, Minsk, Monaco, Moscow, Nicosia, Oslo, paris, Podgorica, Prague, Reykjavik, Riga, Rome, SanMarino, Sarajevo, Skopje, Sofia, Stockholm, Tallinn, Tirana, Vaduz, Valletta, Vatican, Vienna, Vilnius, Warsaw, Zagreb];

    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CapitalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    HWCityModel *city = [self.objects objectAtIndex:indexPath.row];
    cell.cityLabel.text = city.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HWCityModel *city = [self.objects objectAtIndex:indexPath.row];
    self.selectedCity = city;
    [self performSegueWithIdentifier:@"weatherSegue" sender:self];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"weatherSegue"]) {
        WeatherViewController *cityVC = (WeatherViewController *)segue.destinationViewController;
        cityVC.selectedCity = self.selectedCity;
    }
}

@end
