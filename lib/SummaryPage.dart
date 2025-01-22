import 'package:flutter/material.dart';

class SummaryPage extends StatefulWidget {
  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {

  String _selectedMonth = '5月';

  // 定义弹出菜单内容
  List<PopupMenuEntry<String>> _getMenuItems() {
    List<PopupMenuEntry<String>> items = [];
    for (int i = 1; i <= 5; i++) {
      String month = i.toString() + '月';
      items.add(PopupMenuItem<String>(
        value: month,
        child: Text(month),
      ));
    }
    return items;
  }

  List<int> _electricityTable = [222, 217, 215, 234, 230];

  List<double> calculateElectricityFee(List<int> table) {
    List<double> fees = [];
    for (int i = 0; i < table.length; i++) {
      double fee = table[i] * 0.428;
      fees.add(fee);
    }
    return fees;
  }

  @override
  Widget build(BuildContext context) {
    List<double> fees = calculateElectricityFee(_electricityTable.sublist(0, int.parse(_selectedMonth[0])));//截取字符串
    int i = fees.length - 1;

    return Scaffold(
      backgroundColor: Color(0xFF30C084),
      body: Column(
        children: [
          SizedBox(height: 32.0),
          Container(
            height: 42.0,
            width: double.infinity, // 背景颜色
            child: Align(
              alignment: Alignment.center,
              child: Text(
                '用电月报',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 36.0), // 左边距
                  child: Text(
                    '2023年' + _selectedMonth,
                    style: TextStyle(color: Colors.white,fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              PopupMenuButton<String>(
                icon: Icon(Icons.arrow_drop_down, color: Colors.white), // 向下箭头图标
                itemBuilder: (context) => _getMenuItems(),
                onSelected: (value) {
                  setState(() {
                    _selectedMonth = value; // 更新所选月份
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 6.0),
          Container(
            width: 350.0,
            height: 84.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                SizedBox(height: 12.0,),
                Row(
                  children: [
                    SizedBox(
                      width: 36.0,
                    ),
                    Text('本月电费（元）',
                      style: TextStyle(fontSize: 18.0, ),),
                    SizedBox(
                      width: 24.0,
                    ),
                    Text('本月用电（度）',
                      style: TextStyle(fontSize: 18.0, ),),
                  ],
                ),
                SizedBox(height: 6.0,),
                Row(
                  children: [
                    SizedBox(
                      width: 58.0,
                    ),
                    Text(fees.isNotEmpty ? fees[i].toStringAsFixed(2) : '',style: TextStyle(fontSize: 20.0, ),
                    ),
                    SizedBox(
                      width: 106.0,
                    ),
                    Text(_electricityTable[int.parse(_selectedMonth[0])-1].toString(),style: TextStyle(fontSize: 20.0, ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0),
          Image.asset(
            'image/chart${_selectedMonth[0]}.png', // 根据所选月份选择图标
            width: 350.0,
          ),
        ],
      ),
    );
  }
}
