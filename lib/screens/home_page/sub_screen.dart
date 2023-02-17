import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:real_estate_flutterui/common/common_container.dart';
import 'package:real_estate_flutterui/constant/color_constant.dart';
import 'package:real_estate_flutterui/constant/string_constant.dart';
import 'package:real_estate_flutterui/screens/home_page/home_page.dart';

class SubOceanPage extends StatefulWidget {
  const SubOceanPage({Key? key}) : super(key: key);

  @override
  State<SubOceanPage> createState() => _SubOceanPageState();
}

class _SubOceanPageState extends State<SubOceanPage> {
  int timeIndexSelected = 1;

  final List<String> time = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUNE',
    'JULY',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC',
  ];

  var _currentIndex = 0;
  void OnTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<ChartData> chartData = [
    ChartData('David', 25, Colors.black),
    ChartData('David', 25, Colors.black),
    ChartData('David', 25, Colors.black),
    ChartData('David', 25, Colors.black),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [kDarkGreenColor, kGreenColor, kWhiteColor, kWhiteColor])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 45.h, right: 20.w, left: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                          height: 45.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                            color: kGreyBlueColor,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: kWhiteColor,
                          )),
                    ),
                    Text(
                      park,
                      style: TextStyle(color: kBlackColor, fontFamily: "Mulish", fontWeight: FontWeight.w700, fontSize: 25.sp),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: kGreyBlueColor,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        height: 45.h,
                        width: 45.w,
                        child: const Icon(
                          Icons.favorite_border_outlined,
                          color: kWhiteColor,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 30.w, left: 30.w),
                child: Row(children: [
                  Text(
                    week1,
                    style: TextStyle(color: kWhiteColor, fontFamily: "Mulish", fontWeight: FontWeight.w700, fontSize: 30.h),
                  ),
                  Text(
                    week,
                    style: TextStyle(color: kWhiteColor, fontFamily: "Mulish", fontWeight: FontWeight.w600, fontSize: 16.h),
                  ),
                ]),
              ),
              Stack(
                children: [
                  SizedBox(
                    height: 250.h,
                    child: LineChart(
                      mainData(),
                    ),
                  ),
                  Positioned(
                    top: 250,
                    child: SizedBox(
                      height: 35.h,
                      width: 500,
                      child: ListView.builder(
                        itemCount: 12,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                timeIndexSelected = index;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 9.w, right: 9.w),
                              child: Container(
                                height: 35.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.sp),
                                    border: Border.all(color: index == timeIndexSelected ? Colors.white : Colors.white),
                                    color: timeIndexSelected == index ? kBlackColor : Colors.transparent),
                                child: Center(
                                    child: Text(time[index],
                                        style: TextStyle(
                                            color: index == timeIndexSelected ? kWhiteColor : kBlackColor,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500))),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
              CommonContainer(),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const HomePage()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: kGreyBlueColor,
                      shape: RoundedRectangleBorder(
                        // side: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15.r),
                      )),
                  child:  Text(
                    buyApart,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.white,fontFamily: "Mulish"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Color> gradientColors = [kWhiteColor, kDarkGreenColor, kGreyBlueColor];

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('FEB', style: style);
        break;
      case 4:
        text = const Text('MAR', style: style);
        break;
      case 6:
        text = const Text('APR', style: style);
        break;
      case 8:
        text = const Text('MAY', style: style);
        break;
      case 10:
        text = const Text('JUN', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: kGreenColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: kWhiteColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 150,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: kWhiteColor),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors.map((color) => color.withOpacity(0.10)).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
