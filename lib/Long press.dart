import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'Add rules1.dart';

class Long_press extends StatefulWidget {
  @override
  Long_pressState createState() => Long_pressState();
}

class Long_pressState extends State<Long_press> {
  bool airconON = true;

  // 切换空调状态
  void _toggleAcStatus() {
    setState(() {
      airconON = !airconON;
    });
  }

  final controller = TextEditingController(text: "空调");
  String selectedRoom = '客厅';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body: Column(
        children: [
          SizedBox(height: 24.0),
          Container(
            height: 60.0,
            width: double.infinity, // 背景颜色
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios,color: Color(0xFFF8A8A8A)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                ),
                SizedBox(width: 124.0,),
                Text(
                  '空调',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 36.0,),
          Row(
            children: [
              SizedBox(width: 60.0),
              GestureDetector(
                onTap: () {
                  _toggleAcStatus(); // 切换空调状态
                },
                child: Image.asset(
                  airconON ? 'image/aircon btn ON.png' : 'image/aircon btn OFF.png', // 根据空调状态选择不同的图片
                  width: 70.0,
                ),
              ),
              SizedBox(width: 72.0),
              Image.asset(
                'image/air-conditioning big.png',
                width: 140.0,
              ),
            ],
          ),
          SizedBox(height: 36.0,),
          Container(
            width: 372.0,
            height: 48.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child:  Row(
                    children: [
                      Image.asset(
                        "image/air_conditioning.png",
                        width: 24.0,
                        height: 24.0,
                      ),
                      SizedBox(width: 12.0),
                      SizedBox(
                        width: 250.0,
                        child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.clear();
                  },
                  icon: Icon(Icons.clear),
                  highlightColor: Colors.transparent, // 透明色
                  splashColor: Colors.transparent,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24.0),
            child: Container(
              width: 372.0,
              height: 48.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24.0),
                    child: Text(
                      '房间',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('选择房间'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context, '客厅'),
                                  child: Text('客厅'),
                                  style: ElevatedButton.styleFrom(
                                    textStyle: TextStyle(fontSize: 16.0),
                                    minimumSize: Size(0, 32.0),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context, '卧室'),
                                  child: Text('卧室'),
                                  style: ElevatedButton.styleFrom(
                                    textStyle: TextStyle(fontSize: 16.0),
                                    minimumSize: Size(0, 32.0),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context, '厨房'),
                                  child: Text('厨房'),
                                  style: ElevatedButton.styleFrom(
                                    textStyle: TextStyle(fontSize: 16.0),
                                    minimumSize: Size(0, 32.0),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context, '卫生间'),
                                  child: Text('卫生间'),
                                  style: ElevatedButton.styleFrom(
                                    textStyle: TextStyle(fontSize: 16.0),
                                    minimumSize: Size(0, 32.0),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ).then((value) {
                        if (value != null) {
                          setState(() {
                            selectedRoom = value;
                          });
                          // 处理选择的房间值
                        }
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 24.0),
                      child: Text(
                        selectedRoom,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFF30C084),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.0,),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Addrules(ruleName: "", flag: false)),
              );},
              child:Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                width: 372.0,
                height: 48.0,
                child: Row(
                  children: [
                  SizedBox(
                  width: 44.0,
                  height: 19.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF30C084),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
                    Container(
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          '添加规则',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF30C084),
                          ),
                        ),
                      ),
                    ),
                ]),
            ),
          ),
        ]),
    );
  }
}