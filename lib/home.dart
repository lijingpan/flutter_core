import 'package:flutter/material.dart';
import 'package:flutter_core/shortdriving.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:flutter/services.dart';

//首页
int _lastClickTime = 0;

class HomeScreen extends StatelessWidget {
  Future<bool> doubleClickBack() {
    int nowTime = DateTime.now().microsecondsSinceEpoch;
    print(nowTime);
    print(nowTime - _lastClickTime);
    if (_lastClickTime != 0 && nowTime - _lastClickTime > 1500) {
      print('1111');
      //return new Future.value(false);
      return new Future.value(true);
    } else {
      _lastClickTime = new DateTime.now().microsecondsSinceEpoch;
      new Future.delayed(const Duration(milliseconds: 1500), () {
        _lastClickTime = 0;
      });
      Fluttertoast.showToast(
          msg: "车速递租车：双击退出车速递租车",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Color.fromRGBO(0, 0, 0, 0.8),
          textColor: Colors.white);
      return new Future.value(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: doubleClickBack,
        child: Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(0.0),
            child: Column(
              children: <Widget>[
                home_banner(),
                home_nav(),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  child: Text(
                    "推荐车型",
                    style: new TextStyle(
                      fontSize: 18.0, //字体大小
                      fontWeight: FontWeight.bold, //字体粗细  粗体和正常
                    ),
                  ),
                ),
                RecomendCarWidget(),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                  child: Text(
                    "推荐活动",
                    style: new TextStyle(
                      fontSize: 18.0, //字体大小
                      fontWeight: FontWeight.bold, //字体粗细  粗体和正常
                    ),
                  ),
                ),
                hot_activity(),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                  child: Text(
                    "用户评价",
                    style: new TextStyle(
                      fontSize: 18.0, //字体大小
                      fontWeight: FontWeight.bold, //字体粗细  粗体和正常
                    ),
                  ),
                ),
                evaluate(),
              ],
            ),
          ),
        ));
  }
}

class home_banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          new Container(
              width: MediaQuery.of(context).size.width,
              height: 220.0,
              child: Swiper(
                itemBuilder: _swiperBuilder,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                autoplay: true,
                onTap: (index) => print('点击了第$index个'),
              )),
          new Positioned(
            left: 15.0,
            top: 25.0,
            child: new Opacity(
              opacity: 0.3,
              child: new Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: new EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 0.0),
                      child: new Text(
                        "上海",
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    new Image.asset(
                      "images/down.png",
                      width: 15,
                      height: 15,
                    )
                  ],
                ),
                width: 70.0,
                height: 30.0,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(18.0)),
                  color: Colors.black, //Color.fromRGBO(0, 0, 0, .5),
                ),
              ),
            ),
          ),
          new Positioned(
            left: 20.0,
            top: 200.0,
            right: 20,
            child: Material(
              borderRadius: BorderRadius.circular(4.0),
              elevation: 2.0,
              child: Container(
                height: 100.0,
                padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new ShortDriving()));
                        },
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "images/rentshortdrive.png",
                              height: 60.0,
                              width: 60.0,
                            ),
                            Text("短租自驾", textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "images/companiestorent.png",
                            height: 60.0,
                            width: 60.0,
                          ),
                          Text("企业长租"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      height: 310.0,
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    if (index == 0) {
      return (Image.network(
        "https://web-api.chesudi.com/img/ActivityBanner/a02bd350a318e7d037aa4bbbe0ea26.jpg",
        fit: BoxFit.fill,
      ));
    } else {
      return (Image.network(
        "https://web-api.chesudi.com/img/ActivityBanner/4e4017f6ee2ce1a9290262174f719b.jpg",
        fit: BoxFit.fill,
      ));
    }
  }
}

class home_nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
              child: Stack(
                alignment: const FractionalOffset(0, 0.5),
                children: <Widget>[
                  Image.asset("images/index01.png"),
                  Center(
                    child: Text(
                      "网约车",
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
              child: Stack(
                alignment: const FractionalOffset(0, 0.5),
                children: <Widget>[
                  Image.asset("images/index02.png"),
                  Center(
                    child: Text(
                      "个人长租",
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
              child: Stack(
                alignment: const FractionalOffset(0, 0.5),
                children: <Widget>[
                  Image.asset("images/index03.png"),
                  Center(
                    child: Text(
                      "优惠活动",
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//推荐车型
class RecomendCarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _RecomendCarWidgetState();
}

class _RecomendCarWidgetState extends State {
  int color_nuber_1 = 0xffff0000;
  int color_nuber_2 = 0xff000000;
  int color_nuber_3 = 0xff000000;
  _toggle_color(type) {
    setState(() {
      if (type == 1) {
        color_nuber_1 = 0xffff0000;
        color_nuber_2 = 0xff000000;
        color_nuber_3 = 0xff000000;
      } else if (type == 2) {
        color_nuber_1 = 0xff000000;
        color_nuber_2 = 0xffff0000;
        color_nuber_3 = 0xff000000;
      } else {
        color_nuber_1 = 0xff000000;
        color_nuber_2 = 0xff000000;
        color_nuber_3 = 0xffff0000;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: new BoxDecoration(
                border: Border(
                  left: BorderSide(
                      width: 4.0, color: Colors.red, style: BorderStyle.solid),
                ),
              ),
              child: Row(
                children: <Widget>[
                  new GestureDetector(
                    onTap: () {
                      _toggle_color(1);
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      child: Text(
                        "短租",
                        style: new TextStyle(
                          fontSize: 16.0, //字体大小
                          color: Color(color_nuber_1),
                        ),
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: () {
                      _toggle_color(2);
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                      child: Text(
                        "长租",
                        style: new TextStyle(
                          fontSize: 16.0, //字体大小
                          color: Color(color_nuber_2),
                        ),
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: () {
                      _toggle_color(3);
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                      child: Text(
                        "网约车",
                        style: new TextStyle(
                          fontSize: 16.0, //字体大小
                          color: Color(color_nuber_3),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //车型图片
            carScroller()
          ],
        ),
      ),
    );
  }
}

//推荐车型
class carScroller extends StatelessWidget {
  List<String> photoUrls = [
    'https://w.chesudi.com/static/img/DZ%20CRV@2x.490a1f8.png',
    'https://w.chesudi.com/static/img/DZ xuanyi@2x.892229f.png',
    'https://w.chesudi.com/static/img/DZ%20CRV@2x.490a1f8.png',
    'https://w.chesudi.com/static/img/DZ%20CRV@2x.490a1f8.png',
  ];
  Widget _buildPhoto(BuildContext context, int index) {
    var photo = photoUrls[index];
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Stack(
          children: <Widget>[
            Container(
              width: 260.0,
              decoration: new BoxDecoration(
                  color: Color(0xfff0f0f0),
                  borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                  border: Border.all(
                      width: 1.0,
                      color: Color(0xff999999),
                      style: BorderStyle.solid)),
              child: Column(
                children: <Widget>[
                  Image.network(
                    photo,
                    width: 190.0,
                    height: 120.0,
                  ),
                  Wrap(
                    children: <Widget>[
                      Text(
                        "本田CRV",
                        style: TextStyle(
                          color: Color(0xff262627),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "￥75",
                        style: TextStyle(
                          color: Color(0xffc7000b),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "/日",
                        style: TextStyle(
                          color: Color(0xff262627),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "自排/3厢/5座",
                    style: TextStyle(
                      color: Color(0xff8d8d8d),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 10.0,
              top: 0.0,
              child: Container(
                width: 30.0,
                decoration: new BoxDecoration(
                  color: Color(0xffc7000b),
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      "热",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text("门", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox.fromSize(
          size: const Size.fromHeight(180.0),
          child: ListView.builder(
            itemCount: photoUrls.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 8.0, left: 20.0),
            itemBuilder: _buildPhoto,
          ),
        ),
      ],
    );
  }
}

//推荐活动
class hot_activity extends StatelessWidget {
  List<String> photoUrls = [
    'https://web-api.chesudi.com//img/ActivityBanner/37509056e8c48e4e4b6c0af0e1b224.jpg',
    'https://web-api.chesudi.com//img/ActivityBanner/d75ae05508e91246048bfd934d5c244.jpg',
    'https://web-api.chesudi.com//img/ActivityBanner/37509056e8c48e4e4b6c0af0e1b224.jpg',
    'https://web-api.chesudi.com//img/ActivityBanner/37509056e8c48e4e4b6c0af0e1b224.jpg',
  ];
  Widget _buildPhoto(BuildContext context, int index) {
    var photo = photoUrls[index];
    return Container(
      padding: const EdgeInsets.only(right: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Image.network(
          photo,
          width: 303.0,
          height: 170.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
          decoration: new BoxDecoration(
            border: Border(
              left: BorderSide(
                  width: 4.0, color: Colors.red, style: BorderStyle.solid),
            ),
          ),
          child: Text("值得推荐的优惠活动"),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(170.0),
          child: ListView.builder(
            itemCount: photoUrls.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 8.0, left: 20.0),
            itemBuilder: _buildPhoto,
          ),
        ),
      ],
    );
  }
}

//用户评价
class evaluate extends StatelessWidget {
  List<String> photoUrls = [
    'https://web-api.chesudi.com/img/carTypeimage/ScarTypeimage/起亚K5.png',
    'https://web-api.chesudi.com/img/carTypeimage/ScarTypeimage/别克凯越.png',
    'https://web-api.chesudi.com/img/carTypeimage/ScarTypeimage/起亚K5.png',
    'https://web-api.chesudi.com/img/carTypeimage/ScarTypeimage/别克GL8.png',
  ];
  Widget _swiperBuilder(BuildContext context, int index) {
    var photo = photoUrls[index];
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 30.0),
      decoration: new BoxDecoration(
          color: Color(0xfff0f0f0),
          borderRadius: new BorderRadius.all(new Radius.circular(3.0)),
          border: Border.all(
              width: 1.0, color: Color(0xff999999), style: BorderStyle.solid)),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: const FractionalOffset(0, 0.5),
            children: <Widget>[
              Image.asset(
                "images/evaluate.png",
              ),
              Center(
                  child: Image.network(
                photo,
                width: 186.0,
                height: 124.0,
              ))
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 0.0),
            height: 55.0,
            child: Text(
              "老板人很好老板人很好老板 老板人很好老板人很好老板 老板人很好老板人很好老板 老板人很好老板人很好老板 老板人很好老板人很好老板",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                  child: Text("2018/10/10 14:23:03"),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                child: Text("戴先生"),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: MediaQuery.of(context).size.width,
        height: 280.0,
        child: Swiper(
          itemBuilder: _swiperBuilder,
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          autoplay: true,
          onTap: (index) => print('点击了第$index个'),
        ));
  }
}
