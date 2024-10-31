import 'person.dart';
import 'message.dart';

class Conversation {
  String id;
  Person withPerson;
  List<Message> messages = [];

  Conversation(this.withPerson, this.messages, this.id);
}
