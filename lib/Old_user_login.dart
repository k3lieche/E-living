import 'package:flutter/material.dart';
import 'main.dart';
import 'New_user_login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _obscureText = true;

  final textController = TextEditingController();
  String password = '123456';

  void _login() {
    if (textController.text == password) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('密码错误'),
            content: Text('请重新输入密码。'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('好的'),
              ),
            ],
          );
        },
      );
    }
  }

  void _handleForgetPassword(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('密码重置'),
          content: Text('重置密码链接已发送至您的电子邮件，请注意查收！'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('好的'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
       child: Stack(
         children: [
           Container(
             height: 264.0,
             width:  double.infinity,
             child:Image.asset(
               'image/sign_up_BG.png',
             ),
           ),
           Positioned(
             top: 235.0,
             left: MediaQuery.of(context).size.width / 2 - 30.0,
             child: ClipOval(
               child: Image.asset(
                 'image/e_living.png',
                 width: 60.0,
                 height: 60.0,
               ),
             ),
           ),
           Padding(
             padding: EdgeInsets.only(left: 42.0,right: 42.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: 300.0),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         SizedBox(height: 12.0),
                         Text('一会不见，欢迎回来！', style: TextStyle(fontSize: 18.0),),
                         SizedBox(height: 12.0),
                         Text('钟灵', style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),),
                       ],
                     ),
                     SizedBox(width: 63.0),
                     ClipOval(
                       child: Image.asset(
                         'image/Zhongling.png',
                         width: 72.0,
                         height: 72.0,
                       ),
                     ),
                   ],
                 ),
                 TextButton(
                   style: TextButton.styleFrom(
                     foregroundColor: Color(0xff30C084),
                   ),
                   onPressed: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) => LoginPage2()),
                     );
                   },
                   child: Text('切换账号'),
                 ),
                 TextField(
                   controller: textController,
                   obscureText: _obscureText,
                   decoration: InputDecoration(
                     labelText: '密码',
                     labelStyle: TextStyle(color: Colors.grey),
                     suffixIcon: IconButton(
                       onPressed: () {
                         setState(() {
                           _obscureText = !_obscureText;
                         });
                       },
                       icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility,
                         color: Colors.grey,),
                     ),
                     enabledBorder: UnderlineInputBorder(
                       borderSide: BorderSide(color: Color(0xff30C084)),
                     ),
                     focusedBorder: UnderlineInputBorder(
                       borderSide: BorderSide(color: Color(0xff30C084)),
                     ),
                   ),
                 ),
                 SizedBox(height: 3.0),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end, // 将主轴对齐方式设置为右对齐
                   children: [
                     Spacer(), // 占据剩余的空间
                     GestureDetector(
                       onTap: () => _handleForgetPassword(context), // 处理点击事件
                       child: Text(
                         '忘记密码',
                         style: TextStyle(color: Color(0xff30C084)),
                       ),
                     ),
                   ],
                 ),
                 SizedBox(height: 36.0),
                 Center(
                   child: Container(
                     width: 230,
                     height: 42,
                     decoration: BoxDecoration(
                       color: Color(0xff30C084),
                       borderRadius: BorderRadius.circular(21),
                       boxShadow: [
                         BoxShadow(
                           color: Color(0xff438262).withOpacity(0.3),
                           blurRadius: 5,
                           offset: Offset(0, 2),
                         ),
                       ],
                     ),
                     child: TextButton(
                       onPressed: _login,
                       child: Text(
                         '登录',
                         style: TextStyle(color: Colors.white,fontSize: 18.0),
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
    );
  }
}
