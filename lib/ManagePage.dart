import 'package:flutter/material.dart';
import 'Long press.dart';
import 'MessagePage.dart';
import 'sidebarPage.dart';
import 'LightPage.dart';


class ManagePage extends StatefulWidget {
  @override
  _ManagePageState createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {

  final List<String> _rooms = ['全部', '客厅', '厨房', '卧室', '卫生间'];
  int _selectedroomIndex = 0;
  double _underlineLeftOffset = 0.0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedroomIndex = index;
      _underlineLeftOffset = index * 72.0; // 下划线移动，每个标签的宽度都为 64.0
      _selectRoom(_rooms[index]);
    });
  }

  List<Map<String, Object>> _appliances = [
    {'name': '窗帘', 'room': '卧室','image': "image/curtain.png",'imageSe': "image/curtain selected.png"},
    {'name': '空调', 'room': '卧室','image': "image/air_conditioning unselected.png",'imageSe': "image/air_conditioning.png"},
    {'name': '投影', 'room': '客厅','image': "image/projection off.png",'imageSe': "image/projection on.png",},
    {'name': '顶灯', 'room': '客厅','image': "image/Light unselected.png",'imageSe': "image/Lightselected.png"},
    {'name': '扫地机', 'room': '客厅','image': "image/sweeper off.png",'imageSe': "image/sweeper on.png"},
    {'name': '传感器', 'room': '厨房','image': "image/sensor.png",'imageSe': "image/sensor selected.png"},
    {'name': '排风扇', 'room': '厨房','image': "image/extractor.png",'imageSe': "image/extractor selected.png"},
    {'name': '洗衣机', 'room': '卫生间','image': "image/washing machine.png",'imageSe': "image/washing machine selected.png"},
  ];
  String _selectedRoom = '全部';

  Map<String, bool> _applianceStatus = {
    '窗帘': false,
    '空调': false,
    '投影': false,
    '顶灯': false,
    '扫地机': false,
    '传感器': false,
    '排风扇': false,
    '洗衣机': false,
  };

  void updateApplianceStatus(String name, bool status) {
    setState(() {
      _applianceStatus[name] = status;
    });
  }


  List<Widget> _buildApplianceList() {
    return _appliances.where((appliance) {
      return _selectedRoom == '全部' || appliance['room'] == _selectedRoom;
    }).toList().asMap().entries.map((entry) {
      //int index = entry.key;
      Map<String, dynamic> appliance = entry.value;

      bool status = _applianceStatus[appliance['name']]!;

      return GestureDetector(
        onTap: () {
          setState(() {
            _applianceStatus[appliance['name']] = !status;
          });
        },
        onLongPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Long_press()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFCCCCCC),
                blurRadius: 2.0,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18.0),
              Image.asset(
                status ?  "${appliance['imageSe']}" : "${appliance['image']}", // 根据项是否被点击来选择图像
                width: 36.0,
                height: 36.0,
              ),
              SizedBox(height: 12.0), // 图像和文本之间的空白间距
              Text(
                appliance['name'].toString(),
                style: TextStyle(color: status ? Color(0xFF30C084) : Color(0xFF8A8A8A),fontSize: 16.0),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  void _selectRoom(String room) {
    setState(() {
      _selectedRoom = room;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset(
            'image/sidebar.png', // 图片路径
            width: 30.0, // 设置宽度
            height: 30.0, // 设置高度
          ),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => sidebarPage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'image/message.png', // 图片路径
              width: 30.0, // 设置宽度
              height: 30.0, // 设置高度
            ),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagePage()),
              );
            },
          ),
        ],
        title: Container(
          height: 36.0,
          decoration: BoxDecoration(
            color: Color(0xFFe0f5ec),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Color(0xFF30C084),),
              border: InputBorder.none,
              prefixIcon: GestureDetector(
                child: Icon(Icons.search, color: Color(0xFF30C084)),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LightPage()));
                },
              ),
            ),
          ),
        ),
      ),
        body: SingleChildScrollView(
          child:  Container(
            width: double.infinity,
            height: 600.0,
            decoration: new BoxDecoration(color: Color(0xffF4F4F4)),
            child: Column(
                children: [
                  SizedBox(height: 24.0),
                  Padding(
                    padding: EdgeInsets.only(left: 18.0), // 设置左侧边距
                    child: Align(
                      alignment: Alignment.centerLeft, // 左对齐
                      child: Container(
                        height: 36.0,
                        width: 370.0,
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: _rooms.asMap().entries.map((entry) {
                                final int index = entry.key;
                                final String room = entry.value;
                                final bool isSelected = index == _selectedroomIndex;
                                final Color textColor = isSelected ? Colors.black : Color(0xFF8A8A8A);
                                final FontWeight fontWeight = isSelected ? FontWeight.bold : FontWeight.normal;
                                return InkWell(
                                  onTap: () => _onTabSelected(index),
                                  borderRadius: BorderRadius.circular(17.0),
                                  child: Container(
                                    width: 64.0,
                                    height: 30.0,
                                    alignment: Alignment.center,
                                    child: Text(
                                      room,
                                      style: TextStyle(
                                          color: textColor,
                                          fontSize: 20.0,
                                          fontWeight:fontWeight
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(17.0),
                                      border: Border(bottom: BorderSide.none, top: BorderSide.none),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            AnimatedPositioned(
                              left: _underlineLeftOffset,
                              bottom: 0.0,
                              child: Transform.translate(
                                offset: Offset(10.0, 1.0),
                                child: Container(
                                  height: 2.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF30C084),
                                    borderRadius: BorderRadius.circular(1.0),
                                  ),
                                ),
                              ),
                              duration: Duration(milliseconds: 100), // 动画持续时间为 200 毫秒
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    height: 400.0,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                      children: _buildApplianceList(),
                    ),
                  ),
                ]
            ),
          ),
        ),
    );
  }
}
