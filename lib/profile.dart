import 'package:flutter/material.dart';
import 'package:grindernt/conv_model.dart';
import 'package:provider/provider.dart';
import 'message_page.dart';

class ProfilePage extends StatefulWidget {
  final String id;
  const ProfilePage({Key? key, this.id = ""}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String msgContent = "";
  var inp_ctl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ConvModel>(context, listen: false)
                    .toggleFavorite(widget.id);
              },
              icon:
                  Provider.of<ConvModel>(context).people[widget.id]!.isFavorite
                      ? Icon(Icons.star)
                      : Icon(Icons.star_outline))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image(
                    fit: BoxFit.cover,
                    image: Provider.of<ConvModel>(context)
                        .people[widget.id]!
                        .picture),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      Provider.of<ConvModel>(context).people[widget.id]!.name,
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                Text(
                  Provider.of<ConvModel>(context).people[widget.id]!.bio,
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => MessagePage(id: widget.id)));
          },
          child: Icon(
            Icons.message,
            color: Colors.black87,
          )),
    );
  }
}

// Image(
//                       image: Provider.of<ConvModel>(context)
//                           .people[widget.id]!
//                           .picture)