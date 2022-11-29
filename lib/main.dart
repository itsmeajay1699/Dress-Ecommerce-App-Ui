import 'package:ecommerce/app_styles.dart';
import 'package:ecommerce/screen/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:floating_navigation_bar/floating_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int current = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const MainPage(),
        bottomNavigationBar: FloatingNavigationBar(
          backgroundColor: Colors.black,
          iconColor: kWhite,
          textStyle: const TextStyle(color: kWhite, fontSize: 14),
          iconSize: 20,
          items: [
            NavBarItems(
                icon: current == 0 ? Icons.home : Icons.home_max_outlined,
                title: "Home"),
            NavBarItems(
                icon: current == 1 ? Icons.search_off : Icons.search,
                title: "Search"),
            NavBarItems(
                icon: current == 2
                    ? Icons.shopping_cart
                    : Icons.shopping_bag_outlined,
                title: "Cart"),
            NavBarItems(
                icon: current == 3 ? Icons.favorite : Icons.favorite_border,
                title: "Profile"),
          ],
          onChanged: (value) {
            setState(() {
              current = value;
            });
          },
        ),
      ),
    );
  }
}
// NavBarItems(icon: EvaIcons.homeOutline, title: "Home"),