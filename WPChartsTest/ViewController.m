//
//  ViewController.m
//  WPChartsTest
//
//  Created by wupeng on 2017/7/6.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import "ViewController.h"
#import "WPChartsTest-Bridging-Header.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<ChartViewDelegate>

@property (nonatomic, strong) LineChartView *lineView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    //折线图
    LineChartView *lineView = [[LineChartView alloc]initWithFrame:CGRectMake(20, 20, kScreenWidth - 20*2, kScreenHeight - 80)];
    lineView.delegate = self;
    self.lineView = lineView;
    [self.view addSubview:lineView];
    //基本样式
    lineView.backgroundColor = [UIColor whiteColor];
    lineView.noDataText = @"暂无数据";
    //交互样式
    lineView.scaleYEnabled = NO;//scaleYEnabled Y轴缩放
    lineView.doubleTapToZoomEnabled = NO;//doubleTapToZoomEnabled 双指缩放
    lineView.dragEnabled = YES;//dragEnabled 是否开启拖拽图标
    lineView.dragDecelerationEnabled = NO;//dragDecelerationEnabled  是否开启拖拽减速惯性
    lineView.dragDecelerationFrictionCoef = 0.9;//dragDecelerationFrictionCoef 拖拽减速惯性系数（0-1）数值越大惯性越大
    //X轴样式
    ChartXAxis *xAxis = self.lineView.xAxis;
    xAxis.axisLineWidth = 1.0/[UIScreen mainScreen].scale;//x轴线宽
    xAxis.axisLineColor = [UIColor grayColor];//x轴线颜色
    xAxis.labelPosition = XAxisLabelPositionBottom;//x轴lable位置
    xAxis.drawGridLinesEnabled = YES;//画网格线
    xAxis.labelTextColor = [UIColor redColor];//lable颜色
    //Y轴样式
    self.lineView.rightAxis.enabled = NO;//不绘制右边轴线
    ChartYAxis *leftAxis = self.lineView.leftAxis;
    leftAxis.labelCount = 5;//左边labe的数量
    leftAxis.forceLabelsEnabled = YES;//是否强制绘制lable数量
//    leftAxis.showOnlyMinMaxEnabled = NO;//是否只显示最大值和最小值
    leftAxis.axisMinValue = 0;//设置Y轴的最小值
    leftAxis.axisMaxValue = 100;//设置Y轴的最大值
//    leftAxis.startAtZeroEnabled = NO;//设置是否从0开始绘制
    leftAxis.inverted = NO;//是否将Y轴进行上下翻转
    leftAxis.axisLineWidth = 1.0/[UIScreen mainScreen].scale;//设置Y轴的线宽
    leftAxis.axisLineColor = [UIColor grayColor];//设置Y轴线颜色
    leftAxis.labelPosition = YAxisLabelPositionOutsideChart;//Y轴lable位置
    leftAxis.labelTextColor = [UIColor yellowColor];//lable颜色
    leftAxis.labelFont = [UIFont systemFontOfSize:12];//lable字体
    //网格线样式
    leftAxis.gridLineDashLengths = @[@2.0f,@2.0f];//设置网格虚线样式
    leftAxis.gridColor = [UIColor grayColor];//网格线颜色
    leftAxis.gridAntialiasEnabled = YES;//开启抗锯齿
    //添加限制线
    ChartLimitLine *limitLine = [[ChartLimitLine alloc] initWithLimit:80.0 label:@"限制线"];
    limitLine.lineWidth = 1.0;
    limitLine.lineColor = [UIColor greenColor];
    limitLine.lineDashLengths = @[@5.0f,@5.0f];//限制线虚线样式
    limitLine.labelPosition = ChartLimitLabelPositionRightTop;//位置
    limitLine.valueTextColor = [UIColor redColor];//限制线lable颜色
    limitLine.valueFont = [UIFont systemFontOfSize:12];
    [leftAxis addLimitLine:limitLine];//y轴上添加限制线
    leftAxis.drawLimitLinesBehindDataEnabled = YES;//设置限制线绘制在折线图后面
    //描述及图例样式
    self.lineView.descriptionText = @"折线图";
    self.lineView.descriptionTextColor = [UIColor blackColor];
    self.lineView.legend.form = ChartLegendFormLine;//图例格式
    self.lineView.legend.formSize = 30;//图例样式大小
    self.lineView.legend.textColor = [UIColor cyanColor];//图例文字颜色
    //设置图标数据
    self.lineView.data = [self setData];
    [self.lineView animateWithXAxisDuration:1];//设置x轴动画
    
    //123
    
    
}

- (ChartData *)setData{
    LineChartData *data= [[LineChartData alloc] initWithDataSets:@[]];
    return data;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
