import 'package:flutter/material.dart';
import 'package:grindernt/conv_model.dart';
import 'package:provider/provider.dart';

class MessagePage extends StatefulWidget {
  final String id;
  const MessagePage({Key? key, this.id = ""}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  String msgContent = "";
  var inp_ctl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: Provider.of<ConvModel>(context, listen: false)
                    .people[widget.id]!
                    .picture,
              ),
            ),
            Text(
                Provider.of<ConvModel>(context, listen: false)
                    .people[widget.id]!
                    .name,
                style: const TextStyle(fontSize: 24))
          ],
        ),
      ),
      body: Column(children: [
        Expanded(
          child: ListView(
            children: Provider.of<ConvModel>(context)
                .people[widget.id]!
                .messages
                .map((m) => Row(
                      mainAxisAlignment: m.from.id == widget.id
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              color: m.from.id == widget.id
                                  ? Color(0xdd64ceff)
                                  : Color(0xddfac70b),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(m.content),
                              ),
                            ),
                          ),
                        )
                      ],
                    ))
                .toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: inp_ctl,
            onChanged: (v) {
              setState(() {
                msgContent = v;
              });
            },
            decoration: InputDecoration(
                hintText: "Say something...",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: msgContent.isEmpty
                      ? null
                      : () {
                          Provider.of<ConvModel>(context, listen: false)
                              .sendMsg(widget.id, msgContent);
                          setState(() {
                            inp_ctl.clear();
                          });
                        },
                  icon: Icon(Icons.send),
                  disabledColor: Colors.grey,
                )),
          ),
        )
      ]),
    );
  }
}
