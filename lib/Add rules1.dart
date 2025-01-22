import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/Long%20press.dart';
import 'Add rules2.dart';
import 'Long press.dart';

class Addrules extends StatefulWidget {

  final bool flag;
  final String ruleName;
  const Addrules({Key? key, required this.ruleName, required this.flag}) : super(key: key);

  _AddrulesState createState() => _AddrulesState();
}

class _AddrulesState extends State<Addrules> {
  final controller = TextEditingController(text: "空调");
  String selectedRoom = '客厅';
  bool get flag =>widget.flag;
  String get ruleName => widget.ruleName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            // 点击返回按钮时执行的操作
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Long_press()),
            );
          },
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 96.0), // 设置左右内边距
          child: Text(
            '添加规则',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body:SingleChildScrollView(
        child: Container(
          height: 600.0,
          decoration: new BoxDecoration(color: Color(0xffF4F4F4)),
          child:  Column(
            children: [
              SizedBox(height: 16.0),
              Text(
                '规则至少需要一个触发器。它可以包含必须满足的条件。',
                style: TextStyle(color: Color(0xFF8A8A8A), fontSize: 12.0),
              ),
              SizedBox(height: 16.0),
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
                padding: EdgeInsets.only(top: 36.0),
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

              Padding(
                padding: EdgeInsets.only(top: 36.0),
                child: Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        final RenderBox button =
                        context.findRenderObject() as RenderBox;
                        final Offset offset = button.localToGlobal(Offset.zero);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Positioned(
                              left: offset.dx - 396.0,
                              top: offset.dy + 144.0,
                              child: CustomDialog(),
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        width: 372.0,
                        height: 48.0,
                        child: Row(children: [
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
                  ),
                ),
              ),
              SizedBox(height: 36.0),
              if(flag)
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
                          padding: EdgeInsets.only(left: 24.0),
                          child: Text(
                            ruleName,
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ]
                  ),
                ),
            ],
          ),
        ),
      ),

    );
  }
}


class CustomDialog extends StatefulWidget {
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: Color(0xFFF2F2F2),
      titlePadding: EdgeInsets.zero,
      title: Container(
        height: 54.0,
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
              {return Colors.transparent;})),//去除涟漪动画
              onPressed: () {
                // Open second dialog
                Navigator.pop(context);
              },
              child: Text('取消',
                style: TextStyle(color: Color(0xFF30C084),fontSize: 17.0,
                ),
              ),
            ),
            Text(
              '添加规则',
              style: TextStyle(fontSize: 18.0),
            ),
            TextButton(
              style: ButtonStyle(overlayColor: MaterialStateProperty.resolveWith((states)
              {return Colors.transparent;})),//去除涟漪动画
              onPressed: () {
                // Open second dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddRules2()),
                );
              },
              child: Text('下一步',style: TextStyle(color: Color(0xFF30C084),fontSize: 17.0),
              ),
            ),
          ],
        ),
      ),
      content: SizedBox(
        width: 936.0,
        height: 250.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('规则至少需要一个触发器。它可以包含必须满足的条件。因此，它可以设置一个或多个场景。',
              style: TextStyle(color: Color(0xFF8A8A8A), fontSize: 10.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 84,
                  height: 108,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xFF8A8A8A)),
                    color: Colors.white,
                  ),
                  child: ElevatedButton(
                    onPressed:null,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '触发器',
                          style: TextStyle(fontSize: 14.0),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 12.0),
                        Image.asset('image/trigger.png', width: 32.0, height: 32.0),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
                Container(
                  width: 84,
                  height: 108,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xFF8A8A8A)),
                    color: Colors.white,
                  ),
                  child: ElevatedButton(
                    onPressed:null,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '条件',
                          style: TextStyle(fontSize: 14.0),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8.0),
                        Image.asset('image/condition.png', width: 36.0, height: 36.0),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
                Container(
                  width: 84,
                  height: 108,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xFF8A8A8A)),
                    color: Colors.white,
                  ),
                  child: ElevatedButton(
                    onPressed:null,
                    //onPressed: () {
                    //setState(() {
                    //_selectedOption = '场景';
                    //});
                    //Navigator.pop(context); // 关闭对话框
                    //},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '场景',
                          style: TextStyle(fontSize: 14.0),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 12.0),
                        Image.asset('image/scene.png', width: 32.0, height: 32.0),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '创建规则仅需三步。',
                style: TextStyle(color: Color(0xFF8A8A8A), fontSize: 10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



