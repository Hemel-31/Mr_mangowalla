import 'package:flutter/material.dart';
import 'categoryModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'productDescription.dart';
import 'cards.dart';

class CategoryMango extends StatefulWidget {
  CategoryMango({Key? key}) : super(key: key);

  @override
  _CategoryMangoState createState() => _CategoryMangoState();
}

List<CategoryModel> demo_category = [];

class _CategoryMangoState extends State<CategoryMango> {
  String imgpat = 'http://taj3.xyz/flutter_api/images/';
  Future<List<CategoryModel>> getCategory() async {
    Uri url = Uri.parse("http://taj3.xyz/flutter_api/api.php");
    var respons = await http
        .post(url, body: {'type': 'category_product', "category_id": "1"});

    var jsonrespons_c = json.decode(respons.body);
    print(" data from server category");
    print(jsonrespons_c);

    try {
      for (var item in jsonrespons_c) {
        CategoryModel data = CategoryModel(
          name: item["name"],
          price: item["price"],
          origin: item["origin"],
          img: item["img"],
          category: item["category"],
        );
        demo_category.add(data);
      }
    } catch (_error) {
      print('Category add Error $_error');
    }

    return demo_category;
  }

  @override
  void initState() {
    super.initState();
    getCategory();
  }

  Widget build(BuildContext context) {
    return data();
  }

  FutureBuilder<List<CategoryModel>> data() => FutureBuilder(
      future: getCategory(),
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
                        fontSize: 15,
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
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
            child: ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => productDescription()));
                    },
                    child: Card(
                      elevation: .7,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            width: 120,
                            height: 120,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  top: 2,
                                  child: Image.network(
                                    imgpat + snapshot.data[index].img,
                                    height: 80, //'assets/categoryDemo.JPG',
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        snapshot.data[index].name,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Roboto-Regular',
                                          letterSpacing: 1.5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
        }
      });
}


// TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (_) => productDescription()));
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(width: 1, color: Colors.grey),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(8)),
//                             ),
//                             width: 120,
//                             height: 138,
//                             child: Column(
//                               children: [
//                                 Image.network(
//                                     imgpat + snapshot.data[index].img //'assets/categoryDemo.JPG',
//                                     ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Text(
//                                     snapshot.data[index].name,
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       fontFamily: 'Roboto-Regular',
//                                       letterSpacing: 1.5,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
