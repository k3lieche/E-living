import 'package:flutter/material.dart';
import 'main.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {

  bool _allRead = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body:

      Column(
          children: [
            SizedBox(height: 24.0),
            Container(
              height: 60.0,
              width: double.infinity, // Set the background color of the container
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Color(0xFF8A8A8A)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    },
                  ),
                  SizedBox(width: 126.0),
                  Text('消息',
                    style: TextStyle(color: Colors.black, fontSize: 22.0,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.0),
            Container(
              height: 500.0,
              width: 336.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Container(
                    height: 48.0,
                    color: Colors.white,
                    child:Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text(
                            _allRead ? '0条未读' : '2条未读',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  _allRead = true;
                                });
                              },
                              minWidth: 0,
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                '全部已读',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: _allRead ? Color(0xFF8A8A8A) : Color(0xFF30C084),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 1.0, color: Color(0xFFCCCCCC)),
                  Container(
                    height: 60.0,
                    color: Colors.white,
                    child:Row(
                      children: [
                        if (!_allRead)
                          SizedBox(width: 12.0),
                        if (!_allRead)
                          Container(
                            width: 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ),
                        SizedBox(width: _allRead ? 10.0 : 6.0,),
                        Image.asset(_allRead ? 'image/sweeper off.png': 'image/sweeper on.png', width: 36.0, height: 36.0),
                        SizedBox(width: 6.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('扫地机', style: TextStyle(fontSize: 16.0)),
                            Text('清扫完成', style: TextStyle(fontSize: 10.0,color: Color(0xFF8A8A8A)),
                            ),
                          ],
                        ),
                        SizedBox(width: _allRead ? 162.0 : 150.0,),
                        Text('30分钟前', style: TextStyle(color: Color(0xFF8A8A8A)),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 1.0, color: Color(0xFFCCCCCC)),
                  Container(
                    height: 60.0,
                    color: Colors.white,
                    child:Row(
                      children: [
                        if (!_allRead)
                          SizedBox(width: 12.0),
                        if (!_allRead)
                          Container(
                            width: 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ),
                        SizedBox(width: _allRead ? 10.0 : 6.0,),
                        Image.asset(_allRead ? 'image/washing machine.png': 'image/washing machine selected.png', width: 36.0, height: 36.0),
                        SizedBox(width: 6.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('洗衣机', style: TextStyle(fontSize: 16.0)),
                            Text('洗衣完成', style: TextStyle(fontSize: 10.0,color: Color(0xFF8A8A8A)),
                            ),
                          ],
                        ),
                        SizedBox(width: _allRead ? 170.0 : 158.0,),
                        Text('1小时前', style: TextStyle(color: Color(0xFF8A8A8A)),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 1.0, color: Color(0xFFCCCCCC)),
                ],
              ),
            ),
          ]),
    );
  }
}
