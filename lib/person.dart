import 'package:flutter/material.dart';
import 'package:grindernt/message.dart';

class Person {
  String name;
  String bio;
  ImageProvider picture;
  String id;
  bool isFavorite = false;

  List<Message> messages = [];

  int get last_message {
    return messages.isEmpty ? 0 : messages.last.timestamp;
  }

  Person(this.name, this.bio, this.picture, this.id,
      [List<String> fakeMsgs = const []]) {
    messages.addAll([
      for (var fakeMsg in fakeMsgs)
        Message(this, fakeMsg, DateTime.now().millisecondsSinceEpoch)
    ]);
  }
}
