import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/screen/detail_item_list.dart';
import 'package:restaurant_app/widget/platform_widget.dart';
import 'package:restaurant_app/widget/styles.dart';

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
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            final List<Restaurants> restau = parseRestaurant(snapshot.data!);
            return ListView.builder(
              itemCount: restau.length,
              itemBuilder: (context, index) {
                return _buildItem(context, restau[index]);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      },
    );
  }

  Widget _buildItem(BuildContext context, Restaurants resto) {
    return Material(
      color: secondColor,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
            tag: resto,
            child: Image.network(
              resto.pictureId,
              fit: BoxFit.cover,
              width: 100,
            )),
        title: Text(
          resto.name,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: fourthColor),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 18,
                  color: Colors.red[400],
                ),
                const SizedBox(width: 4),
                Text(
                  resto.city,
                  style: const TextStyle(color: fourthColor),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.star_rate_rounded,
                  size: 16,
                  color: Colors.yellow,
                ),
                const SizedBox(width: 4),
                Text(
                  resto.rating.toString(),
                  style: const TextStyle(color: fourthColor),
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, DetailListItem.routeName,
              arguments: resto);
        },
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
