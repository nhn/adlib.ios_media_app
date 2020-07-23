//
//  ViewController.m
//  ADLibSample
//
//  Created by NHN on 2020/07/20.
//

#import "ViewController.h"
#import "AdlibSampleController.h"
#import "HalfAdlibSampleViewController.h"
#import "MediationSampleController.h"

static NSInteger ADLIB_BANNER = 0;
static NSInteger ADLIB_HALF_BANNER = 1;
static NSInteger ADLIB_MIDIATION_BANNER = 2;
static NSInteger ADLIB_HALF_MIDIATION_BANNER = 3;

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, readonly) NSArray<NSString *> *menus;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (instancetype)init
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        _menus = [[NSArray alloc] initWithObjects:@"애드립 배너 샘플", @"애드립 하프배너 샘플", @"애드립 미디에이션(+Google) 샘플", @"애드립 하프미디에이션(+Google) 샘플", nil];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setTitle:@"ADLIB"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [_tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [_tableView setRowHeight:UITableViewAutomaticDimension];
    [_tableView setSectionHeaderHeight:0];
    [_tableView setSectionFooterHeight:0];
    [_tableView setBackgroundColor:[UIColor whiteColor]];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
    [self.view addSubview:_tableView];
    
    if (@available(iOS 11.0, *)) {
        [[_tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
        [[_tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
    } else {
        [[_tableView.topAnchor constraintEqualToAnchor:self.topLayoutGuide.bottomAnchor] setActive:YES];
        [[_tableView.bottomAnchor constraintEqualToAnchor:self.bottomLayoutGuide] setActive:YES];
    }
    
    [[_tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor] setActive:YES];
    [[_tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor] setActive:YES];
    
}


# pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_menus count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    [cell.textLabel setText:[_menus objectAtIndex:indexPath.row]];
    [cell.textLabel setTextColor:[UIColor blackColor]];
    [cell setBackgroundColor:[UIColor whiteColor]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}


# pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == ADLIB_BANNER) {
        [self.navigationController pushViewController:[[AdlibSampleController alloc] initWithTitle:[_menus objectAtIndex:indexPath.row]]
                                             animated:YES];
    }
    
    if (indexPath.row == ADLIB_HALF_BANNER) {
        [self.navigationController pushViewController:[[HalfAdlibSampleViewController alloc] initWithTitle:[_menus objectAtIndex:indexPath.row]]
                                             animated:YES];
    }
    
    if (indexPath.row == ADLIB_MIDIATION_BANNER) {
        [self.navigationController pushViewController:[[MediationSampleController alloc] initWithTitle:[_menus objectAtIndex:indexPath.row]
                                                                                                isHalf:NO]
                                             animated:YES];
    }
    
    if (indexPath.row == ADLIB_HALF_MIDIATION_BANNER) {
        [self.navigationController pushViewController:[[MediationSampleController alloc] initWithTitle:[_menus objectAtIndex:indexPath.row]
                                                                                                isHalf:YES]
                                             animated:YES];
    }
    
}

@end
