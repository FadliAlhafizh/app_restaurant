import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/widget/platform_widget.dart';

class ListRestaurant extends StatefulWidget {
  const ListRestaurant({Key? key}) : super(key: key);

  @override
  State<ListRestaurant> createState() => _ListRestaurantState();
}

class _ListRestaurantState extends State<ListRestaurant> {
  Widget _buildList(BuildContext context) {
    return FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurant = parseRestaurant(snapshot.data);
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return _buildItem(context, restaurant[index]);
            },
          );
        });
  }

  Widget _buildItem(BuildContext context, Restaurant restaurant) {
    return Material(
      child: ListTile(
        title: Text(restaurant.name),
        subtitle: Text(restaurant.description),
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Terbaik'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      child: _buildList(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
