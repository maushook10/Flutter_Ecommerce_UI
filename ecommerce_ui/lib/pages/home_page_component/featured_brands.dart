import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// My Own Imports
import 'package:ecommerce_flutter_ui/pages/category/top_offers.dart';

class FeaturedBrandSlider extends StatelessWidget {
  final featuredBrandList = [
    {
      'title': 'Samsung',
      'image': 'assets/featured_brands/featured_brand_1.jpg'
    },
    {
      'title': 'Philips',
      'image': 'assets/featured_brands/featured_brand_2.jpg'
    },
    {'title': 'Intel', 'image': 'assets/featured_brands/featured_brand_3.jpg'}
  ];

  @override
  Widget build(BuildContext context) {
    InkWell getStructuredGridCell(featuredBrand) {
      final item = featuredBrand;
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TopOffers(title: '${item['title']}')),
          );
        },
        child: Image(
          image: AssetImage(item['image']),
        ),
      );
    }

    return Container(
      height: 305.0,
      padding: EdgeInsets.only(bottom: 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(12.0),
            alignment: Alignment.topLeft,
            child: Text(
              'Featured Brands',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          CarouselSlider(
            height: 250.0,
            enlargeCenterPage: true,
            items: List.generate(featuredBrandList.length, (index) {
              return getStructuredGridCell(featuredBrandList[index]);
            }),
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ],
      ),
    );
  }
}
