/*
 * @Author: nlj 
 * @Date: 2023-01-07 10:09:02 
 * @Last Modified by: nlj
 * @Last Modified time: 2023-07-22 10:13:13
 */

import 'package:flutter/material.dart';


class LoaddingView extends StatefulWidget {
  const LoaddingView({Key? key}) : super(key: key);

  @override
  State<LoaddingView> createState() => LoaddingViewState();
}

class LoaddingViewState extends State<LoaddingView>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  // 屏幕宽
  double screenWidth = 0;
  // 屏幕高
  double screenHeight = 0;
  // barHeight
  double barHeight = 32;
  // barWidth
  double barWidth = 60;
  // currentIndex
  int currentIndex = 0;

  // LoaddingViewState(this._controller);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// 重复播放，持续时间为5秒的动画控制器
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        alignment: Alignment.center,
        width: barWidth,
        child: _customTabarView(barWidth),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Widget _customTabarView(double width) {
    return Stack(
      children: [_translatContainer(), _translatRightContainer()],
    );
  }

  Widget _translatContainer() {
    return LayoutBuilder(builder: (context, constraints) {
      final offsetS = const Offset(0, 0);
      final offserE = const Offset(1, 0);
      final offsetAnimation =
          Tween<Offset>(begin: offsetS, end: offserE).animate(_controller!);
      return SlideTransition(
        position: offsetAnimation,
        child: Container(
          margin: const EdgeInsets.only(top: 2),
          height: barWidth / 4,
          width: barWidth / 4,
          decoration: BoxDecoration(
              gradient: gradientAinmationleft,
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              border: Border.all(width: 1, style: BorderStyle.none)),
        ),
      );
    });
  }


  Gradient get gradientAinmationleft{
    return const LinearGradient(      //渐变位置
         begin: Alignment.topRight, //右上
         tileMode: TileMode.repeated,//左下
         stops: [1.0, 0.8, 0.0],         //[渐变起始点, 渐变结束点]
         //渐变颜色[始点颜色, 结束颜色]
         colors: [Colors.blue, Colors.orange, Colors.purple,]
      );
  }

  Widget _translatRightContainer() {
    return LayoutBuilder(builder: (context, constraints) {
      final offsetS = const Offset(0, 0);
      final offserE = const Offset(1, 0);
      final offsetAnimation =
          Tween<Offset>(begin: offserE, end: offsetS).animate(_controller!);
      return SlideTransition(
        position: offsetAnimation,
        child: Container(
          margin: const EdgeInsets.only(top: 2),
          height: barWidth / 4,
          width: barWidth / 4,
          decoration: BoxDecoration(
              gradient: gradientAinmation,
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              border: Border.all(width: 1, style: BorderStyle.none)),
        ),
      );
    });
  }

  LinearGradient get gradientAinmation{
    return const LinearGradient(      //渐变位置
         begin: Alignment.topRight, //右上
         end: Alignment.bottomLeft, 
        //  tileMode: TileMode.repeated,//左下
         stops: [0.0, 0.8, 1.0],         //[渐变起始点, 渐变结束点]
         //渐变颜色[始点颜色, 结束颜色]
         colors: [Colors.red,Colors.orange, Colors.blue]
      );
  }
}
