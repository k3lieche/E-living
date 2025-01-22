import 'package:flutter/material.dart';
import 'Add rules6.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddRules5(),
    );
  }
}

class AddRules5 extends StatefulWidget {
  @override
  _AddRules5 createState() => _AddRules5();
}

class _AddRules5 extends State<AddRules5> {

  int selectedRow = -1;

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
                height: 300.0,
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
                              Navigator.pop(
                                context,
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
                                MaterialPageRoute(builder: (context) => AddRules6()),
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
                          //回家
                          GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedRow = 0;
                                });
                              },
                            child: Container(
                              height: 48.0,
                              color: selectedRow == 0 ? Color(0xFFF7FFF9) : Colors.white,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                                    child: Image.asset('image/be home.png',
                                        width: 36.0, height: 36.0),
                                  ),
                                  Text(
                                    '回家',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: selectedRow == 0 ? Color(0xFF30C084) : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(height: 1.0, color: Color(0xFFCCCCCC)),
                          //离家
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedRow = 1;
                              });
                            },
                            child: Container(
                              height: 48.0,
                              color: selectedRow == 1 ? Color(0xFFF7FFF9) : Colors.white,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                                    child: Image.asset('image/leave home.png',
                                        width: 36.0, height: 36.0),
                                  ),
                                  Text(
                                    '离家',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: selectedRow == 1 ? Color(0xFF30C084) : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Container(
                          //   height: 48.0,
                          //   color: Colors.white,
                          //   child:Row(
                          //     children: [
                          //       Padding(
                          //         padding: EdgeInsets.symmetric(horizontal: 12.0),
                          //         child: Image.asset('image/leave home.png',
                          //             width: 36.0, height: 36.0),
                          //       ),
                          //       Text('离家', style: TextStyle(fontSize: 18.0)),
                          //     ],
                          //   ),
                          // ),
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
