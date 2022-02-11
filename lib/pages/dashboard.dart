import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mr_mangowalla_woocommerce/pages/cards.dart';
import 'package:mr_mangowalla_woocommerce/pages/productDescription.dart';
import 'package:mr_mangowalla_woocommerce/pages/productModel.dart';
import 'package:mr_mangowalla_woocommerce/pages/stock.dart';
import 'package:mr_mangowalla_woocommerce/pages/checkoutCart.dart';
import 'package:mr_mangowalla_woocommerce/pages/categoryMango.dart';
import 'package:mr_mangowalla_woocommerce/pages/categoryModel.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<ProductModel> cart =[];

@override


  Widget build(BuildContext context) {
    return Scaffold(

      //app bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          '  Mr. Mangowalla',
          style: TextStyle(
            fontFamily: 'Roboto-Black',
            letterSpacing: 1.5,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.grey[900],
          ),
        ),
        actions: [
          Image.asset(
            'assets/mangoFace.JPG',
          ),
          SizedBox(
            width: 30,
          ),
        ],
        elevation: 5,
      ),

      //body
      body: Container(
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),

                //slider section
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/mangoBanar.JPG',
                        width: 140,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '50 %',
                            style: TextStyle(
                              fontSize: 35,
                              fontFamily: 'PopPOne',
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Discount',
                            style: TextStyle(
                                fontSize: 28,
                                fontFamily: 'Roboto-Regular',
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFF09439)),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Online Payment',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Roboto-Regular',
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            '*Term and Condition apply',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Roboto-Regular',
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),

                //category section
                Text(
                  'Category',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontFamily: 'Roboto-Regular'),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 148,
                  child: CategoryMango(),
                ),
                SizedBox(
                  height: 5,
                ),

                //stock section
                Text(
                  'Stock',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontFamily: 'Roboto-Regular'),
                ),
                SizedBox(
                  height: 5,
                ),
                // Container(
                //   height: 250,
                //   child: ListView(
                //     scrollDirection: Axis.vertical,
                //     children: [
                //       stockCard('assets/fojliMango.JPG', 'Fojli', '120'),
                //       SizedBox(
                //         height: 15,
                //       ),
                //       stockCard('assets/fojliMango.JPG', 'Gopal Vog', '120'),
                //       SizedBox(
                //         height: 15,
                //       ),
                //       stockCard('assets/fojliMango.JPG', 'Amrupali', '120'),
                //       SizedBox(
                //         height: 15,
                //       ),
                //       stockCard('assets/fojliMango.JPG', 'Alsina', '120'),
                //       SizedBox(
                //         height: 15,
                //       ),
                //       stockCard('assets/fojliMango.JPG', 'Nangra', '120'),
                //       SizedBox(
                //         height: 15,
                //       ),
                //       stockCard('assets/fojliMango.JPG', 'Himsagor', '120'),
                //       SizedBox(
                //         height: 15,
                //       ),
                //     ],
                //   ),
                // ),
                Container(
                  height: MediaQuery.of(context).size.height*0.30,
                  child: Stock((selectedProdect){
                    setState(() {
                      cart.add(selectedProdect);
                    });
                  }),
                //   // child: StockList((selectedProdect) {
                //   //   setState(() {
                //   //     cart.add(selectedProdect);
                //   //     sum = 0;
                //   //     cart.forEach((item) {
                //   //       int price = item.productPrice.toInt();
                //   //       sum = sum + price;
                //   //     });
                //   //   });
                //   // }),
                ),
              ],
            ),
          ),
        ),
      ),

      //floatingActionButton section
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                 builder: (_) => Checkout(cart),
                ));
          },
          backgroundColor: Color(0xFFF09439),
          label: Row(
            children: [
              Text(
                'My Cart ',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Roboto-Regular',
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              )
            ],
          )),
    );
  }
}




// class Dashboard extends StatefulWidget {
//   Dashboard({Key? key}) : super(key: key);

//   @override
//   _DashboardState createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//       // String imgpat = 'http://taj3.xyz/flutter_api/';
//     // Future<List<productDescription>>
//      getProduct() async {

//         List<ProductModel> demo = [];
  
//       var res = await http.get(Uri.parse('http://taj3.xyz/flutter_api/api.php?type=all_product'));
//       //  var res = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

//       var jsonProduct = json.decode(res.body);
//       print("Data form server : $jsonProduct");

 
// ProductModel itemData;
//       for (var item in jsonProduct) {
//         ProductModel itemData = ProductModel(
//           name: item["name"],
//           price: item["price"],
//           origin: item["origin"],
//           img: item["img"],
//           category: item["category"],
//         );
//         demo.add(itemData);
//       };
    


//   //here it work on checkout file


// @override
// // void initState() {
// //   super.initState();
// //   getProduct();
// // }


//   Widget build(BuildContext context) {
//     return 
//   }}
// }



