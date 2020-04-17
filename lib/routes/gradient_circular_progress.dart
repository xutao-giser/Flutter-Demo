import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flukit/flukit.dart';

class GradientCircularProgressRoute extends StatefulWidget {
  @override
  GradientCircularProgressRouteState createState() {
    return new GradientCircularProgressRouteState();
  }
}

class GradientCircularProgressRouteState
    extends State<GradientCircularProgressRoute>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  String statetype = 'sd';
// 当Widget 第一次插入到Widget树时，该方法会被调用，且只会调用一次
  @override
  void initState() {
    super.initState();
    // 初始化状态
    _animationController = new AnimationController(vsync: this, duration: Duration(seconds: 3));
    bool isForward = true;
    // 添加状态监听器
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        isForward = true;
      } else if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        if (isForward) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      } else if (status == AnimationStatus.reverse) {
        isForward = false;
      }
    });
    _animationController.forward();
  }

// 当widget重新构建时，Flutter framework会调用Widget.canUpdate来检测新旧widget的key和runtimeType是否同时相等，如果是则会调用该方法
  @override
  void didUpdateWidget(GradientCircularProgressRoute oldWidget){
    super.didUpdateWidget(oldWidget);
  }

// 更新State对象
void changeState(){
  setState(() {
    statetype = 'sd';
  });
}

// 当State对象的依赖发生变化时会被调用（典型场景是系统语言或应用主题改变时，flutter framework会通知widget调用该方法）
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }

// 开发环境下热重载时会被调用
  @override
  void reassemble(){
    super.reassemble();
  }

// 当State对象从树中被移除时，会调用此回调
  @override
  void deactivate(){
    super.deactivate();
  }

// 当State对象从树中被永久移除时调用，释放资源
  @override
  void dispose() {
    // 
    _animationController.dispose();
    super.dispose();
  }
// 在 initState() 或 didUpdateWidget() 或 setState() 或 didChangeDependencies() 或 deactivate() 后调用该方法（也就是当State对象有点变化就会调用）
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context, Widget child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: <Widget>[
                      Wrap(
                        spacing: 10.0,
                        runSpacing: 16.0,
                        children: <Widget>[
                          GradientCircularProgressIndicator(
                            // No gradient
                            colors: [Colors.blue, Colors.blue],
                            radius: 50.0,
                            stokeWidth: 3.0,
                            value: _animationController.value,
                          ),
                          GradientCircularProgressIndicator(
                            colors: [Colors.red, Colors.orange],
                            radius: 50.0,
                            stokeWidth: 3.0,
                            value: _animationController.value,
                          ),
                          GradientCircularProgressIndicator(
                            colors: [Colors.red, Colors.orange,Colors.red],
                            radius: 50.0,
                            stokeWidth: 5.0,
                            value: _animationController.value,
                          ),
                          GradientCircularProgressIndicator(
                            colors: [Colors.teal, Colors.cyan],
                            radius: 50.0,
                            stokeWidth: 5.0,
                            strokeCapRound: true,
                            value: CurvedAnimation(parent: _animationController, curve: Curves.decelerate).value,
                          ),
                          TurnBox(
                            turns:1/8,
                            child: GradientCircularProgressIndicator(
                              colors: [Colors.red, Colors.orange, Colors.red],
                              radius: 50.0,
                              stokeWidth: 5.0,
                              strokeCapRound: true,
                              backgroundColor: Colors.red[50],
                              totalAngle: 1.5*pi,
                              value: CurvedAnimation(parent: _animationController, curve: Curves.ease).value
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: 1,
                            child: GradientCircularProgressIndicator(
                                colors: [Colors.blue[700], Colors.blue[200]],
                                radius: 50.0,
                                stokeWidth: 3.0,
                                strokeCapRound: true,
                                backgroundColor: Colors.transparent,
                                value: _animationController.value
                            ),
                          ),
                          GradientCircularProgressIndicator(
                            colors: [
                              Colors.red,
                              Colors.amber,
                              Colors.cyan,
                              Colors.green[200],
                              Colors.blue,
                              Colors.red
                            ],
                            radius: 50.0,
                            stokeWidth: 5.0,
                            strokeCapRound: true,
                            value: _animationController.value,
                          ),
                        ],
                      ),
                      GradientCircularProgressIndicator(
                        colors: [Colors.blue[700], Colors.blue[200]],
                        radius: 100.0,
                        stokeWidth: 20.0,
                        value: _animationController.value,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: GradientCircularProgressIndicator(
                          colors: [Colors.blue[700], Colors.blue[300]],
                          radius: 100.0,
                          stokeWidth: 20.0,
                          value: _animationController.value,
                          strokeCapRound: true,
                        ),
                      ),
                      //剪裁半圆
                      ClipRect(
                        child: Align(
                          alignment: Alignment.topCenter,
                          heightFactor: .5,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: SizedBox(
                              //width: 100.0,
                              child: TurnBox(
                                turns: .75,
                                child: GradientCircularProgressIndicator(
                                  colors: [Colors.teal, Colors.cyan[500]],
                                  radius: 100.0,
                                  stokeWidth: 8.0,
                                  value: _animationController.value,
                                  totalAngle: pi,
                                  strokeCapRound: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 104.0,
                        width: 200.0,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Positioned(
                              height: 200.0,
                              top: .0,
                              child: TurnBox(
                                turns: .75,
                                child: GradientCircularProgressIndicator(
                                  colors: [Colors.teal, Colors.cyan[500]],
                                  radius: 100.0,
                                  stokeWidth: 8.0,
                                  value: _animationController.value,
                                  totalAngle: pi,
                                  strokeCapRound: true,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text("${(_animationController.value*100).toInt()}%",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.blueGrey,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}






