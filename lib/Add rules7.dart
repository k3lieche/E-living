import 'package:flutter/material.dart';
import 'Add rules6.dart';
import 'Add rules1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddRules7(),
    );
  }
}

class AddRules7 extends StatefulWidget {
  @override
  _AddRules7 createState() => _AddRules7();
}

class _AddRules7 extends State<AddRules7> {

  bool flag = true;

  TextEditingController new_rule_name = TextEditingController();

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
                                MaterialPageRoute(builder: (context) => AddRules6()),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(Icons.arrow_back_ios,
                                  color: Color(0xFF30C084),
                                  size: 18.0,),
                                Text(
                                  '操作',
                                  style: TextStyle(
                                    color: Color(0xFF30C084),
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 3.0),
                          Text(
                            '规则命名',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(width: 10.0),
                          TextButton(
                            style: ButtonStyle(overlayColor: MaterialStateProperty.resolveWith((states)
                            {return Colors.transparent;})),//去除涟漪动画
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Addrules(
                                    ruleName: new_rule_name.text,
                                    flag: true)),
                              );
                            },
                            child: Text('完成',style:
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
                          child: Text('为此规则输入一个唯一的名称',
                              style: TextStyle(color: Color(0xFF8A8A8A), fontSize: 10.0)),
                        ),
                      ),
                    ),
                    Container(
                      //padding: EdgeInsets.only(left: 15.0),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 48.0,
                            color: Colors.white,
                            padding: EdgeInsets.only(left: 24.0), // 设置左边距
                            child: TextField(
                              controller: new_rule_name,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '规则名称',
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.clear),
                                  onPressed: () {
                                    setState(() {
                                      new_rule_name.clear();
                                    });
                                  },
                                ),
                              ),
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
