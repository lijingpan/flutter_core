import 'package:flutter/material.dart';

class ShortDriving extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            iconSize: 40,
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Color(0xff8d8d8d),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "短租自驾",
          style: TextStyle(
            color: Color(0xff181818),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 535.0,
          child: Stack(
            children: <Widget>[
              Container(
                child: Image.asset("images/short_rent_bg.png"),
              ),
              Positioned(
                left: 10.0,
                top: 170.0,
                right: 10.0,
                child: Material(
                  borderRadius: BorderRadius.circular(5.0),
                  elevation: 5.0,
                  child: Container(
                    
                    alignment: Alignment.topLeft,
                    
                    width: MediaQuery.of(context).size.width,
                    height: 350.0,
                    child: ShortCar(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//取还车信息
class ShortCar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TakeCar(), //取车信息
          ReturnCar(), //还车信息
          TakeDate(), //取还车时间
          InkWell(
              onTap: () {
                //print("1111");
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40.0,
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
                decoration: new BoxDecoration(
                    color: Color(0xffc7000b),
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(10.0)),
                    border: Border.all(
                        width: 1.5,
                        color: Color(0xffc7000b),
                        style: BorderStyle.solid)),
                child: Text(
                  "立即选车",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

//取车信息
class TakeCar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(10.0),
          child: Text(
            "取还车信息",
            style: TextStyle(
              color: Color(0xff262627),
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "取车地点",
                  style: TextStyle(
                    color: Color(0xff8d8d8d),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Text("送车上门",
                  style: TextStyle(
                    color: Color(0xff8d8d8d),
                  )),
            ),
          ],
        ),
        Container(
          decoration: new BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color: Color(0xffededed),
                    style: BorderStyle.solid)),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("上海",
                      style: TextStyle(
                        color: Color(0xff262627),
                        fontSize: 16.0,
                      ))),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Image.asset(
                  "images/rent_down.png",
                  width: 15.0,
                  height: 15.0,
                ),
              ),
              Expanded(
                child: Container(
                  child: Text("虹桥火车站接送点",
                      style: TextStyle(
                        color: Color(0xff262627),
                        fontSize: 16.0,
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Switch(value: false, onChanged: (bool val) {}),
              ),
            ],
          ),
        )
      ],
    );
  }
}

//还车信息
class ReturnCar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0, top: 5.0),
                child: Text("还车地点",
                    style: TextStyle(
                      color: Color(0xff8d8d8d),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0, top: 5.0),
              child: Text("上门取车",
                  style: TextStyle(
                    color: Color(0xff8d8d8d),
                  )),
            ),
          ],
        ),
        Container(
          decoration: new BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color: Color(0xffededed),
                    style: BorderStyle.solid)),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("上海",
                      style: TextStyle(
                        color: Color(0xff262627),
                        fontSize: 16.0,
                      ))),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Image.asset(
                  "images/rent_down.png",
                  width: 15.0,
                  height: 15.0,
                ),
              ),
              Expanded(
                child: Container(
                  child: Text("虹桥火车站接送点",
                      style: TextStyle(
                        color: Color(0xff262627),
                        fontSize: 16.0,
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Switch(value: false, onChanged: (bool val) {}),
              ),
            ],
          ),
        )
      ],
    );
  }
}

//取还车时间
class TakeDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.topLeft,
              height: 45.0,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text("取车时间",
                              style: TextStyle(
                                color: Color(0xff8d8d8d),
                              )),
                        ),
                        Expanded(
                            child: Text("周三",
                                style: TextStyle(
                                  color: Color(0xff8d8d8d),
                                )))
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 10.0, top: 5.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text("12-16",
                                style: TextStyle(
                                  color: Color(0xff262627),
                                  fontSize: 16.0,
                                )),
                          ),
                          Expanded(
                            child: Text("10:00",
                                style: TextStyle(
                                  color: Color(0xff262627),
                                  fontSize: 16.0,
                                )),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Container(
              width: 45.0,
              height: 45.0,
              padding: EdgeInsets.only(top: 5.0),
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(new Radius.circular(45.0)),
                  border: Border.all(
                      width: 1.5,
                      color: Color(0xffc7000b),
                      style: BorderStyle.solid)),
              child: Column(
                children: <Widget>[
                  Text("10"),
                  Text("天"),
                ],
              )),
          Expanded(
            flex: 2,
            child: Container(
              height: 45.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text("还车时间",
                              style: TextStyle(
                                color: Color(0xff8d8d8d),
                              )),
                        ),
                        Expanded(
                            child: Text("周三",
                                style: TextStyle(
                                  color: Color(0xff8d8d8d),
                                )))
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 10.0, top: 5.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text("12-16",
                                style: TextStyle(
                                  color: Color(0xff262627),
                                  fontSize: 16.0,
                                )),
                          ),
                          Expanded(
                            child: Text("10:00",
                                style: TextStyle(
                                  color: Color(0xff262627),
                                  fontSize: 16.0,
                                )),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
