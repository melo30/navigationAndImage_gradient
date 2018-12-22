//
//  ViewController.m
//  ScrollChangeEffect
//
//  Created by melo on 2018/12/23.
//  Copyright © 2018 陈诚. All rights reserved.
//

#import "ViewController.h"

#import "GXQNavigationBar.h"

static CGFloat headerHeight = 200.0f;
static CGRect imageViewOriginFrame; // 图片原始的Frame

@interface ViewController () <UITableViewDelegate , UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) GXQNavigationBar *navBar;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 关闭自动偏移
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    //1.imageView
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, Screen_width * 0.8)];
    self.imageView.image = [UIImage imageNamed:@"bg_Gxq"];
    imageViewOriginFrame = self.imageView.frame;
    [self.view addSubview:self.imageView];
    
    //2.tableView
    [self.view addSubview:self.tableView];
    UIView *headerView = [UIView new];
    headerView.frame = CGRectMake(0, 0, Screen_width, headerHeight);
    self.tableView.tableHeaderView = headerView;
    UIView *footerView = [UIView new];
    self.tableView.tableFooterView = footerView;
    
    //3.navigationBarView
    self.navBar = [[GXQNavigationBar alloc] init];
    self.navBar.title = @"郭瑄琦";
    [self.view addSubview:self.navBar];
    
}

#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

#pragma mark - ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat originH = headerHeight - (NavigationHeight);
    
    //1.向上滑,导航栏颜色逐渐变深
    
    if (offsetY < originH) { // tableViewa逐渐接近导航栏下沿
        
        self.navBar.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:(offsetY / originH)];
        
    }else {// tableView到达导航栏之后
        
        self.navBar.backgroundColor = [UIColor redColor];
        
    }
    
    //2.向上滑图片跟着上移，下滑图片放大
    
    if (offsetY > 0) {
        
        self.imageView.frame = ({
            CGRect frame = imageViewOriginFrame;
            frame.origin.y = imageViewOriginFrame.origin.y - offsetY;
            frame;
        });
        
    }else {
        
        self.imageView.frame = ({
            CGRect frame = imageViewOriginFrame;
            frame.size.height = imageViewOriginFrame.size.height - offsetY;
            frame.size.width = imageViewOriginFrame.size.width - offsetY;
            frame.origin.x = imageViewOriginFrame.origin.x - (frame.size.width - imageViewOriginFrame.size.width) / 2;
            frame;
        });
        
    }
}

#pragma mark - LazyLoad
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}


- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] initWithObjects:@"时间周日凌晨三点！",@"熬夜狗睡不着！",@"起床打开电脑",@"随便写点...",@"下滑图片成比例放大~",@"上滑图片上移,导航栏颜色渐变~",@"注意开始要关闭scrollView的自动偏移~",@"否则会影响后续计算~",@"睡了~醒来又是一个愉快的周日~晚安！", nil];
    }
    return _dataSource;
}
@end
