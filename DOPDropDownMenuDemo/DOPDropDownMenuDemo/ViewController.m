//
//  ViewController.m
//  DOPDropDownMenuDemo
//
//  Created by weizhou on 9/26/14.
//  Copyright (c) 2014 fengweizhou. All rights reserved.
//

#import "ViewController.h"
#import "DOPDropDownMenu.h"

@interface ViewController ()<DOPDropDownMenuDataSource, DOPDropDownMenuDelegate>
@property (nonatomic, copy) NSArray *citys;
@property (nonatomic, copy) NSArray *ages;
@property (nonatomic, copy) NSArray *genders;
@property (nonatomic, copy) NSArray *originalArray;
@property (nonatomic, copy) NSArray *results;

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"navbar_title", @"the navigation bar title");
    self.citys = @[NSLocalizedString(@"city1", @"city1"),
                   NSLocalizedString(@"city2", @"city2"),
                   NSLocalizedString(@"city3", @"city3")];
    
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(100, 64) andSize:CGSizeMake(150, 30)];
    menu.layer.borderColor = [UIColor lightGrayColor].CGColor;
    menu.layer.borderWidth = 0.35;
//    menu.frame = CGRectMake(0, 0, 150, 40);
    menu.dataSource = self;
    menu.delegate = self;
    [self.view addSubview:menu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu {
    return 1;
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column {
    return 3;
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath {
    switch (indexPath.column) {
        case 0: return self.citys[indexPath.row];
            break;
        case 1: return self.citys[indexPath.row];
            break;
        case 2: return self.citys[indexPath.row];
            break;
        default:
            return nil;
            break;
    }
}

- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath {
    NSLog(@"column:%li row:%li", (long)indexPath.column, (long)indexPath.row);
    NSLog(@"%@",[menu titleForRowAtIndexPath:indexPath]);
}

@end
