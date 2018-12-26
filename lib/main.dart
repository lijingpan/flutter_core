import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_core/home.dart';
import 'package:flutter_core/shortdriving.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(MaterialApp(
    title: '车速递租车',
    home:FistPage(),
  ));

  // if (Platform.isAndroid) {
  //   SystemUiOverlayStyle systemUiOverlayStyle =
  //       SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  // }
}

//主入口
class FistPage extends StatefulWidget {
  State<StatefulWidget> createState() => new FistPageState();
}

class FistPageState extends State<FistPage> {
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  var tabImages;
  var appBarTitles = ['首页', '客服', '门店', '我的'];
  List<Widget> pages = List<Widget>();

  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0);
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _currentIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    if (curIndex == _currentIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xffc7000b)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff8c8c8d)));
    }
  }

  @override
  void initState() {
    pages.add(HomeScreen());
    pages.add(HomeScreen());
    pages.add(HomeScreen());
    pages.add(HomeScreen());

    tabImages = [
      [
        getTabImage('images/home_page_normal.png'),
        getTabImage('images/home_page_selected.png')
      ],
      [
        getTabImage('images/service_normal.png'),
        getTabImage('images/service_selected.png')
      ],
      [
        getTabImage('images/shop_normal.png'),
        getTabImage('images/shop_selected.png')
      ],
      [
        getTabImage('images/my_normal.png'),
        getTabImage('images/my_selected.png')
      ]
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
          BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
          BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitle(2)),
          BottomNavigationBarItem(icon: getTabIcon(3), title: getTabTitle(3)),
        ],
        type: BottomNavigationBarType.fixed,
        iconSize: 24.0,
        currentIndex: _currentIndex,
        onTap: (int index) {
          if (index == 1) {
            showDialog<Null>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return new AlertDialog(
                  title: new Text(
                    '温馨提示：客服在线时间(08:00-20:00)',
                    style: TextStyle(color: Color(0xff363636), fontSize: 13.0),
                  ),
                  content: new SingleChildScrollView(
                    child: new ListBody(
                      children: <Widget>[new Text('呼叫电话:400-919-80000')],
                    ),
                  ),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text('确定'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        _launchURL();
                      },
                    ),
                    new FlatButton(
                      child: new Text('取消'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            ).then((val) {
              print("111");
            });
          }
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: pages[_currentIndex],
    );
  }
}

//客服电话
_launchURL() async {
  const url = 'tel:400919800';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}