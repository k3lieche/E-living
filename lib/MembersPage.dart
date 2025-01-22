import 'package:flutter/material.dart';
class MembersPage extends StatefulWidget {
  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {

  bool _showPadding = true; // 控制是否显示 Padding

// 在确定删除时调用此函数
  void _onDeleteConfirmed() {
    setState(() {
      _showPadding = false; // 隐藏 Padding
    });
  }

// 在取消删除时调用此函数
  void _onDeleteCancelled() {
    Navigator.pop(context); // 关闭对话框
  }

// 在 IconButton 的 onPressed 回调中调用此函数来显示确认删除对话框
  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('是否要删除该成员？'),
        actions: [
          TextButton(
            onPressed: _onDeleteCancelled,
            child: Text(
              '取消',
              style: TextStyle(color: Color(0xFF30C084)),
            ),
          ),
          TextButton(
            onPressed: () {
              _onDeleteConfirmed();
              Navigator.pop(context);
            },
            child: Text(
              '确定',
              style: TextStyle(color: Color(0xFF30C084)),
            ),
          ),
        ],
      ),
    );
  }

  TextEditingController _textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 700.0,
          decoration: new BoxDecoration(color: Color(0xffF4F4F4)),
          child: Column(
              children: [
                SizedBox(height: 24.0),
                Container(
                  height: 108.0,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      SizedBox(width: 24.0,),
                      Container(
                        height: 48.0,
                        width: 236.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFe0f5ec),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: TextField(
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            hintText: '请输入您要搜索的内容',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 18.0),
                            hintStyle: TextStyle(color: Color(0xFF30C084)),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 24.0,),
                      Container(
                        width: 96.0,
                        height: 48.0,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('邀请已发送！'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      _textEditingController.clear();
                                      Navigator.pop(context);
                                    },
                                    child: Text('确定',style: TextStyle(color: Color(0xFF30C084),),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text('邀请',style: TextStyle(fontSize: 18.0),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF30C084),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 24.0),
                Padding(
                  padding: EdgeInsets.only(left: 28.0), // 设置左侧边距
                  child: Align(
                    alignment: Alignment.centerLeft, // 左对齐
                    child: Container(
                      height: 96.0,
                      width: 350.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child:Row(
                        children: [
                          SizedBox(width: 12.0),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(3.0), // 设置圆角半径为图片宽高的一半
                            child: Image.asset(
                              'image/Zhongling.png',
                              width: 72,
                              height: 72,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 18.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 24.0),
                              Text("钟灵",
                                style: TextStyle(fontSize: 18.0),
                              ),
                              SizedBox(height: 12.0),
                              Text("Administrator",
                                style: TextStyle(color: Color(0xFF8A8A8A), fontSize: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                _showPadding ? Padding(
                  padding: EdgeInsets.only(left: 28.0), // 设置左侧边距
                  child: Align(
                    alignment: Alignment.centerLeft, // 左对齐
                    child: Container(
                      height: 96.0,
                      width: 350.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child:Row(
                        children: [
                          SizedBox(width: 12.0),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(3.0), // 设置圆角半径为图片宽高的一半
                            child: Image.asset(
                              'image/XieMingxu.png',
                              width: 72,
                              height: 72,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 18.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 24.0),
                              Text("谢明煦",
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ],
                          ),
                          SizedBox(width: 144.0),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: Color(0xFFAAAAAA),
                              ),
                              onPressed: _showDeleteConfirmationDialog,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ) : SizedBox(),
              ]
          ),
        ),
      ),
    );
  }
}
