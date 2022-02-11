import 'package:flutter/material.dart';
import 'package:mr_mangowalla_woocommerce/pages/productModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Stock extends StatefulWidget {
  final ValueSetter<ProductModel> _valueSetter;

  Stock(this._valueSetter);
  @override
  _StockState createState() => _StockState();
}

List<ProductModel> demo = [];

class _StockState extends State<Stock> {
  String imgpat = 'http://taj3.xyz/flutter_api/images/';

  // Future<List<Products>>
  Future<List<ProductModel>> getProduct() async {
    Uri url = Uri.parse("http://taj3.xyz/flutter_api/api.php");
    var res = await http.post(url, body: {'type': 'all_product'});

    var jsonrespons = json.decode(res.body);
    print(" data from server stock");
    print(jsonrespons);

    try {
      for (var item in jsonrespons) {
        ProductModel data = ProductModel(
          name: item["name"],
          price: item["price"],
          origin: item["origin"],
          img: item["img"],
          category: item["category"],
        );
        demo.add(data);
      }
    } catch (e) {
      print(e);
    }
    return demo;
  }

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  Widget build(BuildContext context) {
    return data();
  }

  FutureBuilder<List<ProductModel>> data() => FutureBuilder(
      future: getProduct(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == '') {
          return Container(
            child: Center(
              child: Text("Data Not found"),
            ),
          );
        } else if (snapshot.data == null) {
          return Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Loading',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                )
              ],
            )),
          );
        } else {
          return Container(
            height: MediaQuery.of(context).size.height,
            // margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
            child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: .7,
                    child: ListTile(
                      leading: Container(
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    imgpat + snapshot.data[index].img))),
                      ),
                      title: Row(
                        children: [
                          SizedBox(
                            width: 3,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data[index].name,
                                style: TextStyle(
                                  fontSize: 21,
                                  fontFamily: 'Roboto-Regular',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data[index].origin,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Roboto-Regular',
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Per/KG:',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Roboto-Regular',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    ' \$',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Roboto-Regular',
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFF09439)),
                                  ),
                                  Text(
                                    snapshot.data[index].price,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Roboto-Regular',
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFF09439)),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      trailing: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.add_shopping_cart,
                            color: Color(0xFFF09439),
                            size: 35,
                          ),
                          Text(
                            'Cart',
                            style: TextStyle(
                                fontSize: 9,
                                fontFamily: 'Roboto-Regular',
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          )
                        ],
                      ),
                      onTap: () {
                        widget._valueSetter(demo[index]);
                      },
                    ),
                  );
                }),
          );
        }
      });
}
