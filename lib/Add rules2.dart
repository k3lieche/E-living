import 'package:flutter/material.dart';
import 'Add rules3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddRules2(),
    );
  }
}

class AddRules2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('image/add rules bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 336.0,
                height: 600.0,
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            style: ButtonStyle(overlayColor: MaterialStateProperty.resolveWith((states)
                            {return Colors.transparent;})),
                            onPressed: () {
                              Navigator.pop(
                                context,
                              );
                            },
                            child: Text(
                              '取消',
                              style: TextStyle(
                                color: Color(0xFF30C084),
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                          Text(
                            '添加触发器',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(width: 60.0),
                        ],
                      ),
                    ),
                  Container(
                    padding: EdgeInsets.only(top: 18.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                        height: 48.0,
                        color: Colors.white,
                          child:Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.0),
                                child: Image.asset('image/temperature.png',
                                  width: 36.0, height: 36.0),
                              ),
                              Text('温度', style: TextStyle(fontSize: 18.0)),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                      size: 18.0,),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => AddRules3()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(height: 1.0, color: Color(0xFFCCCCCC)),
                        Container(
                          height: 48.0,
                          color: Colors.white,
                          child:Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.0),
                                child: Image.asset('image/humidity.png',
                                    width: 36.0, height: 36.0),
                              ),
                              Text('湿度', style: TextStyle(fontSize: 18.0)),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                      size: 18.0,),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => AddRules3()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(height: 1.0, color: Color(0xFFCCCCCC)),
                        Container(
                          height: 48.0,
                          color: Colors.white,
                          child:Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.0),
                                child: Image.asset('image/alarm.png',
                                    width: 36.0, height: 36.0),
                              ),
                              Text('报警器', style: TextStyle(fontSize: 18.0)),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                      size: 18.0,),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => AddRules3()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                    //位置
                    Container(
                      padding: EdgeInsets.only(top: 18.0),
                      height: 48.0,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: Text('位置',
                              style: TextStyle(color: Color(0xFF8A8A8A), fontSize: 10.0)),
                        ),
                      ),
                    ),
                    Container(
                      //padding: EdgeInsets.only(top: 36.0),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 48.0,
                            color: Colors.white,
                            child:Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Image.asset('image/be home.png',
                                      width: 36.0, height: 36.0),
                                ),
                                Text('到家时', style: TextStyle(fontSize: 18.0)),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_forward_ios,
                                        color: Colors.grey,
                                        size: 18.0,),
                                      onPressed: () {
                                        // TODO: 处理按钮点击事件
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(height: 1.0, color: Color(0xFFCCCCCC)),
                          Container(
                            height: 48.0,
                            color: Colors.white,
                            child:Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Image.asset('image/leave home.png',
                                      width: 36.0, height: 36.0),
                                ),
                                Text('离家时', style: TextStyle(fontSize: 18.0)),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_forward_ios,
                                        color: Colors.grey,
                                        size: 18.0,),
                                      onPressed: () {
                                        // TODO: 处理按钮点击事件
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(height: 1.0, color: Color(0xFFCCCCCC)),
                          Container(
                            height: 48.0,
                            color: Colors.white,
                            child:Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Image.asset('image/position.png',
                                      width: 36.0, height: 36.0),
                                ),
                                Text('离开或到达位置', style: TextStyle(fontSize: 18.0)),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_forward_ios,
                                        color: Colors.grey,
                                        size: 18.0,),
                                      onPressed: () {
                                        // TODO: 处理按钮点击事件
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //时间
                    Container(
                      padding: EdgeInsets.only(top: 18.0),
                      height: 48.0,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: Text('时间',
                              style: TextStyle(color: Color(0xFF8A8A8A), fontSize: 10.0)),
                        ),
                      ),
                    ),
                    Container(
                      //padding: EdgeInsets.only(top: 36.0),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 48.0,
                            color: Colors.white,
                            child:Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Image.asset('image/sunrise or sunset.png',
                                      width: 36.0, height: 36.0),
                                ),
                                Text('日出或日落', style: TextStyle(fontSize: 18.0)),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_forward_ios,
                                        color: Colors.grey,
                                        size: 18.0,),
                                      onPressed: () {
                                        // TODO: 处理按钮点击事件
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(height: 1.0, color: Color(0xFFCCCCCC)),
                          Container(
                            height: 48.0,
                            color: Colors.white,
                            child:Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Image.asset('image/Time of day.png',
                                      width: 36.0, height: 36.0),
                                ),
                                Text('一天时间', style: TextStyle(fontSize: 18.0)),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_forward_ios,
                                        color: Colors.grey,
                                        size: 18.0,),
                                      onPressed: () {
                                        // TODO: 处理按钮点击事件
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}