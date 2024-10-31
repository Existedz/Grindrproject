import 'person.dart';

class Message {
  int timestamp;
  String content;
  Person from;

  Message(this.from, this.content, this.timestamp);
}
