import 'package:flutter/material.dart';
import 'Add rules2.dart';
import 'Add rules4.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddRules3(),
    );
  }
}

enum TemperatureOption { LESS_THAN, GREATER_THAN }
enum HumidityOption { LESS_THAN, GREATER_THAN }

class AddRules3 extends StatefulWidget {
  @override
  _AddRules3 createState() => _AddRules3();
}

class _AddRules3 extends State<AddRules3> {
  int temperature = 32;
  int humidity = 50;

  bool isOn = false;
  void tempButton() {
    setState(() {
      isOn = !isOn;
    });
  }

  bool humidityisOn = false;
  void humButton() {
    setState(() {
      humidityisOn = !humidityisOn;
    });
  }

  TemperatureOption _selectedOption = TemperatureOption.LESS_THAN;

  void _handleOptionSelected(TemperatureOption option) {
    setState(() {
      _selectedOption = option;
    });
  }

  HumidityOption _selectedHumidityOption = HumidityOption.LESS_THAN;

  void _handleHumidityOptionSelected(HumidityOption option) {
    setState(() {
      _selectedHumidityOption = option;
    });
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
                height: 500.0,
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
                                MaterialPageRoute(builder: (context) => AddRules2()),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(Icons.arrow_back_ios,
                                  color: Color(0xFF30C084),
                                  size: 16.0,),
                                Text(
                                  '添加触发器',
                                  style: TextStyle(
                                    color: Color(0xFF30C084),
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '温度',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(width: 10.0),
                          TextButton(
                            style: ButtonStyle(overlayColor: MaterialStateProperty.resolveWith((states)
                            {return Colors.transparent;})),//去除涟漪动画
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddRules4(
                                    isOn: isOn,
                                    humidityisOn: humidityisOn,
                                    temperature: temperature,
                                    humidity: humidity,
                                    temperatureOption: _selectedOption,
                                    humidityOption: _selectedHumidityOption,
                                ),),
                              );
                            },
                            child: Text('添加',style:
                            TextStyle(color: Color(0xFF30C084),fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //动应用于触发的设置，然后选择触发值
                    Container(
                      //padding: EdgeInsets.only(top: 18.0),
                      height: 36.0,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: Text('启动应用于触发的设置，然后选择触发值。',
                              style: TextStyle(color: Color(0xFF8A8A8A), fontSize: 10.0)),
                        ),
                      ),
                    ),
                    //默认房间
                    Container(
                      height: 15.0,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: Text('默认房间',
                              style: TextStyle(color: Color(0xFF8A8A8A), fontSize: 10.0)),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15.0),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //温度
                          Container(
                            padding: EdgeInsets.only(top: 6.0),
                            height: isOn ? 170.0 : 48.0,
                            color: Colors.white,
                            child:Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Image.asset('image/temperature.png',
                                      width: 36.0, height: 36.0),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 3.0),
                                      Text(
                                        '室内温度',
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                      Visibility(
                                        visible: isOn,
                                        child: SizedBox(height: 12.0),
                                      ),
                                      Visibility(
                                        visible: isOn,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '$temperature.0℃',
                                              style: TextStyle(fontSize: 38.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Visibility(
                                        visible: isOn,
                                        child: SizedBox(height: 12.0),
                                      ),
                                      Visibility(
                                        visible: isOn,
                                        child: Container(
                                          height: 36.0,
                                          width: 114.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF30C084),
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    temperature++;
                                                  });
                                                },
                                                child: Image.asset('image/upward.png', width: 48.0, height: 48.0),
                                              ),
                                              Container(
                                                height: double.infinity,
                                                width: 1.0,
                                                color: Colors.white,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    temperature--;
                                                  });
                                                },
                                                child: Image.asset('image/downward.png', width: 48.0, height: 48.0),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //SizedBox(width: 30.0),
                                  Expanded(
                                    child: Column(children: [
                                      SizedBox(
                                        height: 36.0,
                                        width: 72.0,
                                        child: GestureDetector(
                                          onTap: () {
                                            tempButton();
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 24.0),
                                            child: Image.asset(
                                              isOn ? 'image/btn on.png' : 'image/btn off.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: isOn,
                                        child: SizedBox(height: 12.0),
                                      ),
                                      Visibility(
                                        visible: isOn,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () => _handleOptionSelected(TemperatureOption.LESS_THAN),
                                              child: Container(
                                                height: 36.0,
                                                width: 48.0,
                                                decoration: BoxDecoration(
                                                  color: _selectedOption == TemperatureOption.LESS_THAN
                                                      ? Color(0xFF30C084)
                                                      : Color(0xFFD3FADE),
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(10.0),
                                                    bottomLeft: Radius.circular(10.0),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '≤',
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      color: _selectedOption == TemperatureOption.LESS_THAN
                                                          ? Colors.white
                                                          : Color(0xFF62dba3),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () => _handleOptionSelected(TemperatureOption.GREATER_THAN),
                                              child: Container(
                                                height: 36.0,
                                                width: 48.0,
                                                decoration: BoxDecoration(
                                                  color: _selectedOption == TemperatureOption.GREATER_THAN
                                                      ? Color(0xFF30C084)
                                                      : Color(0xFFD3FADE),
                                                  borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(10.0),
                                                    bottomRight: Radius.circular(10.0),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '≥',
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      color: _selectedOption == TemperatureOption.GREATER_THAN
                                                          ? Colors.white
                                                          : Color(0xFF62dba3),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Divider(height: 1.0, color: Color(0xFFCCCCCC)),
                          //湿度
                          Container(
                            padding: EdgeInsets.only(top: 6.0),
                            height: humidityisOn ? 170.0 : 48.0,
                            color: Colors.white,
                            child:Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Image.asset('image/humidity.png',
                                      width: 36.0, height: 36.0),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 3.0),
                                      Text(
                                        '室内湿度',
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                      Visibility(
                                        visible: humidityisOn,
                                        child: SizedBox(height: 12.0),
                                      ),
                                      Visibility(
                                        visible: humidityisOn,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '$humidity%',
                                              style: TextStyle(fontSize: 38.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Visibility(
                                        visible: humidityisOn,
                                        child: SizedBox(height: 12.0),
                                      ),
                                      Visibility(
                                        visible: humidityisOn,
                                        child: Container(
                                          height: 36.0,
                                          width: 114.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF30C084),
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    humidity++;
                                                  });
                                                },
                                                child: Image.asset('image/upward.png', width: 48.0, height: 48.0),
                                              ),
                                              Container(
                                                height: double.infinity,
                                                width: 1.0,
                                                color: Colors.white,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    humidity--;
                                                  });
                                                },
                                                child: Image.asset('image/downward.png', width: 48.0, height: 48.0),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //SizedBox(width: 30.0),
                                Expanded(
                                  child: Column(children: [
                                    SizedBox(
                                      height: 36.0,
                                      width: 72.0,
                                      child: GestureDetector(
                                        onTap: () {
                                          humButton();
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 24.0),
                                          child: Image.asset(
                                            humidityisOn ? 'image/btn on.png' : 'image/btn off.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: humidityisOn,
                                      child: SizedBox(height: 12.0),
                                    ),
                                    Visibility(
                                      visible: humidityisOn,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () => _handleHumidityOptionSelected(HumidityOption.LESS_THAN),
                                            child: Container(
                                              height: 36.0,
                                              width: 48.0,
                                              decoration: BoxDecoration(
                                                color: _selectedHumidityOption == HumidityOption.LESS_THAN
                                                    ? Color(0xFF30C084)
                                                    : Color(0xFFD3FADE),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10.0),
                                                  bottomLeft: Radius.circular(10.0),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '≤',
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    color: _selectedHumidityOption == HumidityOption.LESS_THAN
                                                        ? Colors.white
                                                        : Color(0xFF62dba3),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () => _handleHumidityOptionSelected(HumidityOption.GREATER_THAN),
                                            child: Container(
                                              height: 36.0,
                                              width: 48.0,
                                              decoration: BoxDecoration(
                                                color: _selectedHumidityOption == HumidityOption.GREATER_THAN
                                                    ? Color(0xFF30C084)
                                                    : Color(0xFFD3FADE),
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(10.0),
                                                  bottomRight: Radius.circular(10.0),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '≥',
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    color: _selectedHumidityOption == HumidityOption.GREATER_THAN
                                                        ? Colors.white
                                                        : Color(0xFF62dba3),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]
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
