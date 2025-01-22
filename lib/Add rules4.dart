import 'package:flutter/material.dart';
import 'Add rules3.dart';
import 'Add rules5.dart';

class AddRules4 extends StatefulWidget {
  final bool isOn;
  final bool humidityisOn;
  final int temperature;
  final int humidity;
  final TemperatureOption temperatureOption;
  final HumidityOption humidityOption;

  const AddRules4({
    Key? key,
    required this.isOn,
    required this.humidityisOn,
    required this.temperature,
    required this.humidity,
    required this.temperatureOption,
    required this.humidityOption,
  }) : super(key: key);

  @override
  _AddRules4State createState() => _AddRules4State();
}

class _AddRules4State extends State<AddRules4> {

  List<Widget> roomContainers = [];

  TextEditingController textEditingController = TextEditingController();

  bool showContainer = false;

  bool get isOn => widget.isOn;
  bool get humidityisOn=> widget.humidityisOn;
  int get temperature=> widget.temperature;
  int get humidity=> widget.humidity;
  TemperatureOption get temperatureOption => widget.temperatureOption;
  HumidityOption get humidityOption => widget.humidityOption;

  String _getTemperatureOptionText(TemperatureOption option) {
    switch (option) {
      case TemperatureOption.LESS_THAN:
        return '≤';
      case TemperatureOption.GREATER_THAN:
        return '≥';
      default:
        return '';
    }
  }

  String _getHumidityOptionText(HumidityOption option) {
    switch (option) {
      case HumidityOption.LESS_THAN:
        return '≤';
      case HumidityOption.GREATER_THAN:
        return '≥';
      default:
        return '';
    }
  }

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
                height: 600.0,
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 48.0,
                      padding: EdgeInsets.only(right: 8.0),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddRules3()),
                              );
                            },
                            child: Text('取消',
                              style: TextStyle(color: Color(0xFF30C084),fontSize: 17.0,
                              ),
                            ),
                          ),
                          Text(
                            '选择房间',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          TextButton(
                            style: ButtonStyle(overlayColor: MaterialStateProperty.resolveWith((states)
                            {return Colors.transparent;})),//去除涟漪动画
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddRules5()),
                              );
                            },
                            child: Text('下一步',style: TextStyle(color: Color(0xFF30C084),fontSize: 17.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child:Column(
                        children: [
                          //房间
                          Container(
                            //padding: EdgeInsets.only(top: 18.0),
                            height: 36.0,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 18.0),
                                child: Text('房间',
                                    style: TextStyle(color: Color(0xFF8A8A8A), fontSize: 10.0)),
                              ),
                            ),
                          ),

                          Container(
                            height: 60.0,
                            margin: const EdgeInsets.only(bottom: 10.0),
                            color: Colors.white,
                            child:Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Image.asset('image/room.png',
                                      width: 36.0, height: 36.0),
                                ),
                                Text('客厅', style: TextStyle(fontSize: 18.0)),
                                SizedBox(width: 72.0),
                                Column(
                                  crossAxisAlignment:  CrossAxisAlignment.start,
                                  children: [
                                    if (isOn && humidityisOn)
                                      SizedBox(height: 6.0),
                                    //SizedBox(height: 18.0),
                                    if (isOn && !humidityisOn)
                                      SizedBox(height: 18.0),
                                    if (!isOn && humidityisOn)
                                      SizedBox(height: 18.0),
                                    if (isOn)
                                      Row(
                                        children: [
                                          Image.asset('image/temperature.png',
                                              width: 24.0, height: 24.0),
                                          SizedBox(width: 6.0),
                                          Text('室内温度'),
                                          SizedBox(width: 6.0),
                                          Text('${_getTemperatureOptionText(temperatureOption)}',
                                            style: TextStyle(
                                              color: Color(0xFF30C084)
                                            ),
                                          ),
                                          Text('${temperature}.0℃',
                                            style: TextStyle(
                                                color: Color(0xFF30C084)
                                            ),),
                                        ],
                                      ),
                                    if (humidityisOn)
                                      Row(
                                        children: [
                                          Image.asset('image/humidity.png',
                                              width: 24.0, height: 24.0),
                                          SizedBox(width: 6.0),
                                          Text('室内湿度'),
                                          SizedBox(width: 6.0),
                                          Text('${_getHumidityOptionText(humidityOption)}',
                                            style: TextStyle(
                                                color: Color(0xFF30C084)
                                            ),),
                                          Text('${humidity}%',
                                            style: TextStyle(
                                                color: Color(0xFF30C084)
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: roomContainers, // 遍历roomContainers列表
                          ),

                          SizedBox(height: 8.0),

                          //添加房间
                          InkWell(//添加房间弹窗
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('添加房间'),
                                  content: TextField(
                                    controller: textEditingController,
                                    decoration: InputDecoration(
                                      hintText: '请输入房间名称',
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('取消'),
                                    ),
                                    TextButton(
                                      child: Text('确定'),
                                      onPressed: () {
                                        setState(() {
                                          Container newContainer = Container(
                                            height: 60.0,
                                            margin: const EdgeInsets.only(top: 6.0,bottom: 8.0),
                                            color: Colors.white,
                                            child:Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                                                  child: Image.asset('image/room.png',
                                                      width: 36.0, height: 36.0),
                                                ),
                                                Text(textEditingController.text, style: TextStyle(fontSize: 18.0)),
                                                SizedBox(width: 72.0),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    if (isOn && humidityisOn) // 如果 isOn 和 humidityisOn 都为真，添加一个 SizedBox
                                                      SizedBox(height: 6.0),
                                                    //SizedBox(height: 18.0),
                                                    if (isOn && !humidityisOn)
                                                      SizedBox(height: 18.0),
                                                    if (!isOn && humidityisOn)
                                                      SizedBox(height: 18.0),
                                                    if (isOn)
                                                      Row(
                                                        children: [
                                                          Image.asset('image/temperature.png',
                                                              width: 24.0, height: 24.0),
                                                          SizedBox(width: 6.0),
                                                          Text('室内温度'),
                                                          SizedBox(width: 6.0),
                                                          Text('${_getTemperatureOptionText(temperatureOption)}',
                                                            style: TextStyle(
                                                                color: Color(0xFF30C084)
                                                            ),
                                                          ),
                                                          Text('${temperature}.0℃',
                                                            style: TextStyle(
                                                                color: Color(0xFF30C084)
                                                            ),),
                                                        ],
                                                      ),
                                                    if (humidityisOn)
                                                      Row(
                                                        children: [
                                                          Image.asset('image/humidity.png',
                                                              width: 24.0, height: 24.0),
                                                          SizedBox(width: 6.0),
                                                          Text('室内湿度'),
                                                          SizedBox(width: 6.0),
                                                          Text('${_getHumidityOptionText(humidityOption)}',
                                                            style: TextStyle(
                                                                color: Color(0xFF30C084)
                                                            ),),
                                                          Text('${humidity}%',
                                                            style: TextStyle(
                                                                color: Color(0xFF30C084)
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                          roomContainers.add(newContainer);
                                          textEditingController.clear();
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Container(
                              width: 336.0,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                  SizedBox(width: 6.0),
                                  Text(
                                    '添加房间',
                                    style: TextStyle(fontSize: 16.0, color: Color(0xFF30C084)),
                                  ),
                                ],
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