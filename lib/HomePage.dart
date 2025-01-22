import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'MessagePage.dart';
import 'sidebarPage.dart';
import 'LightPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<String> _rooms = ['全部', '客厅', '厨房', '卧室', '卫生间'];
  int _selectedroomIndex = 0;
  double _underlineLeftOffset = 0.0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedroomIndex = index;
      _underlineLeftOffset = index * 64.0; // 下划线移动，每个标签的宽度都为 64.0
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

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('zh_CN', null);
    fetchWeatherData(city);
  }
  void onCityChanged(String cityName) {
    setState(() {
      city = cityName;
    });
    fetchWeatherData(cityName);
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
              SizedBox(height: 8.0),
              Image.asset(
                status ?  "${appliance['imageSe']}" : "${appliance['image']}", // 根据项是否被点击来选择图像
                width: 32.0,
                height: 32.0,
              ),
              SizedBox(height: 8.0), // 图像和文本之间的空白间距
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


//情景模式
  final List<String> images = [
    'image/be home.png', 'image/leave home.png', 'image/sleep.png',
    'image/bath.png', 'image/movie.png'
  ];

  final List<String> selectedImages = [
    'image/be home selected.png', 'image/leave home selected.png', 'image/sleep selected.png',
    'image/bath selected.png', 'image/movie selected.png'
  ];

  final List<String> scenes = [
    '回家', '离家', '睡眠', '卫浴', '影音'
  ];

//天气API
  String city = "Hangzhou";
  String weather = "";
  String description = "";
  String icon = "";
  List<String> cities = ['Hangzhou', 'Beijing', 'Shanghai', 'Guangzhou', 'Cairo'];

  Future<void> fetchWeatherData(String cityName) async {
    final response = await http.get(Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=12b2817fbec86915a6e9b4dbbd3d9036&units=metric"));
    final data = jsonDecode(response.body);
    setState(() {
      final temp = data['main']['temp'];
      weather = temp.truncate().toString();
      description = data['weather'][0]['description'];
      icon = data['weather'][0]['icon'];
    });
  }



  @override
  Widget build(BuildContext context) {

    final now = DateTime.now();
    String greeting;

    if (now.hour < 6) {
      greeting = '凌晨好';
    } else if (now.hour < 9) {
      greeting = '早上好';
    } else if (now.hour < 12) {
      greeting = '上午好';
    } else if (now.hour < 14) {
      greeting = '中午好';
    } else if (now.hour < 17) {
      greeting = '下午好';
    } else if (now.hour < 19) {
      greeting = '傍晚好';
    } else if (now.hour < 22) {
      greeting = '晚上好';
    } else {
      greeting = '夜深了';
    }

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
        child: Container(
          width: double.infinity,
          height: 600.0,
          decoration: new BoxDecoration(color: Color(0xffF4F4F4)),
          child: Column(
            children: [
              SizedBox(height: 12.0),
              Padding(
                padding: EdgeInsets.only(left: 60.0), // 设置左侧边距
                child: Align(
                  alignment: Alignment.centerLeft, // 左对齐
                  child: Text(
                    greeting + '！',
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
              ),
              SizedBox(height: 6.0),
              Padding(
                padding: EdgeInsets.only(left: 60.0), // 设置左侧边距
                child: Align(
                  alignment: Alignment.centerLeft, // 左对齐
                  child: Text(
                    '今天是${DateFormat('M月d日 EEEE', 'zh_CN').format(
                        DateTime.now())}',
                    style: TextStyle(color: Color(0xFF30C084), fontSize: 15.0),
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              Container(
                width: 370.0,
                height: 150.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 70.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropdownButton<String>(
                          value: city,
                          underline: Container(
                            height: 2,
                            color: Color(0xFF30C084),
                          ),
                          onChanged: (String? cityName) {
                            if (cityName != null) {
                              setState(() {
                                city = cityName;
                              });
                              fetchWeatherData(cityName);
                            }
                          },
                          items: cities.map((String cityName) {
                            return DropdownMenuItem<String>(
                              value: cityName,
                              child: Text(cityName),
                            );
                          }).toList(),
                        ),
                        Text(
                          '$weather℃',
                          style: TextStyle(fontSize: 36.0),
                        ),
                        Text(
                          '$description',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 16.0,),
                      ],
                    ),

                    SizedBox(width: 48.0),
                    Image.network(
                      'https://openweathermap.org/themes/openweathermap/assets/vendor/owm/img/widgets/$icon.png',
                      width: 108,
                      height: 108,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 11.0),
              Padding(
                padding: EdgeInsets.only(left: 24.0), // 设置左侧边距
                child: Align(
                  alignment: Alignment.centerLeft, // 左对齐
                  child: Text('场景模式',
                    style: TextStyle(fontSize: 16.0),),
                ),
              ),
              SizedBox(height: 11.0),
              Container(
                height: 78.0,
                child: ListView.builder(
                  itemCount: scenes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      _buildScrollView(scenes[index], index),
                ),
              ),
              SizedBox(height: 18.0),
              Padding(
                padding: EdgeInsets.only(left: 18.0), // 设置左侧边距
                child: Align(
                  alignment: Alignment.centerLeft, // 左对齐
                  child: Container(
                    height: 36.0,
                    width: 320.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17.0),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _rooms.asMap().entries.map((entry) {
                            final int index = entry.key;
                            final String room = entry.value;
                            final bool isSelected = index == _selectedroomIndex;
                            final Color textColor = isSelected ? Color(0xFF30C084) : Color(0xFF8A8A8A);
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
                                    fontSize: 16.0,
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
                            offset: Offset(14.0, 1.0),
                            child: Container(
                              height: 2.0,
                              width: 36.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF30C084),
                                borderRadius: BorderRadius.circular(1.0),
                              ),
                            ),
                          ),
                          duration: Duration(milliseconds: 150), // 动画持续时间为 150 毫秒
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                height: 85.0,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: GridView.count(
                  crossAxisCount: 4,
                  childAspectRatio: 1.1,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  children: _buildApplianceList(),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
  Set<int> _selectedScenes = {};

  void _selectScene(int index, String weather)  {
    setState(() {
      if (_selectedScenes.contains(index)) {
        _selectedScenes.remove(index);
      } else {
        _selectedScenes.clear();
        _selectedScenes.add(index);
        if (index == 0 && int.parse(weather) >= 32) { // 如果选中回家模式并且气温超过等于32度
          _applianceStatus['空调'] = true;
        }// 将空调的状态改为true
        if (index == 0 && int.parse(weather) <= 22) {
          _applianceStatus['空调'] = false;
        }
      }
    });
  }

  bool _isSceneSelected(int index) {
    return _selectedScenes.contains(index);
  }

  Widget _buildScrollView(String scene, int index) {

    Color backgroundColor = _isSceneSelected(index) ? Color(0xFFE0F5EC) : Color(0xFFE6E6E6);
    Color textColor = _isSceneSelected(index) ? Color(0xFF438262) : Color(0xFF8A8A8A);
    String image = _isSceneSelected(index) ? selectedImages[index] : images[index];

    return InkWell(
      onTap: () {
        setState(() {
          _selectScene(index, weather); // 将天气传递给_selectScene函数
        });
      },
      child: Container(
        width: 108.0,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(32.0),
          border: Border.all(width: 10.0, color: Colors.white),
        ),
        margin: EdgeInsets.only(left: 12.0, right: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.0),
            Expanded(
              child: Row(
                children: [
                  SizedBox(width: 8.0),
                  Image.asset(image, height: 24.0, width: 24.0),
                  SizedBox(width: 8.0),
                  Center(
                    child: Text(scene,
                        style: TextStyle(fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: textColor)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}


