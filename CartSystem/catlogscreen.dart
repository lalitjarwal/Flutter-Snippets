import 'package:dartlang/cart/cartModel.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Dart Lang';
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        title: title,
        home: CartDemo());
  }
}
final cart = Cart();
class CartDemo extends StatefulWidget {
  @override
  _CartDemoState createState() => _CartDemoState();
}
class _CartDemoState extends State<CartDemo> {
  final list = [
    Product('poco', 10000, false),
    Product('vivo', 7000, false),
    Product('xiaomi', 8000, false),
    Product('sony', 20000, false),
    Product('lava', 4000, false),
    Product('apple', 40000, false),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                    title: Text('${list[index].name}'),
                    subtitle: Text('${list[index].price}'),
                    value: list[index].added,
                    onChanged: (val) {
                      setState(() {
                        list[index].checked = val;
                        if (list[index].added == true && list[index] != null) {
                          cart.addItem(list[index]);
                        } else {
                          cart.removeItem(list[index]);
                        }
                      });
                    });
              },
            ),
            RaisedButton(
                child: Text('Cart'),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => MyCart()));
                }),
          ],
        ),
      ),
    );
  }
}

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  final list = cart.items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(list[index].name),
                subtitle: Text('${list[index].price}'),
              );
            },
          ),
          Text(
            'Total is Rs. ${cart.totalPrice}',
            textScaleFactor: 2,
          )
        ],
      ),
    );
  }
}
