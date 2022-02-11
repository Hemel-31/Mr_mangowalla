import 'package:flutter/material.dart';
import 'package:mr_mangowalla_woocommerce/pages/productDescription.dart';

//creating category card ***
late var category_mango_name;
late var category_mango_image_location;
// category_button_presses

Widget categoryCard(category_mango_name, category_mango_image_location,) =>
    Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        width: 120,
        height: 138,
        // color: Colors.grey,
        child:Column(
            children: [
              Image.asset(
                  category_mango_image_location //'assets/categoryDemo.JPG',
                  ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  category_mango_name,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto-Regular',
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        );

//creating stock card ***   Not  on use for some problem
late var stock_mango_name;
late var stock_mango_price;
late var stock_mango_image_location;

Widget stockCard(
        stock_mango_image_location, stock_mango_name, stock_mango_price) =>
    Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      // width: 180,
      height: 140,
      // color: Colors.grey,
      child: Row(
        children: [
          Image.asset(
            stock_mango_image_location, //'assets/fojliMango.JPG'
            height: 120,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stock_mango_name,
                style: TextStyle(
                  fontSize: 23,
                  fontFamily: 'Roboto-Regular',
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'From Chapai Nawabganj',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Roboto-Regular',
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 8,
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
                    '\$$stock_mango_price ',
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
    );

    class Card_File extends StatefulWidget {
      Card_File({Key? key}) : super(key: key);
    
      @override
      _Card_FileState createState() => _Card_FileState();
    }
    
    class _Card_FileState extends State<Card_File> {
      @override
      Widget build(BuildContext context) {
        return Container();
      }
    }



