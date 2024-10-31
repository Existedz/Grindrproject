import 'package:flutter/material.dart';
import 'package:grindernt/conv_model.dart';
import 'package:grindernt/conversation.dart';
import 'package:grindernt/message_page.dart';
import 'package:provider/provider.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ConvModel>(builder: (ctx, c, child) {
      var asList = c.people.values.toList();
      asList.sort((a, b) => b.last_message.compareTo(a.last_message));

      return Column(
        children: [
          for (var p in asList)
            if (p.last_message != 0)
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => MessagePage(id: p.id))),
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            foregroundImage: p.picture,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p.name,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Text(
                                  p.messages.last.content,
                                  style: const TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ),
        ],
      );
    });
  }
}
