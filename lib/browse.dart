import 'package:flutter/material.dart';
import 'package:grindernt/conv_model.dart';
import 'package:grindernt/profile.dart';
import 'package:provider/provider.dart';
import 'profile.dart';

class Browse extends StatefulWidget {
  const Browse({super.key});

  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8),
      padding: EdgeInsets.all(8),
      children: Provider.of<ConvModel>(context)
          .people
          .values
          .map(
            (p) => GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => ProfilePage(id: p.id))),
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
