import 'dart:io';

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:badges/badges.dart';
import 'package:fluttertoast/fluttertoast.dart';

// My Own Import
import 'package:ecommerce_flutter_ui/pages/home_page_component/drawer.dart';
import 'package:ecommerce_flutter_ui/pages/home_page_component/category_grid.dart';
import 'package:ecommerce_flutter_ui/pages/home_page_component/best_offer_grid.dart';
import 'package:ecommerce_flutter_ui/pages/home_page_component/top_seller_grid.dart';
import 'package:ecommerce_flutter_ui/pages/home_page_component/best_deal.dart';
import 'package:ecommerce_flutter_ui/pages/home_page_component/featured_brands.dart';
import 'package:ecommerce_flutter_ui/pages/home_page_component/block_buster_deal.dart';
import 'package:ecommerce_flutter_ui/pages/home_page_component/best_of_fashion.dart';
import 'package:ecommerce_flutter_ui/pages/home_page_component/womens_collection.dart';
import 'package:ecommerce_flutter_ui/pages/notifications.dart';
import 'package:ecommerce_flutter_ui/pages/category/top_offers.dart';
import 'package:ecommerce_flutter_ui/Animation/slide_left_rout.dart';
import 'package:ecommerce_flutter_ui/pages/cart.dart';
import 'package:ecommerce_flutter_ui/pages/search.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F6),
      appBar: AppBar(
        title: Text(
          'GoKart',
          style: TextStyle(
            fontFamily: 'Pacifico',
          ),
        ),
        titleSpacing: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()));
            },
          ),
          IconButton(
            icon: Badge(
              badgeContent: Text('2'),
              badgeColor: Theme.of(context).primaryColorLight,
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notifications()),
              );
            },
          ),
          IconButton(
            icon: Badge(
              badgeContent: Text('3'),
              badgeColor: Theme.of(context).primaryColorLight,
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.push(context, SlideLeftRoute(page: CartPage()));
            },
          ),
        ],
      ),

      // Drawer Code Start Here

      drawer: MainDrawer(),

      // Drawer Code End Here
      body: WillPopScope(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            // Slider Code Start Here
            Container(
              child: SizedBox(
                height: 170.0,
                child: Carousel(
                  images: [
                    AssetImage('assets/slider/s1.jpg'),
                    AssetImage('assets/slider/s2.jpg'),
                    AssetImage('assets/slider/s3.jpg'),
                    AssetImage('assets/slider/s4.jpg'),
                    AssetImage('assets/slider/s5.jpg')
                  ],
                  dotSize: 4.0,
                  dotSpacing: 15.0,
                  dotColor: Colors.lightGreenAccent,
                  indicatorBgPadding: 5.0,
                  dotBgColor: Colors.purple.withOpacity(0.0),
                  boxFit: BoxFit.fill,
                  animationCurve: Curves.fastOutSlowIn,
                ),
              ),
            ),

            // Slider Code End Here

            SizedBox(
              height: 5.0,
            ),

            // Category Grid Start Here
            CategoryGrid(),

            // Category Grid End Here

            SizedBox(
              height: 5.0,
            ),

            Divider(
              height: 1.0,
            ),

            SizedBox(
              height: 4.0,
            ),

            // Promotion 1 Start Here
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TopOffers(title: 'Top Selling Android Mobile')),
                );
              },
              child: Image(
                image: AssetImage('assets/promotion/promotion1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            // Promotion 1 End Here

            SizedBox(
              height: 5.0,
            ),

            Divider(
              height: 1.0,
            ),

            SizedBox(
              height: 2.0,
            ),

            // Best Offer Grid Start Here

            BestOfferGrid(),

            // Best Offer Grid End Here
            SizedBox(
              height: 4.0,
            ),

            Divider(
              height: 1.0,
            ),

            SizedBox(
              height: 4.2,
            ),

            // Top Seller Grid Start Here
            TopSeller(),
            // Top Seller Grid End Here

            SizedBox(
              height: 3.8,
            ),

            Divider(
              height: 1.0,
            ),

            SizedBox(
              height: 4.0,
            ),

            // Best Deal Grid Start Here
            BestDealGrid(),
            // Best Deal Grid End Here

            SizedBox(
              height: 3.8,
            ),

            Divider(
              height: 1.0,
            ),

            SizedBox(
              height: 8.0,
            ),

            // Featured Brand Slider Start Here
            FeaturedBrandSlider(),
            // Featured Brand Slider End Here

            SizedBox(
              height: 6.0,
            ),

            Divider(
              height: 1.0,
            ),

            SizedBox(
              height: 6.0,
            ),

            // Block Buster Deals Start Here
            BlockBusterDeals(),
            // Block Buster Deals End Here

            SizedBox(
              height: 6.0,
            ),

            Divider(
              height: 1.0,
            ),

            SizedBox(
              height: 0.0,
            ),

            //Best of Fashion Start Here
            BestOfFashion(),
            //Best of Fashion End Here

            SizedBox(
              height: 6.0,
            ),

            Divider(
              height: 1.0,
            ),

            SizedBox(
              height: 0.0,
            ),

            // Womens Collection Start Here
            WomensCollection(),
            // Womens Collection End Here

            SizedBox(height: 20.0),
          ],
        ),
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return false;
    } else {
      return true;
    }
  }
}
