import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// My Own Imports
import 'package:ecommerce_flutter_ui/Animation/slide_left_rout.dart';
import 'package:ecommerce_flutter_ui/pages/home.dart';
import 'package:ecommerce_flutter_ui/pages/order_payment/delivery_address.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int cartItem = 3;
  int cartTotal = 1797;

  final cartItemList = [
    {
      'title': 'Orange One Piece for Women',
      'image': 'assets/products/wedding_collection/wedding_collection_11.jpg',
      'price': 649,
      'size': 'L'
    },
    {
      'title': 'White One Piece for Women',
      'image': 'assets/products/wedding_collection/wedding_collection_10.jpg',
      'price': 299,
      'size': 'M'
    },
    {
      'title': 'Julee Crepe Embroidered Salwar Suit Material',
      'image': 'assets/products/wedding_collection/wedding_collection_8.jpg',
      'price': 849,
      'size': 'L'
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.7;
    double widthFull = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // No Item in Cart AlertDialog Start Here
    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text(
              "Alert",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text("No Item in Cart"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              TextButton(
                child: Text(
                  "Close",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    // No Item in Cart AlertDialog Ends Here

    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        titleSpacing: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      bottomNavigationBar: Material(
        elevation: 5.0,
        child: Container(
          color: Colors.white,
          width: widthFull,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: ((widthFull) / 2),
                height: 50.0,
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: 'Total: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' ₹$cartTotal',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  (cartTotal == 0)
                      ? _showDialog()
                      : Navigator.push(
                          context, SlideLeftRoute(page: Delivery()));
                },
                child: Container(
                  width: ((widthFull) / 2),
                  height: 50.0,
                  color: (cartTotal == 0)
                      ? Colors.grey
                      : Theme.of(context).primaryColor,
                  alignment: Alignment.center,
                  child: Text(
                    'Pay Now',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: (cartItem == 0)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.shoppingBasket,
                    color: Colors.grey,
                    size: 60.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'No Item in Cart',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextButton(
                    child: Text(
                      'Go To Home',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: cartItemList.length,
              itemBuilder: (context, index) {
                final item = cartItemList[index];
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  secondaryActions: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        top: 5.0,
                        bottom: 5.0,
                      ),
                      child: IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () {
                          setState(() {
                            cartItemList.removeAt(index);
                            cartItem--;
                            cartTotal = cartTotal - item['price'];
                          });

                          // Then show a snackbar.
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Item Removed")));
                        },
                      ),
                    ),
                  ],
                  child: Container(
                    height: (height / 5.0),
                    child: Card(
                        elevation: 3.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    width: 120.0,
                                    height: double.infinity,
                                    alignment: Alignment.center,
                                    child: Image(
                                      image: AssetImage(item['image']),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              width: (width - 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${item['title']}',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Price:',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        '₹${item['price']}',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(
                                          text: 'Size:  ',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: '  ${item['size']}',
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.blue)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      InkWell(
                                        child: Container(
                                          color: Colors.grey,
                                          padding: EdgeInsets.all(3.0),
                                          child: Text(
                                            'Remove',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            cartItemList.removeAt(index);
                                            cartItem--;
                                            cartTotal =
                                                cartTotal - item['price'];
                                          });

                                          // Then show a snackbar.
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content:
                                                      Text("Item Removed")));
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                );
              },
            ),
    );
  }
}
