import 'package:flutter/material.dart';
import 'package:grindernt/conv_model.dart';
import 'package:grindernt/profile.dart';
import 'package:provider/provider.dart';
import 'profile.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<ConvModel>(context)
            .people
            .values
            .where((p) => p.isFavorite)
            .isEmpty
        ? Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'You have no faves.',
            ),
          )
        : GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8),
            padding: EdgeInsets.all(8),
            children: Provider.of<ConvModel>(context)
                .people
                .values
                .where((p) => p.isFavorite)
                .map(
                  (p) => GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => ProfilePage(id: p.id))),
                    child: Container(
                      color: Colors.transparent,
                      child: Image(
                        image: p.picture,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )
                .toList(),
          );
  }
}
