import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ecommerce_flutter_ui/AppTheme/my_behaviour.dart';
import 'package:ecommerce_flutter_ui/pages/spashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcommerceUI',
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2874F0),
        primaryColorLight: const Color(0xFFFDE400),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white,
        ),
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(),
    );
  }
}
