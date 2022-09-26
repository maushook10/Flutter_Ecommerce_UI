import 'package:flutter/material.dart';
import 'package:ecommerce_flutter_ui/pages/login.dart';

class AccountSetting extends StatefulWidget {
  @override
  _AccountSettingState createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  @override
  Widget build(BuildContext context) {
    ListTile getListTile(title) {

      // Widget for common ListTile
      return ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.grey, fontSize: 18.0),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey,
        ),
        onTap: () {},
      );
    }

    // Widget for common divider
    Padding getDivider() {
      return Padding(
        padding: EdgeInsets.only(left: 12.0),
        child: Divider(
          height: 1.0,
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F6),
      appBar: AppBar(
        title: Text('Account Setting'),
        titleSpacing: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 5.0),
            color: Colors.white,
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Account',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                getListTile('Address'),
                getDivider(),
                getListTile('Telephone'),
                getDivider(),
                getListTile('Email'),
                getDivider(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            color: Colors.white,
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Setting',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                getListTile('Order Notifications'),
                getDivider(),
                getListTile('Discount Notifications'),
                getDivider(),
                getListTile('Credit Card'),
                getDivider(),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: Container(
              margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
              color: Colors.white,
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
