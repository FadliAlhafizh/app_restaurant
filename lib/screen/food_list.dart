import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';

class ListFood extends StatelessWidget {
  const ListFood({Key? key, required this.resto}) : super(key: key);

  static const routeName = '/food_list';

  final Restaurants resto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: resto.menus.foods.map((foods) {
        return SizedBox(
          width: 150,
          height: 200,
          child: Card(
            elevation: 2,
            child: Column(
              children: [
                Container(
                    color: Colors.blueAccent,
                    height: (MediaQuery.of(context).size.height * 0.1)),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(foods.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2),
                ),
              ],
            ),
          ),
        );
      }).toList()),
    );
  }
}
