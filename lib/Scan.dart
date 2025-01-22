import 'package:flutter/material.dart';
import 'main.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF8A8A8A),),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 36.0),
           Text('请将设备二维码放入框中'),
            SizedBox(height: 36.0),
            Image.asset(
              'image/scane box.png',
              width: 300.0,
            ),
          ],
        ),
      ),
    );
  }
}
