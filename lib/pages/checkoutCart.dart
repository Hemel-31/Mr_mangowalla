import 'package:flutter/material.dart';
import 'package:mr_mangowalla_woocommerce/pages/dashboard.dart';

class Checkout extends StatefulWidget {
  final cart;

  Checkout(this.cart);

  @override
  State<Checkout> createState() => _CheckoutState();
}

dynamic sum =0;
class _CheckoutState extends State<Checkout> {

  @override
  Widget build(BuildContext context) {
    print(widget.cart);


    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            '  My Cart',
            style: TextStyle(
              fontFamily: 'Roboto-Black',
              letterSpacing: 1.5,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF09439),
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
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              ListView.separated(
                itemBuilder: (context, index) {
                  dynamic price = widget.cart[index].price;
                  // sum = sum + int.parse(price);
                  return ListTile(
                    title: Text(
                      widget.cart[index].name,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto-Regular',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      "\$ $price",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto-Regular',
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFF09439)),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: widget.cart.length,
                // shrinkWrap: true,
              ),
              Positioned(
                bottom: 50,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                  child: ListTile(
                    title: Text(
                      'Total:',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto-Regular',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      "\$ $sum",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto-Regular',
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFF09439)),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFFF09439),
                  child: ListTile(
                    title: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.38,
                              0,
                              0,
                              0),
                        ),
                        Text(
                          'Pay Now ',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Roboto-Regular',
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.payment,
                          color: Colors.white,
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Dashboard()));
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
