import 'package:flutter/material.dart';
import 'main.dart';
import 'Old_user_login.dart';

class sidebarPage extends StatefulWidget {
  @override
  _sidebarPageState createState() => _sidebarPageState();
}

class _sidebarPageState extends State<sidebarPage> {
  bool security = true;
  bool HomePod = true;
  bool Fresh_air  = true;
  bool positioning  = true;
  bool car = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('image/homepageBG.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 24.0),
          Padding(
            padding: EdgeInsets.only(top: 24.0),
            child: Container(
              width: 336.0,
              height: 666.0,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.clear_sharp, color: Color(0xFF8A8A8A), size: 36),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    },
                  ),
                  SizedBox(height: 12.0,),
                  Row(
                    children: [
                      SizedBox(width: 6.0),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: Image.asset(
                          'image/Zhongling.png', // 图片路径
                          width: 48.0, // 设置宽度
                          height: 48.0, // 设置高度
                        ),
                      ),
                      SizedBox(width: 24.0),
                      Text('钟灵的家', style: TextStyle(fontSize: 20.0,),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  Row(
                    children: [
                      SizedBox(width: 20.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (security) {
                              security = false;
                            } else {
                              security = true;
                            }
                          });
                        },
                        child: Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: 72.0,
                                height: 72.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: security ? Color(0xFFD3FADE) : Color(0xFFD9D9D9),
                                    width: 10.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: security ? Color(0xFF438262).withOpacity(0.2) : Color(0xFF8A8A8A).withOpacity(0.2),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset(security ? 'image/security system.png' : 'image/security system off.png'),
                              ),
                              SizedBox(height: 12.0),
                              Text('安防系统', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(security ? '已开启' : '已关闭', style: TextStyle(fontSize: 12.0,),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 30.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (HomePod) {
                              HomePod = false;
                            } else {
                              HomePod = true;
                            }
                          });
                        },
                        child: Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: 72.0,
                                height: 72.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: HomePod ? Color(0xFFD3FADE) : Color(0xFFD9D9D9),
                                    width: 10.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: HomePod ? Color(0xFF438262).withOpacity(0.2) : Color(0xFF8A8A8A).withOpacity(0.2),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset(HomePod ? 'image/HomePod.png' : 'image/HomePod off.png'),
                              ),
                              SizedBox(height: 12.0),
                              Text('HomePod', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(HomePod ? '已连接' : '未连接', style: TextStyle(fontSize: 12.0,),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 30.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (Fresh_air) {
                              Fresh_air = false;
                            } else {
                              Fresh_air = true;
                            }
                          });
                        },
                        child: Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: 72.0,
                                height: 72.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Fresh_air ? Color(0xFFD3FADE) : Color(0xFFD9D9D9),
                                    width: 10.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Fresh_air ? Color(0xFF438262).withOpacity(0.2) : Color(0xFF8A8A8A).withOpacity(0.2),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset(Fresh_air ? 'image/Fresh air system on.png' : 'image/Fresh air system off.png'),
                              ),
                              SizedBox(height: 12.0),
                              Text('新风系统', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(Fresh_air ? '已开启' : '已关闭', style: TextStyle(fontSize: 12.0,),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  Row(
                    children: [
                      SizedBox(width: 20.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (positioning) {
                              positioning = false;
                            } else {
                              positioning = true;
                            }
                          });
                        },
                        child: Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: 72.0,
                                height: 72.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: positioning ? Color(0xFFD3FADE) : Color(0xFFD9D9D9),
                                    width: 10.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: positioning ? Color(0xFF438262).withOpacity(0.2) : Color(0xFF8A8A8A).withOpacity(0.2),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset(positioning ? 'image/positioning selected.png' : 'image/positioning unselected.png'),
                              ),
                              SizedBox(height: 12.0),
                              Text('定位', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(positioning ? '已开启' : '已关闭', style: TextStyle(fontSize: 12.0,),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 30.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (car) {
                              car = false;
                            } else {
                              car = true;
                            }
                          });
                        },
                        child: Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: 72.0,
                                height: 72.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: car ? Color(0xFFD3FADE) : Color(0xFFD9D9D9),
                                    width: 10.0,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: car ? Color(0xFF438262).withOpacity(0.2) : Color(0xFF8A8A8A).withOpacity(0.2),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset(car ? 'image/car on.png' : 'image/car off.png'),
                              ),
                              SizedBox(height: 12.0),
                              Text('汽车', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(car ? '已开启' : '已关闭', style: TextStyle(fontSize: 12.0,),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 30.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                          });
                        },
                        child: Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: 72.0,
                                height: 72.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF8A8A8A).withOpacity(0.2),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Icon(Icons.add,color: Color(0xFF8A8A8A),size: 48),
                              ),
                              SizedBox(height: 12.0),
                              Text('更多', style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 17.0),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Divider(height: 1.0, color: Color(0xFFCEDBD5)),
                  SizedBox(height: 12.0),
                  Container(
                    height: 48.0,
                    color: Colors.white,
                    child:Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Image.asset('image/set up.png',
                              width: 36.0, height: 36.0),
                        ),
                        Text('设置', style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                  ),
                  Container(
                    height: 48.0,
                    color: Colors.white,
                    child:Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Image.asset('image/help.png',
                              width: 36.0, height: 36.0),
                        ),
                        Text('帮助', style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                  ),
                  Container(
                    height: 48.0,
                    color: Colors.white,
                    child:Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Image.asset('image/Child mode.png',
                              width: 36.0, height: 36.0),
                        ),
                        Text('儿童模式', style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFE5E5E5)),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            elevation: MaterialStateProperty.all<double>(0),
                          ),
                          onPressed: () {
                            // 执行按钮点击事件
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                          child: Container(
                            width: 200.0,
                            height: 36.0,
                            child: Center(
                              child: Text('退出登录'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
