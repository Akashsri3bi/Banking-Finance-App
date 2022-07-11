import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:syndicate/config/theme.dart';
import 'package:syndicate/screens/customers_screen.dart';
import 'package:syndicate/screens/home_screen.dart';
import 'package:syndicate/screens/record_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Curved Novigation Bar',
      theme: theme(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static int selectedpage = 0; //initial value

  final _pageOptions = [
    HomeScreen(),
    CustomerScreen(),
    RecordScreen(),
  ]; // listing of all 3 pages index wise
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pageOptions[
          selectedpage], // initial value is 0 so HomePage will be shown
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          height: 60,
          color: Colors.black,
          buttonBackgroundColor: Colors.green,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.linearToEaseOut,
          items: const <Widget>[
            Icon(
              Icons.home,
              size: 30,
            ),
            Icon(
              Icons.people,
              size: 30,
            ),
            Icon(
              Icons.book,
              size: 30,
            )
          ],
          onTap: (index) {
            setState(() {
              selectedpage =
                  index; // changing selected page as per bar index selected by the user
            });
          },
        ),
      ),
    );
  }
}
