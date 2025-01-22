import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'HomePage.dart';
import 'ManagePage.dart';
import 'MembersPage.dart';
import 'SummaryPage.dart';
import 'Scan.dart';

void main() {
  initializeDateFormatting('zh_CN', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final List tabBodies = [
    HomePage(),
    ManagePage(),
    MembersPage(),
    SummaryPage()
  ];

  int currentIndex = 0;
  void _onTabTapped(int index) { // 当用户按下底部导航按钮时调用
    setState(() {
      currentIndex = index; // 更新当前活动页面的索引值
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // 设置底色为白色
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: tabBodies[currentIndex],
        bottomNavigationBar:
        PreferredSize(preferredSize: Size.fromHeight(60),
          child: SizedBox(
            height: 60.0,
            child: BottomAppBar(
              shape: CircularNotchedRectangle(),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      _onTabTapped(0);
                    },
                    icon: Column(
                      children: [
                        Image.asset(
                          currentIndex == 0 ? 'image/home page selected.png' : 'image/home page unselected.png',
                          width: 32, // 图片宽度
                          height: 32, // 图片高度
                        ),
                      ],
                    ),
                    tooltip: '首页',
                    highlightColor: Colors.transparent, // 透明色
                    splashColor: Colors.transparent,
                ),
                  IconButton(
                    onPressed: () {
                      _onTabTapped(1);
                    },
                    icon: Column(
                      children: [
                        Image.asset(
                          currentIndex == 1 ? 'image/manage selected.png' : 'image/manage unselected.png', // 图片路径
                          width: 32, // 图片宽度
                          height: 32, // 图片高度
                        ),
                      ],
                    ),
                    tooltip: '管理',
                    highlightColor: Colors.transparent, // 透明色
                    splashColor: Colors.transparent,
                  ),
                SizedBox(), //中间位置空出
                  IconButton(
                    onPressed: () {
                      _onTabTapped(2);
                    },
                    icon: Column(
                      children: [
                        Image.asset(
                          currentIndex == 2 ? 'image/member selected.png' : 'image/member unselected.png',
                          width: 32, // 图片宽度
                          height: 32, // 图片高度
                        ),
                      ],
                    ),
                    tooltip: '成员',
                    highlightColor: Colors.transparent, // 透明色
                    splashColor: Colors.transparent,
                  ),
                  IconButton(
                    onPressed: () {
                      _onTabTapped(3);
                    },
                    icon: Column(
                      children: [
                        Image.asset(
                          currentIndex == 3 ? 'image/Summary selected.png' : 'image/Summary unselected.png',
                          width: 32, // 图片宽度
                          height: 32, // 图片高度
                        ),
                      ],
                    ),
                    tooltip: '汇总',
                    highlightColor: Colors.transparent, // 透明色
                    splashColor: Colors.transparent,
                  ),
              ],
            ),
          ),
        ),),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:
        FloatingActionButton(
          backgroundColor: currentIndex == 3 ? Colors.white : Color(0xFF30C084),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScanPage()),
            );
          },
          child: Image.asset(
            currentIndex == 3 ? 'image/scan green.png' : 'image/scan white.png',
            width: 36.0,
            height: 36.0,
          ),
        ),
      ),
    );
  }
}