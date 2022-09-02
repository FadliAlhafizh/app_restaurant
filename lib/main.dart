import 'package:flutter/material.dart';
import 'package:restaurant_app/screen/home_page.dart';
import 'package:restaurant_app/widget/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: secondColor,
            onPrimary: thirdColor,
            secondary: fourthColor),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(elevation: 0.5),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Restaurant App',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
      },
    );
  }
}
