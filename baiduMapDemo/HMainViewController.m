//
//  HMainViewController.m
//  baiduMapDemo
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 何万牡. All rights reserved.
//

#import "HMainViewController.h"

#import <BaiduMapAPI_Map/BMKMapView.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>

@interface HMainViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate,UITextFieldDelegate>
{
    //地图视图
    BMKMapView * _mapView;
    //搜索框
    UITextField * _searchTF;
    //搜索按钮
    UIButton * _searchBtn;
    //定位服务
    BMKLocationService * _locationService;

    
}
@end

@implementation HMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位服务当前可能尚未打开，请设置打开!");
        return;
    }
    [self initUI];
    
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil;
}

#pragma mark - BMKLocationServiceDelegate
//处理方向变更信息
-(void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    
}
//处理位置坐标更新
-(void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    _mapView.showsUserLocation = YES;//显示定位图层
    [_mapView updateLocationData:userLocation];
}
#pragma mark - TextfieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Event Method
-(void)search:(id)sender
{
    [_searchTF resignFirstResponder];
}

#pragma mark - Help Handle

/**
 *  初始化UI
 */
-(void)initUI
{
    _searchTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-60, 40)];
    _searchTF.layer.borderWidth = 2.0f;
    _searchTF.layer.borderColor = [UIColor purpleColor].CGColor;
    _searchTF.placeholder = @"请输入你要查询的地方";
    _searchTF.delegate = self;
    [self.view addSubview:_searchTF];
    
    _searchBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, 0, 60, 40)];
    [_searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [_searchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _searchBtn.backgroundColor = [UIColor magentaColor];
    [_searchBtn addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_searchBtn];
    
    _mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT-104)];
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;
    _mapView.zoomLevel = 19;
    [self.view addSubview:_mapView];
    
    _locationService = [[BMKLocationService alloc] init];
    _locationService.delegate = self;
    [_locationService startUserLocationService];
}
@end
