import 'package:flutter/material.dart';
import 'package:grindernt/conversation.dart';
import 'person.dart';
import 'message.dart';
import 'package:nanoid/nanoid.dart';

class ConvModel extends ChangeNotifier {
  Person self = Person("Thaponsak", "You can call me nut im very gay",
      const AssetImage("assets/images/thaponsak.jpg"), nanoid(10));

  Map<String, Person> people = {
    for (var p in [
      Person(
          "Nutthawit",
          "Hello, I'm Nutthawit, you can call me Toto. I like gay.",
          const AssetImage("assets/images/toto.jpg"),
          nanoid(10),
          ["Do you wanna get lunch?"]),
      Person(
          "Krissada",
          "my name eart, looking for sugar daddy",
          const AssetImage("assets/images/eart.jpg"),
          nanoid(10),
          ["Hey daddy"]),
      Person("Chatchawee", "I boss want to eat hotdog",
          const AssetImage("assets/images/boss.jpg"), nanoid(10)),
      Person("Shuncey", "I'm not gay.",
          const AssetImage("assets/images/shun.jpg"), nanoid(10))
    ])
      p.id: p
  };

  void sendMsg(String id, String content) {
    people[id]!
        .messages
        .add(Message(self, content, DateTime.now().millisecondsSinceEpoch));

    notifyListeners();
  }

  void toggleFavorite(String id) {
    people[id]!.isFavorite = !people[id]!.isFavorite;
    notifyListeners();
  }
}
