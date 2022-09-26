import 'package:flutter/material.dart';

// My Own Imports
import 'package:ecommerce_flutter_ui/pages/category/top_offers.dart';

class WomensCollection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 500.0,
      child: Column(
        children: <Widget>[
          TopImageWomensFashion(),
          OfferGridWomensFashion(),
        ],
      ),
    );
  }
}

class TopImageWomensFashion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image(
          image: AssetImage('assets/top_design/womens_collection.jpg'),
        ),
        Positioned(
          top: 40.0,
          left: 20.0,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(0.0),
            width: 320.0,
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Women\'s Collection',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.2,
                      ),
                    ),
                    child: Text(
                      'View All',
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TopOffers(title: 'Women\'s Collection')),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class OfferGridWomensFashion extends StatelessWidget {
  final womenCollectionList = [
    {
      'image': 'assets/womens_collection/womens_collection_1.jpg',
      'title': 'Party Wear Kurtas',
      'offer': 'From ₹299'
    },
    {
      'image': 'assets/womens_collection/womens_collection_2.jpg',
      'title': 'Lingerie Set',
      'offer': 'Under ₹299'
    },
    {
      'image': 'assets/womens_collection/womens_collection_3.jpg',
      'title': 'Net Sarees',
      'offer': 'Min 60% Off'
    },
    {
      'image': 'assets/womens_collection/womens_collection_4.jpg',
      'title': 'Lingerie, Sleep & Swimwear',
      'offer': 'Under ₹399'
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    InkWell getStructuredGridCell(womensCollectionDeal) {
      final item = womensCollectionDeal;
      return InkWell(
        child: Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                color: Colors.grey,
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(6.0),
                height: 150.0,
                child: Image(
                  image: AssetImage(item['image']),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Text(
                      '${item['title']}',
                      style: TextStyle(fontSize: 12.0),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${item['offer']}',
                      style: TextStyle(
                          color: const Color(0xFF67A86B), fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TopOffers(title: '${item['title']}')),
          );
        },
      );
    }

    return Column(
      children: <Widget>[
        SizedBox(
          width: width,
          height: 479.0,
          child: Stack(
            children: <Widget>[
              Container(
                width: width,
                height: 460.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFE84958),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: EdgeInsets.only(top: 5.0, right: 5.0, left: 5.0),
                width: width - 20.0,
                margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
                child: GridView.count(
                  primary: false,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  crossAxisCount: 2,
                  childAspectRatio: ((width) / 500),
                  children: List.generate(womenCollectionList.length, (index) {
                    return getStructuredGridCell(womenCollectionList[index]);
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
