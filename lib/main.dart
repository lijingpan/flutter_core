import 'package:flutter/material.dart';
import 'package:flutter_core/WeatherWidget.dart';

//测试
void main() {
  runApp(MaterialApp(
    title: '测试demo',
    home: WeatherWidget(),
  ));
}

// class FirstPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('找小姐姐要电话'),),
//       body: Center(
//         child: RouteButton(),
//       ),
//     );
//   }
// }

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
