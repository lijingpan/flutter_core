import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:io';
import 'package:flutter/services.dart';

//测试
void main() {
  runApp(MaterialApp(
    title: '测试demo',
    home: FistPage(),
  ));

  if (Platform.isAndroid) {
// 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

// class demoPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('demoPage'),
//       ),
//       body: new GridView.count(
//         primary: false,
//         padding: const EdgeInsets.all(0.0),
//         crossAxisSpacing: 0.0,
//         crossAxisCount: 2,
//         children: <Widget>[
//           const Text('He\'d have you all unravel at the'),
//           const Text('Heed not the rabble'),
//           const Text('Sound of screams but the'),
//           const Text('Who scream'),
//           const Text('Revolution is coming...'),
//           const Text('Revolution, they...'),
//         ],
//       ),
//     );
//   }
// }

class FistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TBanner(),
            Home_Nav(),
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
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: Text(
                "推荐活动",
                style: new TextStyle(
                  fontSize: 18.0, //字体大小
                  fontWeight: FontWeight.bold, //字体粗细  粗体和正常
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TBanner extends StatelessWidget {
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
              opacity: 0.5,
              child: new Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: new EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
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

class Home_Nav extends StatelessWidget {
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
            //图片
            PhotoScroller()
          ],
        ),
      ),
    );
  }
}

class PhotoScroller extends StatelessWidget {
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
                        Text("本田CRV"),
                        Text("￥75"),
                        Text("/日"),
                      ],
                    ),
                    Text("自排/3厢/5座"),
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

// class RouteButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return RaisedButton(
//       onPressed: (){
//       Navigator.push(context,
//         MaterialPageRoute(builder: (context)=>Xiaojiejie())
//         );
//       },
//       child: Text('去找小姐姐'),
//     );
//   }
// _navigateToxiaoJie(BuildContext context) async{

//   final result= await Navigator.push(context,
//    MaterialPageRoute(builder: (context)=>Xiaojiejie())
//   );
//   Scaffold.of(context).showSnackBar(SnackBar(content:Text('$result')));
//  }
// }

// class Xiaojiejie extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(title: Text('我是小姐姐'),),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             RaisedButton(
//               child: Text('大长腿小姐姐'),
//               onPressed: (){
//                 Navigator.pop(context,'大长腿小姐姐：1212121212');
//               },
//             ),
//             RaisedButton(
//               child: Text('大长腿小姐姐2'),
//               onPressed: (){
//                 Navigator.pop(context,'大长腿小姐姐2：1212121212');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Product{
//   final String title;
//   final String description;
//   Product(this.title,this.description);
// }

// void main(){
//   runApp(MaterialApp(
//     title: '导航数据',
//      home: ProductList(
//        products:List.generate(20, (i)=>Product('商品 $i','这是一个商品描述，编号为：$i'))
//      ),
//   ));
// }

// class ProductList extends StatelessWidget {
//   final List<Product> products;
//   ProductList({Key key,@required this.products}):super(key:key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('商品列表'),),
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context,index){
//           return ListTile(
//             title: Text(products[index].title),
//             onTap:(){
//               Navigator.push(context,MaterialPageRoute(
//                 builder: (context)=>ProdeuctDetail(product:products[index]),
//               ));
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class ProdeuctDetail extends StatelessWidget {

// final Product product;
// ProdeuctDetail({Key key,@required this.product}):super(key:key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('${product.title}'),),
//       body: Center(child: Text('${product.description}'),),
//     );
//   }
// }
