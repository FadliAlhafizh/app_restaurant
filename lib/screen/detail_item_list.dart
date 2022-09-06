import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/widget/styles.dart';

class DetailListItem extends StatefulWidget {
  const DetailListItem({Key? key, required this.restaurants}) : super(key: key);

  static const routeName = '/detail_item_list';

  final Restaurants restaurants;

  @override
  State<DetailListItem> createState() => _DetailListItemState();
}

class _DetailListItemState extends State<DetailListItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      body: _buildDetail(context),
    );
  }

  Widget _buildDetail(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurants.id,
                child: Image.network(widget.restaurants.pictureId),
              ),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: firstColor,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    )
                  ],
                ),
              )
            ],
          ),
          _buildCardName(),
          _buildDescription(),
          _buildMenus()
        ],
      ),
    );
  }

  Widget _buildCardName() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.restaurants.name,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text('Location:'),
              Icon(
                Icons.location_on,
                color: Colors.red[400],
              ),
              Text(widget.restaurants.city)
            ],
          ),
          Row(
            children: [
              const Text('Rating: '),
              const Icon(
                Icons.star_rate_rounded,
                color: Colors.yellow,
              ),
              const SizedBox(width: 4),
              Text(
                widget.restaurants.rating.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Description',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            widget.restaurants.description,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  Widget _buildMenus() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Menus',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Foods',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.94,
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: widget.restaurants.menus.foods.map((foods) {
                  return SizedBox(
                    width: 150,
                    height: 200,
                    child: Card(
                      elevation: 2,
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.10,
                            child: Image.network(
                                fit: BoxFit.cover,
                                'https://i.pinimg.com/564x/5b/ce/90/5bce9017cc10547022b479d9ea1808c8.jpg'),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(foods.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText2),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Drink',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.94,
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: widget.restaurants.menus.drinks.map((drinks) {
                  return SizedBox(
                    width: 150,
                    height: 200,
                    child: Card(
                      elevation: 2,
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.09,
                            child: Image.network(
                                fit: BoxFit.cover,
                                'https://i.pinimg.com/564x/c3/20/aa/c320aa6d2d3f0f66ebb02c449576a41e.jpg'),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(drinks.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText2),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList()),
          ),
        ],
      ),
    );
  }
}
