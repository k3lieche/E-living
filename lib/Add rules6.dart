import 'package:flutter/material.dart';
import 'Add rules5.dart';
import 'Add rules7.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddRules6(),
    );
  }
}

class AddRules6 extends StatefulWidget {
  @override
  _AddRules6 createState() => _AddRules6();
}

class _AddRules6 extends State<AddRules6> {

  bool acOn = false;
  bool toplOn = false;
  bool lampOn = false;
  bool curtainOn = false;

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
                height: 350.0,
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
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.resolveWith((states) {
                                return Colors.transparent;
                              }),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddRules5()),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(Icons.arrow_back_ios,
                                  color: Color(0xFF30C084),
                                  size: 18.0,),
                                Text(
                                  '条件',
                                  style: TextStyle(
                                    color: Color(0xFF30C084),
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            '场景',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(width: 10.0),
                          TextButton(
                            style: ButtonStyle(overlayColor: MaterialStateProperty.resolveWith((states)
                            {return Colors.transparent;})),//去除涟漪动画
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddRules7()),
                              );
                            },
                            child: Text('下一步',style:
                            TextStyle(color: Color(0xFF30C084),fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //选择要设置的场景
                    Container(
                      //padding: EdgeInsets.only(top: 18.0),
                      height: 36.0,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: Text('选择要设置的场景',
                              style: TextStyle(color: Color(0xFF8A8A8A), fontSize: 10.0)),
                        ),
                      ),
                    ),
                    Container(
                      //padding: EdgeInsets.only(top: 15.0),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //空调
                          Container(
                            height: 48.0,
                            color: Colors.white,
                            child:Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Image.asset('image/power switch.png',
                                      width: 36.0, height: 36.0),
                                ),
                                Text('空调', style: TextStyle(fontSize: 18.0)),
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    setState(() {
                                      acOn = !acOn;
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 168.0),
                                    child: Image.asset(
                                      acOn ? 'image/btn on.png' : 'image/btn off.png',
                                        width: 48.0, height: 24.0
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(height: 1.0, color: Color(0xFFCCCCCC)),
                          //顶灯
                          Container(
                            height: 48.0,
                            color: Colors.white,
                            child:Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Image.asset('image/power switch.png',
                                      width: 36.0, height: 36.0),
                                ),
                                Text('顶灯', style: TextStyle(fontSize: 18.0)),
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    setState(() {
                                      toplOn = !toplOn;
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 168.0),
                                    child: Image.asset(
                                        toplOn ? 'image/btn on.png' : 'image/btn off.png',
                                        width: 48.0, height: 24.0
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(height: 1.0, color: Color(0xFFCCCCCC)),
                          //台灯
                          Container(
                            height: 48.0,
                            color: Colors.white,
                            child:Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Image.asset('image/power switch.png',
                                      width: 36.0, height: 36.0),
                                ),
                                Text('台灯', style: TextStyle(fontSize: 18.0)),
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    setState(() {
                                      lampOn = !lampOn;
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 168.0),
                                    child: Image.asset(
                                        lampOn ? 'image/btn on.png' : 'image/btn off.png',
                                        width: 48.0, height: 24.0
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(height: 1.0, color: Color(0xFFCCCCCC)),
                          //窗帘
                          Container(
                            height: 48.0,
                            color: Colors.white,
                            child:Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Image.asset('image/power switch.png',
                                      width: 36.0, height: 36.0),
                                ),
                                Text('窗帘', style: TextStyle(fontSize: 18.0)),
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    setState(() {
                                      curtainOn = !curtainOn;
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 168.0),
                                    child: Image.asset(
                                        curtainOn ? 'image/btn on.png' : 'image/btn off.png',
                                        width: 48.0, height: 24.0
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
