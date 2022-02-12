import 'package:flutter/material.dart';
import 'package:mr_mangowalla_woocommerce/pages/dashboard.dart';

class productDescription extends StatefulWidget {
  productDescription({Key? key}) : super(key: key);

  @override
  _productDescriptionState createState() => _productDescriptionState();
}

class _productDescriptionState extends State<productDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xFFF09439),
        ),
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
            width: 15,
          ),
        ],
        elevation: 5,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                        image: AssetImage('assets/descriptionMango.JPG'),
                        fit: BoxFit.fill),
                    border: Border.all(
                        width: 1, color: Color.fromARGB(255, 22, 14, 14))),
              ),
              Positioned(
                  top: 15,
                  right: 15,
                  child: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  )),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.42,
                left: 4,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Fozli',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Roboto-Regular',
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[900]),
                          ),
                          Text(
                            'Price',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Roboto-Regular',
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[900]),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'From Chapai Nawabganj',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Roboto-Regular',
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700]),
                              ),
                              Text(
                                'Grade-A',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Roboto-Regular',
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700]),
                              ),
                            ],
                          ),
                          Text(
                            '\$ 120',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Roboto-Regular',
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFF09439),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release ding versions of Lorem Ipsum.',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Roboto-Regular',
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900]),
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: FlatButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Dashboard()));
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.80,
            height: 40,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(width: 1, color: Colors.white70),
              color: Color(0xFFF09439),
            ),
            child: Center(
              child: Text(
                'Show Now',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )),
    );
  }
}
